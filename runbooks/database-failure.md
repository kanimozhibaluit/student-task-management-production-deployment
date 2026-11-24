
# Database Failure Runbook

## 1. Purpose

This runbook explains how to identify and recover from Amazon RDS database failures.

## 2. Possible Symptoms

- Application cannot connect to the database.
- Database connection timeout occurs.
- Database status becomes unavailable.
- CloudWatch reports high database CPU usage.

## 3. Initial Investigation

1. Open AWS Management Console.
2. Navigate to Amazon RDS.
3. Check the database status.
4. Review CloudWatch database CPU metrics.
5. Check database connectivity and security group rules.

## 4. Recovery Steps

### Step 1: Check Database Status

Verify whether the RDS database is available.

Check for maintenance, storage problems or unexpected failures.

### Step 2: Check Connectivity

Verify:

- Database endpoint.
- Database port.
- Application security group.
- Database security group.
- Network connectivity.

### Step 3: Check CloudWatch

Review database CPU utilization and available storage metrics.

Investigate any active alarms.

### Step 4: Restore Database if Necessary

If database data is corrupted or lost:

1. Open Amazon RDS.
2. Navigate to automated backups.
3. Select an appropriate recovery point.
4. Restore the database to a new DB instance.
5. Verify the restored data.
6. Update the application database endpoint securely.

Never delete the original database before verifying recovery.

### Step 5: Verify Recovery

Confirm that:

- Database status is available.
- Application can connect.
- Student records are accessible.
- Database queries work correctly.

## 5. Escalation

If recovery fails:

- Contact the database administrator.
- Review AWS RDS events.
- Investigate backup availability.
- Escalate to the cloud operations team.

## 6. Prevention

- Enable automated backups.
- Monitor database health.
- Use encrypted database storage.
- Review CloudWatch alarms.
- Test database restoration regularly.
