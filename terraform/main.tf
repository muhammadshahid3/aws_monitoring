

#########################
# Import Existing Key Pair
#########################

resource "aws_key_pair" "terra" {
  key_name   = var.key_name
  public_key = file("vpc_terra.pub")
}

#########################
# Security Group
#########################

resource "aws_security_group" "monitoring_sg" {
  name        = "monitoring-sg"
  description = "Allow all traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Grafana"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Prometheus"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Node Exporter"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}
#########################
# Latest Ubuntu AMI
#########################


#########################
# Monitoring Server
#########################

resource "aws_instance" "monitoring" {

  ami                    = "ami-01a00762f46d584a1"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]
  key_name               = aws_key_pair.terra.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "Monitoring-Server"
  }
}

#########################
# App Server 1
#########################

resource "aws_instance" "app1" {

  ami                    = "ami-01a00762f46d584a1"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]
  key_name               = aws_key_pair.terra.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "App-Server-1"
  }
}

#########################
# App Server 2
#########################

resource "aws_instance" "app2" {

  ami                    = "ami-01a00762f46d584a1"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]
  key_name               = aws_key_pair.terra.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "App-Server-2"
  }
}