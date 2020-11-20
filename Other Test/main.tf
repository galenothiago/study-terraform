# Profile = "default" takes Access key ID and Secret access key from file in ~/.aws/credentials created by command 'aws comfigure' (AWS CLI)
# Other ways is shared_credentials_file = "/Users/tf_user/.aws/creds" profile = "customprofile"

provider "aws" {
  profile = "default"
  region  = "us-east-2"
  version = "~> 3.8"
}


resource "aws_instance" "example" {
  ami           = "ami-08ee2516c7709ea48"
  instance_type = "t2.micro"
}


resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
