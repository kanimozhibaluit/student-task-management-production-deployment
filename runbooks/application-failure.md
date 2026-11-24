
# Application Failure Runbook

## 1. Purpose

This runbook explains how to identify and recover from application server failures.

## 2. Possible Symptoms

- Website is not opening.
- Application returns HTTP 500 or 503 errors.
- EC2 instance is stopped or unhealthy.
- Nginx web server is not responding.

## 3. Initial Investigation

1. Open the AWS Management Console.
2. Navigate to EC2.
3. Check the application server status.
4. Check CloudWatch CPU utilization.
5. Review the EC2 system and instance status checks.

## 4. Recovery Steps

### Step 1: Check EC2 Status

Verify whether the EC2 instance is running.

If it is stopped unexpectedly, investigate the reason before restarting it.

### Step 2: Check Nginx

Connect using AWS Systems Manager Session Manager.

Run:

sudo systemctl status nginx

### Step 3: Restart Nginx

If Nginx is stopped, run:

sudo systemctl restart nginx

### Step 4: Verify Application

Check the website using its public IP address.

Confirm that the application page loads successfully.

### Step 5: Escalation

If the application is still unavailable:

- Check system logs.
- Review CloudWatch alarms.
- Investigate server resource usage.
- Escalate to the cloud operations team.

## 5. Prevention

- Monitor EC2 health.
- Configure CloudWatch alarms.
- Apply operating system updates.
- Review application logs regularly.

## 6. Recovery Verification

Confirm that:

- EC2 status checks are healthy.
- Nginx is running.
- The website is accessible.
- No new critical alarms are active.
