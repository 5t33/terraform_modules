data "aws_ssm_parameter" "master_username" {
  name = "/demo/${var.environment}/rds/demo-db-username"
}

data "aws_ssm_parameter" "master_password" {
  name = "/demo/${var.environment}/rds/demo-db-password"
}

locals {
  cluster_identifier = "${var.cluster_identifier}-${var.environment}"
  final_snapshot     = "${var.cluster_identifier}-final-snapshot-${var.environment}"
}

resource "aws_rds_cluster" "psql_cluster" {
  cluster_identifier        = local.cluster_identifier
  engine                    = "aurora-postgresql"
  availability_zones        = var.availability_zones
  database_name             = "${var.database_name}"
  master_username           = data.aws_ssm_parameter.master_username.value
  master_password           = data.aws_ssm_parameter.master_password.value
  backup_retention_period   = var.backup_retention_period
  preferred_backup_window   = var.preferred_backup_window
  deletion_protection       = var.deletion_protection
  final_snapshot_identifier = var.final_snapshot_enabled ? local.final_snapshot : null
  skip_final_snapshot       = var.final_snapshot_enabled == false
  port                      = var.port
  storage_encrypted         = true
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count               = var.num_instances
  identifier          = "${var.cluster_identifier}-${count.index}-${var.aws_region}-${var.environment}"
  cluster_identifier  = aws_rds_cluster.psql_cluster.id
  instance_class      = var.instance_class
  engine              = var.db_engine
  engine_version      = var.db_engine_version
  publicly_accessible = var.publicly_accessible
}
