
variable "frontend_instance_type" {}
     
  variable "node_instance_count" {
    default =1
   }
 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-2"
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] 
   ipv6_cidr_blocks = ["::/0"]
}   

}


resource "aws_instance" "Enny_server" {
  ami           = "ami-0b45ae66668865cd6"
  instance_type = "t2.micro"
key_name = "testkey"
vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "Enny"


}
}
resource "aws_instance" "lanre_server" {
  ami           = "ami-0b45ae66668865cd6"
  instance_type = "t2.micro"
key_name = "testkey"
vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "lanre"


}
}
    

  

