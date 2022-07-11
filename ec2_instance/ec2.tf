resource "tls_private_key" "ec2" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "ec2" {
  key_name   = "${var.instance_name}-${var.environment}"
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
    Name        = "allow_ssh"
    Environment = var.environment
  }
}

resource "aws_instance" "ec2" {
  ami                         = lookup(var.ec2_details, var.aws_region)
  instance_type               = var.instance_type
  associate_public_ip_address = var.instance_public
  key_name                    = aws_key_pair.ec2.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_access.id]
  subnet_id                   = tolist(data.aws_subnet_ids.private.ids)[0]
  root_block_device {
    volume_size = var.root_ebs_size
    volume_type = var.root_ebs_type
  }
  tags = {
    Name        = "${var.instance_name}-${var.environment}"
    Environment = var.environment
  }
}
