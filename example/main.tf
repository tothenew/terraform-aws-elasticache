module "terraform-aws-elasticache" {
  source             = "git::https://github.com/narenderttn/terraform-aws-elasticache"
  env                = "dev"
  name               = "Redis-cluster"
  engine             = "redis"
  clusters           = "2"
  failover           = "true"
  subnets            = ["subnet-043d59b3957d49e1d", "subnet-093641ce3f549831e", "vpc-0c7ca42512bbbb3df"]
  vpc_id             = "vpc-0c7ca42512bbbb3df"
  availability_zones = ["us-east-1a", "us-east-1b"]
  node_type          = "cache.r4.large"
  cluster_version    = "3.2.10"
}