variable "dcsize" {
  description = "Size for all DC VMs"
  default     = "Standard_D2s_v4"
}
variable "dcadmin" {
  description = "Admin username for all DC VMs"
  default     = "vmadmin"
}
variable "regions" {
  description = "Locations and CIDR Ranges"
  type        = map(any)
  default = {
    location1 = {
      location = "uksouth"
      vnetcidr = ["10.10.0.0/16"]
      snetcidr = ["10.10.1.0/24"]
    }
  }
}