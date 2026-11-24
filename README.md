
# Student Task Management – AWS Cloud Architecture

## Project Overview

This project demonstrates a cloud architecture for a Student Task Management application using Amazon Web Services (AWS).

The application is designed to provide a secure, scalable, and reliable environment for managing student tasks and information.

## Architecture Diagram

The architecture diagram is available here:

[View Architecture Diagram](diagrams/architecture.md)

## AWS Services Used

| AWS Service | Purpose |
|---|---|
| Amazon VPC | Provides an isolated network |
| Amazon EC2 | Hosts the application server |
| Amazon RDS PostgreSQL | Stores application data |
| AWS Secrets Manager | Manages database credentials |
| Amazon CloudWatch | Monitors resources |
| Amazon SNS | Sends monitoring alerts |
| AWS Backup | Manages database backups |

## Network Architecture

- Public subnet for the application server.
- Private subnets for the database.
- Internet Gateway for internet connectivity.
- Database access restricted to the application server.

## Security

- Database credentials managed through AWS Secrets Manager.
- Database hosted in private subnets.
- Network access controlled using security groups.
- No credentials or Terraform state files should be uploaded to GitHub.

## Monitoring and Alerts

Amazon CloudWatch monitors AWS resources.

Amazon SNS is used to send monitoring notifications.

## Backup and Recovery

AWS Backup is used to manage database backups and support recovery.

## Infrastructure as Code

Terraform is used to define and manage the AWS infrastructure.

## Project Structure

- `diagrams/` – Architecture diagrams.
- `terraform/` – Infrastructure configuration files.
- `README.md` – Project documentation.

## Region

AWS Mumbai Region (ap-south-1).

## Author

Student Cloud Architecture Project
