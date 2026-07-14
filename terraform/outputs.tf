
output "monitoring_server_public_ip" {
  value = aws_instance.monitoring.public_ip
}
output "app_server_1_public_ip" {
  value = aws_instance.app1.public_ip
}
output "app_server_2_public_ip" {
  value = aws_instance.app2.public_ip
}

# private ip
output "monitoring_server_private_ip" {
  value = aws_instance.monitoring.private_ip
}
output "app_server_1_private_ip" {
  value = aws_instance.app1.private_ip
}
output "app_server_2_private_ip" {
  value = aws_instance.app2.private_ip
}