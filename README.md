# azure-finops
This repository contains Azure ARM templates to create runbooks that run scripts aimed at cost optimization

## Prerequisites 
* All scripts assume an automation account was created and it has a service principal assigned to it.  
* the user running the template must be an automation contributor or owner.

Deploy to azure Hybrid benefit(SQL-Managed instance) policy:         
[![Deploy to azure Hybrid benefit(SQL-Managed instance)](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2fmain%2FARM_templates%2Fhybrid_benefit_SQL_managed_instance%2Fhybrid_benefit_SQL_managed_instance.json)



Deploy to azure Hybrid benefit(SQL) policy:      
[![Deploy to azure Hybrid benefit(SQL) policy](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2fmain%2FARM_templates%2Fhybrid_benefit_SQL%2Fhybrid_benefit_sql.json)


Deploy to azure Hybrid benefit(Vms) policy:   
[![Deploy to azure Hybrid benefit(Vms) policy](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2fmain%2FARM_templates%2Fhybrid_benefit_policy%2FARM_for_hybrid_benefit.json)

Deploy to Azure tag last modified:      
[![Deploy To Azure tag last modified](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Ftag_last_modified%2Ftag_last_modified_past2weeks_arm-template.json)


Deploy to Azure tag created by and created on date:   
[![Deploy To Azure created by and created on date](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Ftag_createdBy_createdOnDate%2Ftag_createdBy_createdOnDate_arm-template.json)


Deploy to Azure delete unAttached Disks and deallocated Vms:   
[![Deploy To Azure delete unAttached Disks and deallocated VMs](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Fdelete_unAttachedDisks_deallocatedVMs%2Fdelete_unAttachedDisks_deallocatedVMs_arm-template.json)


Deploy to Azure right sizing:   
[![Deploy To Azure right_sizing](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Fright_sizing%2Fright_sizing_arm-template.json)


Deploy to Azure cpu & memory utilization:   
[![Deploy To Azure cpu & memory utilization](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Fcpu_memory_utilization%2Fcpu_memory_utilization_arm-template.json)

Deploy To Azure tag unattached:  
[![Deploy To Azure tag unattached](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Ftag_deallocated%2FTagDeallocatedVmsAndDisks_arm_runbook.json)

Deploy To Azure get unused subscriptions:  
[![Deploy To Azure get unused subscriptions](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Funused_subscriptions%2FGet-UnusedSubscriptions_arm_runbook.json)

Deploy To Azure tag resourtces with created at timestamp:  
[![Deploy To Azure find unused subscriptions](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Ftag_created_at%2Ftag_create_at_arm.json)
