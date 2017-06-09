#####################################################################
# AWS Access 
##
variable "aws_access_key" { default = "" }
variable "aws_secret_key" { default = "" }
#variable "aws_key_name" { }
variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}

variable "environment" {
  type    = "string"
  default = "dev"
}

