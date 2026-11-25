# Application Failure Runbook

## 1. Purpose

This runbook explains how to identify, troubleshoot, and recover from application server failures in the Student Task Management application.

## 2. Possible Symptoms

- Website is not opening.
- Application returns HTTP 500 or 503 errors.
- EC2 instance is stopped or unhealthy.
- Nginx web server is not responding.
- High CPU utilization is detected.

## 3. Initial Investigation

1. Open the AWS Management Console.
2. Navigate to EC2 Instances.
3. Check the application server status.
4. Check CloudWatch CPU utilization.
5. Review EC2 system and instance status checks.
6. Check recent monitoring alerts.

## 4. Recovery Steps

### Step 1: Check EC2 Status

Verify whether the EC2 instance is running.

If it is stopped or unhealthy, investigate the reason before attempting recovery.

### Step 2: Connect to the Instance

Use AWS Systems Manager Session Manager if it has been configured with the required IAM permissions and connectivity.

### Step 3: Check Nginx

Run:

```bash
sudo systemctl status nginx
```

Check the Nginx configuration:

```bash
sudo nginx -t
```

### Step 4: Check Application Logs

Check Nginx error logs:

```bash
sudo tail -n 50 /var/log/nginx/error.log
```

Check access logs:

```bash
sudo tail -n 50 /var/log/nginx/access.log
```

### Step 5: Restart Nginx

If Nginx is stopped or unresponsive, investigate the cause and restart it:

```bash
sudo systemctl restart nginx
```

Verify its status:

```bash
sudo systemctl status nginx
```

### Step 6: Test Application Locally

Run:

```bash
curl -I http://localhost
```

Confirm that the web server responds successfully.

### Step 7: Verify Application

Open the application using its public IP address.

Confirm that the Student Task Management page loads successfully.

### Step 8: Escalation

If the application remains unavailable:

- Review system logs.
- Review CloudWatch alarms.
- Investigate server resource usage.
- Check network connectivity.
- Escalate to the cloud operations team.

## 5. Prevention

- Monitor EC2 instance health.
- Configure CloudWatch alarms.
- Apply operating system security updates.
- Review application logs regularly.
- Maintain backup and recovery procedures.

## 6. Recovery Verification

Confirm that:

- EC2 status checks are healthy.
- Nginx is running.
- Nginx configuration is valid.
- The website is accessible.
- No new critical alarms are active.

## 7. Expected Recovery Result

The application server should respond successfully to HTTP requests, and the Student Task Management webpage should be accessible.
