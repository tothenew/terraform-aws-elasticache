# terraform-aws-elasticache

[![Lint Status](https://github.com/tothenew/terraform-aws-elasticache/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-elasticache/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-elasticache)](https://github.com/tothenew/terraform-aws-elasticache/blob/master/LICENSE)

This is a elasticache to use for baseline. The default actions will provide updates for section bitween Requirements and Outputs.

The following content needed to be created and managed:
 - Introduction
     - Explaination of module 
     - Intended users
 - Resource created and managed by this module
 - Example Usages

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Usages
```
For Redis cluster select engine as "redis".
```
```hcl
module "terraform-aws-elasticache" {
  source             = "git::https://github.com/tothenew/terraform-aws-elasticache"
  env                = "dev"
  name               = "Redis-cluster"
  engine             = "redis"
  clusters           = "2"
  failover           = "true"
  subnets            = ["subnet-1111111", "subnet-222222", "subnet-3333333", "subnet-444444"]
  vpc_id             = "vpc-0000000000"
  availability_zones = ["us-east-1a", "us-east-1b"]
  node_type          = "cache.r4.large"
  cluster_version    = "3.2.10"
}
```
```
For Memcached cluster select engine as "memcached"
```
```hcl
module "terraform-aws-elasticache" {
  source             = "git::https://github.com/tothenew/terraform-aws-elasticache"
  env                = "dev"
  name               = "Memcached-cluster"
  engine             = "memcached"
  clusters           = "2"
  failover           = "true"
  subnets            = ["subnet-1111111", "subnet-222222", "subnet-3333333", "subnet-444444"]
  vpc_id             = "vpc-0000000000"
  availability_zones = ["us-east-1a", "us-east-1b"]
  node_type          = "cache.r4.large"
  cluster_version    = "1.6.12"
}
```
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
