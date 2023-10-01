module "terraform-aws-elasticache" {
  source                = "git::https://github.com/tothenew/terraform-aws-elasticache"
  env                   = "dev"
  name                  = "Redis-cluster"
  engine                = "redis"
  cluster_mode_enabled  = true
  clusters              = "2"
  failover              = "true"
  subnets               = ["subnet-043d59b3957d49", "subnet-093641ce3f549", "subnet-0d911d25c86c0"]
  vpc_id                = "vpc-0c7ca42512bbb"
  availability_zones    = ["us-east-1a", "us-east-1b","us-east-1c"]
  node_type             = "cache.r7g.large"
  cluster_version       = "6.2"
}