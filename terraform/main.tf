#########################
# Key Pair
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
  description = "Monitoring Project Security Group"
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

  # Internal Communication

  ingress {
    description = "Allow Internal Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "Monitoring-SG"
  }

}

#########################
# Configuration Server
#########################

resource "aws_instance" "configuration" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.terra.key_name
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "Configuration-Server"
    Role = "Ansible"
  }

}

#########################
# Monitoring Server
#########################

resource "aws_instance" "monitoring" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.terra.key_name
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "Monitoring-Server"
    Role = "Monitoring"
  }

}

#########################
# Node 1
#########################

resource "aws_instance" "node1" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.terra.key_name
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "Node-1"
    Role = "Application"
  }

}

#########################
# Node 2
#########################

resource "aws_instance" "node2" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.terra.key_name
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "Node-2"
    Role = "Application"
  }

}
