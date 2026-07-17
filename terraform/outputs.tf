output "configuration_public_ip" {
  value = aws_instance.configuration.public_ip
}

output "configuration_private_ip" {
  value = aws_instance.configuration.private_ip
}

output "monitoring_public_ip" {
  value = aws_instance.monitoring.public_ip
}

output "monitoring_private_ip" {
  value = aws_instance.monitoring.private_ip
}

output "node1_public_ip" {
  value = aws_instance.node1.public_ip
}

output "node1_private_ip" {
  value = aws_instance.node1.private_ip
}

output "node2_public_ip" {
  value = aws_instance.node2.public_ip
}

output "node2_private_ip" {
  value = aws_instance.node2.private_ip
}
