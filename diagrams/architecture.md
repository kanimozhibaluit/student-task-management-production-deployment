
# Student Task Management - Cloud Architecture

## Architecture Diagram

```mermaid
flowchart TD
    U[Student / User] -->|HTTP Request - Port 80| IGW

    subgraph AWS["AWS Cloud - Mumbai Region"]
        subgraph VPC["Amazon VPC - 10.0.0.0/16"]

            IGW[Internet Gateway]

            subgraph PUBLIC["Public Subnet - AZ 1"]
                EC2[Amazon EC2 Application Server]
                APP[Application Security Group]
            end

            subgraph PRIVATE["Private Database Subnets"]
                subgraph AZ1["Availability Zone 1"]
                    PRIV1[Private Subnet 1]
                end

                subgraph AZ2["Availability Zone 2"]
                    PRIV2[Private Subnet 2]
                end

                DB[Amazon RDS PostgreSQL<br/>Single-AZ Instance]
                DBGROUP[RDS DB Subnet Group]
            end

            DBSG[Database Security Group]

            IGW --> EC2
            EC2 --- APP
            PRIV1 --> DBGROUP
            PRIV2 --> DBGROUP
            DBGROUP --> DB
            EC2 -->|PostgreSQL Port 5432| DBSG
            DBSG --> DB
        end

        SM[AWS Secrets Manager<br/>RDS Managed Credentials]
        CW[Amazon CloudWatch]
        SNS[Amazon SNS Alerts]
        BK[AWS Backup Vault]

        EC2 --> CW
        DB --> CW
        CW --> SNS
        DB --> BK
        DB -. Managed Password .-> SM
    end
```

## Architecture Components

| Component | Purpose |
|---|---|
| Amazon VPC | Provides an isolated network |
| Public Subnet | Hosts the EC2 application server |
| Private Subnets | Provide database subnet placement across two AZs |
| Internet Gateway | Provides internet connectivity to the public subnet |
| Amazon EC2 | Runs the application server |
| Amazon RDS PostgreSQL | Stores student task data |
| Application Security Group | Controls application server traffic |
| Database Security Group | Allows PostgreSQL access from the application security group |
| AWS Secrets Manager | Stores RDS-managed database credentials |
| Amazon CloudWatch | Monitors EC2 and RDS metrics |
| Amazon SNS | Sends monitoring notifications |
| AWS Backup | Manages scheduled database backups |

## Database Availability

The RDS DB subnet group spans two Availability Zones. However, the current RDS configuration uses `multi_az = false`, so the database does not have a Multi-AZ standby instance.

## Backup Configuration

- AWS Backup daily schedule.
- Seven-day AWS Backup retention.
- Seven-day RDS automated backup retention.
- Encrypted RDS storage.