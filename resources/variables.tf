variable "region" {
    type = string
    default = "us-west-1"
}

variable "profile" {
    type = string
    default = "shubham"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "instanceCount" {
    type = number
    default = 1
}
variable "environment" {
    type = string
    default = "testing"
}
variable "bucket_name" {
  type = string
  default = "cml-aws-srs"
}
