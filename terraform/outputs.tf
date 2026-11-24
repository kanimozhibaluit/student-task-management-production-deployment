
# 1. Display VPC ID

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

# 2. Display Public Subnet ID

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

# 3. Display EC2 Public IP

output "application_public_ip" {
  description = "Public IP of the application server"
  value       = aws_instance.app_server.public_ip
}

# 4. Display Application URL

output "application_url" {
  description = "URL of the student task management application"
  value       = "http://${aws_instance.app_server.public_ip}"
}

# 5. Display Database Endpoint

output "database_endpoint" {
  description = "Endpoint of the PostgreSQL database"
  value       = aws_db_instance.student_database.endpoint
  sensitive   = true
}
