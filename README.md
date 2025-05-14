# terraform-aws-elasticache

[![Lint Status](https://github.com/tothenew/terraform-aws-elasticache/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-elasticache/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-elasticache)](https://github.com/tothenew/terraform-aws-elasticache/blob/master/LICENSE)

This is a elasticache to use for baseline. The default actions will provide updates for section bitween Requirements and Outputs.

The following content needed to be created and managed:
 - Introduction
     - This Terraform module provisions an AWS ElastiCache cluster supporting both Redis (including replication group setup) and Memcached engines. It is designed for secure, resilient, and customizable deployment of ElastiCache within a given VPC. The module supports both encryption in-transit and at-rest, custom parameter groups, snapshot configuration, and maintenance settings.


 - Depending on the configuration and selected engine (Redis or Memcached), the module creates and manages the following resources:
    - aws_elasticache_replication_group – for Redis clusters with replication and high availability.
    - aws_elasticache_cluster – for Memcached clusters.
    - aws_elasticache_parameter_group – optional, for defining custom parameters per engine family.
    - aws_elasticache_subnet_group – to define subnets used by the cache cluster.
    - aws_security_group – to control network access to the cluster.
    - random_id – to salt and version the configuration dynamically.
    - data.aws_vpc – to retrieve VPC tags and derive naming context.


 - Example Usages

<!-- BEGIN_TF_DOCS -->

## Usages
```
For Redis cluster select engine as "redis".
```
```hcl
module "terraform-aws-elasticache" {
  source             = "git::https://github.com/tothenew/terraform-aws-elasticache"
  engine             = "redis"
  subnets            = ["subnet-1111111", "subnet-222222", "subnet-3333333", "subnet-444444"]
  vpc_id             = "vpc-0000000000"
}
```
```
For Memcached cluster select engine as "memcached"
```
```hcl
module "terraform-aws-elasticache" {
  source             = "git::https://github.com/tothenew/terraform-aws-elasticache"
  engine             = "memcached"
  subnets            = ["subnet-1111111", "subnet-222222", "subnet-3333333", "subnet-444444"]
  vpc_id             = "vpc-0000000000"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-elasticache/blob/main/LICENSE) for full details.
