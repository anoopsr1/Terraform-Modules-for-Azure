## Azure Identity Resources

The aim of this module is to provide a simple way to deploy the following elements within each required Region:

    1. A Resource Group for Identity Resources.
    2. A KeyVault for the automatically generated Passwords - note, this is only in the first Region. 
    3. An Availability Set for Domain Controllers.
    4. An Identity VNET and Subnet.
    5. 2x IaaS Virtual Machines to be used as Domain Controllers, each with a 20GB disk for NTDS Data (without caching).
    6. A Recovery Services Vault to backup the Domain Controllers to.
    7. A Log Analytics Workspace to Store Log Data in.

To use this module, update the variables (in azuredeploy.tf) as per the below:

 ### Global Variables
    dcsize       = "Standard_D2s_v4"      # This sets the Size of the VMs deployed
    dcadmin      = "vmadmin"              # This sets the admin username of the VMs deployed

Note, the VM Password is created automatically by a randomly generated string. The KeyVault is deployed in the first Azure Region defined in the Regional Variables Map. 

 ### Region Specific Variables

Update the below (in azuredeploy.tf) with additional (or less) regions as required. You can add as many as required and the Module will deploy resources to each Region specified. 

    regions = {
        region1 = {
        location = "uksouth"
        vnetcidr = ["10.10.0.0/16"]
        snetcidr = ["10.10.1.0/24"]
        }
        region2 = {
        location = "eastus"
        vnetcidr = ["10.11.0.0/16"]
        snetcidr = ["10.11.1.0/24"]
        }
    }
