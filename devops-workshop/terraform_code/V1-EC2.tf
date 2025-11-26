provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "demo-server" {
    ami = "ami-0fa3fe0fa7920f68e"
    instance_type = "t3.micro"
    tags = {
      Name = "Demo-Server"
    }
    key_name = "dp-key"
  
}