# azure-finops
This repository contains Azure ARM templates to create runbooks that run scripts aimed at cost optimization

## Prerequisites 
* All scripts assume an automation account was created and it has a service principal assigned to it.  
* the user running the template must be an automation contributor or owner.



Deploy to Azure delete unAttached Disks and deallocated Vms:

[![Deploy To Azure delete unAttached Disks and deallocated VMs](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Fdelete_unAttachedDisks_deallocatedVMs%2Fdelete_unAttachedDisks_deallocatedVMs_arm-template.json)


Deploy to Azure right sizing:

[![Deploy To Azure right_sizing](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Fright_sizing%2Fright_sizing_arm-template.json)


Deploy to Azure cpu & memory utilization:

[![Deploy To Azure cpu & memory utilization](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Fcpu_memory_utilization%2Fcpu_memory_utilization_arm-template.json)

Deploy To Azure tag unattached:  
[![Deploy To Azure tag unattached](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Ftag_deallocated%2FTagDeallocatedVmsAndDisks_arm_runbook.json)

Deploy To Azure find unused subscriptions:  
[![Deploy To Azure find unused subscriptions](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Funusedsubscriptions%2FfindUnusedSubscriptions_arm_runbook.json)

Deploy To Azure tag resourtces with created at timestamp:  
[![Deploy To Azure find unused subscriptions](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Ftag_created_at%2Ftag_create_at_arm.json)
