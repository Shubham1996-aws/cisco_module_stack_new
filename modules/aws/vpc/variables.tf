variable "vpn_range" {
  type = list(string)
  default = [ ""]
}
variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
}
variable "publicSubnets1_cidr_block" {
    type = string
    default = "10.0.10.0/24"
}
variable "publicSubnets2_cidr_block" {
    type = string
    default = "10.0.20.0/24"
}
variable "privateSubnets1_cidr_block" {
    type = string
    default = "10.0.30.0/24"
}
variable "privateSubnets2_cidr_block" {
    type = string
    default = "10.0.40.0/24"
}
variable "instanceCount" {
    type = number
    default = 1
}

variable "environment" {
    type = string
    default = "testing"
}
locals {
    common_tags = {
        DataTaxonomy = "Cisco Operatoins Data"
        Environment = var.environment
        OwnerName = ""
        ResourceOwner = ""
        Security_Compliance = "yes"
        ServiceName        = "Security-stack"
    }
}
