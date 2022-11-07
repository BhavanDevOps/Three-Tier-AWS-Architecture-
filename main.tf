#Terraform Block
terraform {
  required_providers{
    aws={
        source="hashicotp/aws"
        version="~>3.0"
    }
  }
}
#Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
}