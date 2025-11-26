provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "demo-server" {
    ami = "ami-0fa3fe0fa7920f68e"
    instance_type = "t3.micro"
    security_groups = [ "demo-sg" ]
    tags = {
      Name = "Demo-Server"
    }
    key_name = "dp-key"
  }

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Access"
  tags = {
    Name = "SSH-Access"
  }


   ingress {
    description = "SSH-Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
    Name = "demo-sg"
   }

}