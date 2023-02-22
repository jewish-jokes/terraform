provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "ec2_instance" {
  ami = "ami-0c0d3776ef525d5dd"
  instance_type = "t2.micro"
  user_data = file("start-node.js-container.sh")
  vpc_security_group_ids = [aws_security_group.ec2_instance-sg.id]

  tags = {
    Name = "my_ec2_instance"
  }
}

resource "aws_security_group" "ec2_instance-sg" {
  name = "my_ec2_instance-sg"

  ingress = {
    to_port = 80
    from_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress =  {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  } 
}