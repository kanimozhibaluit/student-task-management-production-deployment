
# Student Task Management – Cloud Architecture

## Architecture Diagram

```mermaid
flowchart TD
    U[Student / User] -->|HTTP Request| EC2[Amazon EC2 Application Server]
    EC2 -->|PostgreSQL Connection| RDS[(Amazon RDS PostgreSQL)]

    subgraph AWS["AWS Cloud - Mumbai Region"]
        subgraph VPC["Amazon VPC"]
            IGW[Internet Gateway]
            PUB[Public Subnet]
            PRIV1[Private Subnet - AZ 1]
            PRIV2[Private Subnet - AZ 2]

            IGW --> PUB
            PUB --> EC2
            PRIV1 --> RDS
            PRIV2 --> RDS
        end

        CW[Amazon CloudWatch Monitoring]
        SNS[Amazon SNS Alerts]
        BK[AWS Backup Vault]
        SM[AWS Secrets Manager]

        EC2 --> CW
        RDS --> CW
        CW --> SNS
        RDS --> BK
        RDS -. Managed credentials .-> SM
    end
```

## Architecture Components

| Component | Purpose |
|---|---|
| Amazon VPC | Provides an isolated network |
| Public Subnet | Hosts the application server |
| Private Subnets | Host the database network |
| Internet Gateway | Allows internet access to the public subnet |
| Amazon EC2 | Runs the application server |
| Amazon RDS | Stores student task data |
| AWS Secrets Manager | Manages database credentials |
| Amazon CloudWatch | Monitors application and database metrics |
| Amazon SNS | Sends monitoring notifications |
| AWS Backup | Stores database backups |
