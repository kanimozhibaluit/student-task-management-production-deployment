
# 1. Create Backup Vault

resource "aws_backup_vault" "student_vault" {
  name = "${var.project_name}-backup-vault"
}

# 2. Create Backup Plan

resource "aws_backup_plan" "student_backup" {
  name = "${var.project_name}-backup-plan"

  rule {
    rule_name         = "daily-database-backup"
    target_vault_name = aws_backup_vault.student_vault.name
    schedule          = "cron(0 18 * * ? *)"

    lifecycle {
      delete_after = 7
    }
  }
}

# 3. Allow AWS Backup to access resources

resource "aws_iam_role" "backup_role" {
  name = "${var.project_name}-backup-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "backup.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# 4. Attach AWS Backup permissions

resource "aws_iam_role_policy_attachment" "backup_policy" {
  role = aws_iam_role.backup_role.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

# 5. Select the database for backup

resource "aws_backup_selection" "database_selection" {
  name         = "${var.project_name}-database-selection"
  plan_id      = aws_backup_plan.student_backup.id
  iam_role_arn = aws_iam_role.backup_role.arn

  resources = [
    aws_db_instance.student_database.arn
  ]
}
