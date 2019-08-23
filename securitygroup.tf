resource "aws_security_group" "allow-ssh" {
  vpc_id = "vpc-652c811e"
  name = "allow-athena-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/8"]
  } 
}
