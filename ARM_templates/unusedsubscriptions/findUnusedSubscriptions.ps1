######################################################################################################################

#  Copyright 2021 CloudTeam & CloudHiro Inc. or its affiliates. All Rights Reserved.                                 #

#  You may not use this file except in compliance with the License.                                                  #

#  https://www.cloudhiro.com/AWS/TermsOfUse.php                                                                      #

#  This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES                                                  #

#  OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions    #

#  and limitations under the License.                                                                                #

######################################################################################################################

Param (
    # Default parameter for connection with azure
    [String]$ConnectionName = 'AzureRunAsConnection',
    # Default paramters using the runbooks variables
    [String]$ExcludeSubscriptions = $(Get-AutomationVariable -Name 'EXCLUDED_SUBSTRICTIONS'),
    [String]$BlobContainer = $(Get-AutomationVariable -Name 'BLOB_CONTAINER'),
    [String]$ConnectionString = $(Get-AutomationVariable -Name 'CONNECTION_STRING'),
    [Int]$Minutes = $(Get-AutomationVariable -Name 'MINUTES'),
    [Int]$Hours = $(Get-AutomationVariable -Name 'HOURS'),
    [Int]$Days = $(Get-AutomationVariable -Name 'DAYS')
)

# Authenticate to Azure using the Azure Automation RunAs service principal and adding the account to the session 
$runAsConnection = Get-AutomationConnection -Name $ConnectionName -ErrorAction Stop
Add-AzAccount -ServicePrincipal -Tenant $runAsConnection.TenantId -ApplicationId $runAsConnection.ApplicationId `
    -CertificateThumbprint $runAsConnection.CertificateThumbprint -ErrorAction Stop | Out-Null

# Getting excluded subscriptions names from runbook variable
$excludedSubscriptions = @(foreach ($sub in $ExcludeSubscriptions.Split(',')) {$sub.Trim()})

# Get object of a date by the number of minutes/hours/days specified
$date = $($($(Get-Date).AddDays(-$Days)).AddHours(-$Hours)).AddMinutes(-$Minutes)

try {
    # Initialzie the blob stprage connection using the connection string parameter
    $blobStorageContext = New-AzStorageContext -ConnectionString $ConnectionString
    # Get the current time by timezone
    $currentTime = [System.TimeZoneInfo]::ConvertTimeFromUtc($($(Get-Date).ToUniversalTime()), $([System.TimeZoneInfo]::GetSystemTimeZones() | Where-Object {$_.Id -match "Israel"}))
    # Creating the name of the CSV file blob
    $blobName = $("unused_subscriptions_$(Get-Date -Date $currentTime -Format 'dd-MM-yyyy_HH:mm:ss').csv")
    # Craeting the temporary local CSV file
    New-Item -Name "tempFile.csv" -ItemType File -Force | Out-Null
    # Copying the the temporary CSV file to the blob storage container as an append blob
    Set-AzStorageBlobContent -File ".\tempFile.csv" -Blob $blobName -Container $BlobContainer -BlobType Append -Context $blobStorageContext -Force | Out-Null
    # Get the CSV file blob from the container in the storage account
    $blobStorage = Get-AzStorageBlob -Blob $blobName -Container $BlobContainer -Context $blobStorageContext
    # Add the header to the CSV file
    $blobStorage.ICloudBlob.AppendText("subscription_name`n")

    $subscriptionsList = @()
    $subscriptionsListExcluded = @()
    # Get all subscriptions that the account can access and their State is Enabled, after that iterate over them
    Get-AzSubscription | Where-Object {$_.State -eq 'Enabled'} | ForEach-Object {
        # If the subscription not in the excluded subscription list get it id and name
        if ($_.Name -notin $excludedSubscriptions) {
            $subscriptionsList += [PSCustomObject]@{
                subscription_id = $_.Id
                subscription_name = $_.Name
            }
        # Else get the excluded subscription name only
        } else {
            $subscriptionsListExcluded += $_.Name
        }
    }

    # Print to the screen the number of excluded subscriptions and the subscriptions themselves 
    Write-Output "Number of excluded subscriptions: $($subscriptionsListExcluded.Length)`n`rExcluded subscriptions names: $($subscriptionsListExcluded -join ', ')"
    # Print to the screen the number of subscriptions and the subscriptions themselves 
    Write-Output "Number of subscriptions: $($subscriptionsList.Length)`n`rSubscriptions names: $($subscriptionsList.subscription_name -join ', ')"

    # If subscriptions have benn found for checking the logs
    if ($subscriptionsList) {
        # Loop over the subscriptions
        foreach ($sub in $subscriptionsList) {
            # Initialze an empty logs variable for populating each iteration if needed
            $logs = $null
            # Set the current Azure subscription for use
            $azContext = Set-AzContext -SubscriptionId $sub.subscription_id -Force -ErrorAction SilentlyContinue
            
            # Checki if the current subscription id equal to the one from the current iteration varaible
            if ($azContext.Subscription.Id -eq $sub.subscription_id) {
                Write-Output "Checking activity logs of subscription: $($sub.subscription_name)"

                # Get the activity logs in the current subscription by:
                # If the 'caller' username is in the format of an Azure AD user principal name
                # If the event dictionary have the user ip address and a user full name
                $logs = Get-AzActivityLog -StartTime $date -WarningAction SilentlyContinue | 
                Where-Object {$_.Caller -like "*@*.*" -and $_.Claims.Content.ContainsKey('name') -and $_.Claims.Content.ContainsKey('ipaddr')}
            } else {
                # If failed to set/cange to the subscription in the current iteration varaible
                Write-Output "Failed to set/change subscription $($sub.subscription_name) with id $($sub.subscription_id)"
            }

            # Check if activity logs were found
            if ($logs) {
                # If activity logs were found append to the CSV file
                $blobStorage.ICloudBlob.AppendText("$($sub.subscription_name)`n")
            } else {
                # If no activity logs were
                Write-Output "No activity logs or modification from $date were found in subscription: $($sub.subscription_name)"
            }
        }
    } else {
        Write-Output "No subscriptions have been found or all subscriptions are excluded"
    }
} catch  {
    throw "$($Error[0].Exception.Message)"
} finally {
    # Get the current time by timezone
    $currentTime = [System.TimeZoneInfo]::ConvertTimeFromUtc($($(Get-Date).ToUniversalTime()), $([System.TimeZoneInfo]::GetSystemTimeZones() | Where-Object {$_.Id -match "Israel"}))
    Write-Output "`nScript execution finished at $(Get-Date -Date $currentTime -Format "dd/MM/ss HH:mm:ss")"
}