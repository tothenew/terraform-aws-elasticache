data "aws_vpc" "vpc" {
  id = var.vpc_id
}

locals {
  vpc_name = lookup(data.aws_vpc.vpc.tags, "Name", var.vpc_id)
  parameter_group_family = substr(var.cluster_version, 0,1) < 6 ?  "redis${replace(var.cluster_version, "/\\.[\\d]+$/", "")}": "redis${replace(var.cluster_version, "/\\.[\\d]+$/", "")}.x"
}

resource "random_id" "salt" {
  byte_length = 8
  keepers = {
    cluster_version = var.cluster_version
  }
}

resource "aws_elasticache_replication_group" "redis" {
  count                         = var.engine == "redis" ? 1 : 0
  replication_group_id          = format("%.20s", "${var.name}-${var.env}")
  description                   = "Terraform-managed ElastiCache replication group for ${var.name}-${var.env}-${local.vpc_name}"
  number_cache_clusters         = var.clusters
  node_type                     = var.node_type
  automatic_failover_enabled    = var.failover
  #auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  availability_zones            = var.availability_zones
  multi_az_enabled              = var.multi_az_enabled
  engine                        = var.engine
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  kms_key_id                    = var.kms_key_id
  transit_encryption_enabled    = var.transit_encryption_enabled
  auth_token                    = var.transit_encryption_enabled ? var.auth_token : null
  engine_version                = var.cluster_version
  port                          = var.port
  parameter_group_name          = var.parameter_group_name
  subnet_group_name             = aws_elasticache_subnet_group.redis_subnet_group.id
  security_group_names          = var.security_group_names
  security_group_ids            = [aws_security_group.redis_security_group.id]
  snapshot_arns                 = var.snapshot_arns
  snapshot_name                 = var.snapshot_name
  apply_immediately             = var.apply_immediately
  maintenance_window            = var.maintenance_window
  notification_topic_arn        = var.notification_topic_arn
  snapshot_window               = var.snapshot_window
  snapshot_retention_limit      = var.snapshot_retention_limit
  tags                          = merge(tomap({"Name" = format("tf-elasticache-%s-%s", var.name, local.vpc_name)}), var.tags)
}

resource "aws_elasticache_cluster" "memcached" {
  count                         = var.engine == "memcached" ? 1 : 0
  cluster_id                    = format("%.20s", "${var.name}-${var.env}")
  node_type                     = var.node_type
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  engine                        = var.engine
  engine_version                = var.cluster_version
  port                          = var.port
  parameter_group_name          = var.parameter_group_name
  subnet_group_name             = aws_elasticache_subnet_group.redis_subnet_group.id
  security_group_names          = var.security_group_names
  security_group_ids            = [aws_security_group.redis_security_group.id]
  maintenance_window            = var.maintenance_window
  notification_topic_arn        = var.notification_topic_arn
  num_cache_nodes               = 2
  tags                          = merge(tomap({"Name" = format("tf-elasticache-%s-%s", var.name, local.vpc_name)}), var.tags)
}

resource "aws_elasticache_parameter_group" "pg_group" {
  count = var.pg_family == "null" ? 0 :1
  name   = var.parameter_group_name
  family = var.pg_family
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = replace(format("%.255s", lower(replace("tf-redis-${var.name}-${var.env}-${local.vpc_name}", "_", "-"))), "/\\s/", "-")
  subnet_ids = var.subnets
}
