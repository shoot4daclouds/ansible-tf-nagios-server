output "nagios_server_public_ip" {
  description = "Public IP address of nagios server"
  value       = aws_instance.nagios-server.public_ip
}
