# Database Failure Runbook

## 1. Purpose

This runbook explains how to identify, troubleshoot, and recover from Amazon RDS PostgreSQL database failures in the Student Task Management application.

## 2. Possible Symptoms

- Application cannot connect to the database.
- Database connection timeout occurs.
- RDS database status becomes unavailable.
- CloudWatch reports high database CPU usage.
- Database storage becomes insufficient.
- Application reports database-related errors.

## 3. Initial Investigation

1. Open the AWS Management Console.
2. Navigate to Amazon RDS.
3. Select the Student Task Management database.
4. Check the database status.
5. Review CloudWatch database CPU utilization.
6. Check available database storage.
7. Review recent RDS events and maintenance activities.
8. Check active CloudWatch alarms.

## 4. Recovery Steps

### Step 1: Check Database Status

Verify whether the RDS PostgreSQL database is available.

Investigate maintenance activities, storage problems, and unexpected failures.

### Step 2: Check Database Connectivity

Verify:

- Database endpoint.
- PostgreSQL port (5432).
- Application security group.
- Database security group.
- Private subnet configuration.
- Network connectivity.

### Step 3: Check Database Credentials

Verify that the application retrieves the database credentials securely from AWS Secrets Manager.

Do not store database passwords in source code or GitHub.

### Step 4: Review CloudWatch Metrics

Check:

- CPU utilization.
- Free storage space.
- Database connections.
- Read and write latency.

Investigate active alarms and identify the cause of the failure.

### Step 5: Restore Database if Necessary

If database data is corrupted or lost:

1. Open Amazon RDS.
2. Navigate to automated backups.
3. Select an appropriate recovery point.
4. Restore the database to a new DB instance.
5. Wait until the restored database becomes available.
6. Verify the restored database and records.
7. Update the application database endpoint securely.
8. Test application connectivity.

Never delete the original database before verifying the restored database.

### Step 6: Verify Recovery

Confirm that:

- Database status is available.
- Application can connect successfully.
- Student records are accessible.
- Database queries execute successfully.
- No critical database alarms remain active.

## 5. Escalation

If recovery fails:

- Contact the database administrator.
- Review AWS RDS events.
- Investigate backup availability.
- Check database connectivity and security settings.
- Escalate to the cloud operations team.

## 6. Prevention

- Enable automated database backups.
- Configure AWS Backup.
- Monitor database health using CloudWatch.
- Use encrypted database storage.
- Configure database CPU and storage alarms.
- Test database restoration regularly.

## 7. Expected Recovery Result

The PostgreSQL database should become available, application connectivity should be restored, and student records should be accessible without data loss beyond the selected recovery point.
