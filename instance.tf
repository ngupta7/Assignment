resource "aws_instance" "example1" {
  ami           = "${var.AMIS}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "subnet-45321718"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "prdsvc"

 # userdata
 user_data = data.template_cloudinit_config.cloudinit-example.rendered 

}
resource "aws_instance" "example2" {
  ami           = "${var.AMIS}"
  instance_type = "t3.micro"

  # the VPC subnet
  subnet_id = "subnet-45321718"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "prdsvc"
  
 #userdata
 user_data = data.template_cloudinit_config.cloudinit-example.rendered
}
resource "aws_instance" "example3" {
  ami           = "${var.AMIS}"
  instance_type = "i3.large"

  # the VPC subnet
  subnet_id = "subnet-45321718"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "prdsvc"

 #userdata
 user_data = data.template_cloudinit_config.cloudinit-example.rendered
}
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1a"
  size              = 1
  type              = "gp2"
  tags = {
    Name = "extra volume log"
  }
}
resource "aws_ebs_volume" "ebs-volume-2" {
  availability_zone = "us-east-1a"
  size              = 2
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}
resource "aws_ebs_volume" "ebs-volume-3" {
  availability_zone = "us-east-1b"
  
  size              = 1
  type              = "gp2"
  tags = {
    Name = "extra volume log"
  }
}
resource "aws_ebs_volume" "ebs-volume-4" {
  availability_zone = "us-east-1b"
  size              = 2
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}
resource "aws_ebs_volume" "ebs-volume-5" {
  availability_zone = "us-east-1c"
  size              = 1
  type              = "gp2"
  tags = {
    Name = "extra volume log"
  }
}
resource "aws_ebs_volume" "ebs-volume-6" {
  availability_zone = "us-east-1c"
  size              = 2
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.example1.id
}
resource "aws_volume_attachment" "ebs-volume-2-attachment" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.ebs-volume-2.id
  instance_id = aws_instance.example1.id
}
resource "aws_volume_attachment" "ebs-volume-3-attachment" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs-volume-3.id
  instance_id = aws_instance.example2.id
}
resource "aws_volume_attachment" "ebs-volume-4-attachment" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.ebs-volume-4.id
  instance_id = aws_instance.example2.id
}
resource "aws_volume_attachment" "ebs-volume-5-attachment" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs-volume-5.id
  instance_id = aws_instance.example3.id
}
resource "aws_volume_attachment" "ebs-volume-6-attachment" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.ebs-volume-6.id
  instance_id = aws_instance.example3.id
}
