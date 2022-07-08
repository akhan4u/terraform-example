data "aws_vpc" "selected" {
  default = true
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.selected.id
}

resource "tls_private_key" "ec2" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "ec2" {
  key_name   = "terraform-ec2-key"
  public_key = tls_private_key.ec2.public_key_openssh
}

resource "aws_security_group" "ec2_access" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }

}

resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.ubuntu.image_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ec2.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_access.id]
  subnet_id                   = tolist(data.aws_subnet_ids.private.ids)[0]
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  tags = {
    Name = "EC2 demo instance"
  }
}
