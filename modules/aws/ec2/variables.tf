variable "subnet_id" {
  type = string
}

variable "instance_type" {
    type = string
    default = ""
}

variable "ami_id" {
    type = string
    default = "ami-017c001a88dd93847"
}

variable "instanceCount" {
    type = number
}

variable "eip_association_id" {
    type = string
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
