# Azure-Finops
This repository contains Azure ARM templates to create runbooks that run scripts aimed at cost optimization

## Prerequisites 
  All scripts assume an automation account was created and it has a service principal assigned to it.  
  the user running the template must be an automation contributor or owner.





<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">ARM-Templates - Policies</a>
      <ul>
        <li><a href="#built-with">Hybrid benefit(SQL-Managed instance)</a></li>
        <li><a href="#built-with">Hybrid benefit(SQL)</a></li>
        <li><a href="#built-with">Hybrid benefit(Vms)</a></li>
        <li><a href="#built-with">Tag resources with created at timestamp</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">ARM-Templates - Runbooks</a>
      <ul>
        <li><a href="#prerequisites">Auto Scale Vmss</a></li>
        <li><a href="#installation">Tag last modified</a></li>
        <li><a href="#installation">Tag reserved disks and deallocated Vms</a></li>
        <li><a href="#installation">Delete reserved disks and deallocated Vms</a></li>
        <li><a href="#installation">Right sizing(Vms)</a></li>
        <li><a href="#installation">Cpu & Memory Utilization(Vms)</a></li>
        <li><a href="#installation">Get Unused Subscriptions</a></li>
      </ul>
    </li>
  </ol>
</details>


## ARM-Templates - Policies

 Deploy to azure Hybrid benefit(SQL-Managed instance) policy:
    <details>
    <summary>Description</summary>
    <ol>
    This template implement policy at management group scope to to force Hybrid benefit for Managed SQL instance.  
    </ol>
    </details>         

[![Deploy to azure Hybrid benefit(SQL-Managed instance)](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2fmain%2FARM_templates%2Fhybrid_benefit_SQL_managed_instance%2Fhybrid_benefit_SQL_managed_instance.json)

 Deploy to azure Hybrid benefit(SQL) policy:
    <details>
    <summary>Description</summary>
    <ol>
    This template implement policy at management group scope to to force Hybrid benefit for SQL Databases.  
    </ol>
    </details> 

[![Deploy to azure Hybrid benefit(SQL) policy](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2fmain%2FARM_templates%2Fhybrid_benefit_SQL%2Fhybrid_benefit_sql.json)


  Deploy to azure Hybrid benefit(Vms) policy:
    <details>
    <summary>Description</summary>
    <ol>
    This template implement policy at management group scope to to force Hybrid benefit for Vms and Vmss  
    </ol>
    </details>

[![Deploy to azure Hybrid benefit(Vms) policy](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2fmain%2FARM_templates%2Fhybrid_benefit_policy%2FARM_for_hybrid_benefit.json)

  Deploy To Azure tag resources with created at timestamp:
    <details>
    <summary>Description</summary>
    <ol>
    This template implement policy at management group scope to to force resources that are created with a tag name "Created_at" and tag value of the date he was created.
    </ol>
    </details>

[![Deploy To Azure find unused subscriptions](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Ftag_created_at%2Ftag_create_at_arm.json)


## ARM-Templates - Runbooks

  Deploy to azure Auto Scale Vmss:            
    [![Deploy to azure Auto Scale Vmss](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2fmain%2FARM_templates%2Fauto_scale_vmss%2FarmTemplateAutoScaleVMSSRunbook.json)

  Deploy to Azure tag last modified:
<details>
  <summary>Description</summary>
  <ol>
This template implement a runbook  that look for Vms and Disks who got modified in the past two weeks and tag them with tag name "last_modified" with tag value of the Caller id.
  </ol>
</details>

[![Deploy To Azure tag last modified](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Ftag_last_modified%2Ftag_last_modified_past2weeks_arm-template.json)

  Deploy to Azure tag reserved disks and deallocated Vms:  
<details>
  <summary>Description</summary>
  <ol>
This template implement a runbook  that look for Vms that in "deallocated/stopped" state over X days and tag them with tag "Candidate - DeleteMe" and all the disks with over X size related to the vm also with "Candidate - DeleteMe".
  </ol>
</details>

[![Deploy To Azure tag unattached disks and deallocated VMs](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Ftag_unattached_disks_and_vms%2Ftag_unattached_disks_and_vms-ARM.json)


  Deploy to Azure delete reserved disks and deallocated Vms:  
<details>
  <summary>Description</summary>
  <ol>
This template implement a runbook  that look for vms and disks with tag "Candidate - DeleteMe" and delete them.
  </ol>
</details>

[![Deploy To Azure delete unattached disks and deallocated VMs](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Fdelete_unattached_disks_and_vms%2Fdelete_unattched_disks_and_vms-ARM.json)


  Deploy to Azure tag created by and created on date:   
[![Deploy To Azure created by and created on date](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Ftag_createdBy_createdOnDate%2Ftag_createdBy_createdOnDate_arm-template.json)

  Deploy to Azure right sizing:   
[![Deploy To Azure right_sizing](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Fright_sizing%2Fright_sizing_arm-template.json)


  Deploy to Azure cpu & memory utilization:   
[![Deploy To Azure cpu & memory utilization](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Fcpu_memory_utilization%2Fcpu_memory_utilization_arm-template.json)

  Deploy To Azure get unused subscriptions:  
<details>
  <summary>Description</summary>
  <ol>
This template implement a runbook script that loops over all the subscriptions and looks for activity logs of users with full user principal names and IP addresses to validate if the subscriptions have been in use in the time defined.
If unused subscriptions have been found the script exports them to a CSV file in the configured blobs accounts.
  </ol>
</details>

[![Deploy To Azure get unused subscriptions](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2Fmain%2FARM_templates%2Funused_subscriptions%2FGet-UnusedSubscriptions_arm_runbook.json)



<!-- Deploy to azure Multiple ARM Templates Policies(Hybrid Benefit SQL/Vm/Vmss/Managed-SQL + Created at tag):            
[![Deploy to azure Multiple ARM Templates Policies](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudHiro%2Fazure-finops%2fmain%2FARM_templates%2Fmultiple_arm_polices%2Fmultiple_arm_templates_policies.json) -->