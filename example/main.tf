module "terraform-aws-elasticache" {
  source             = "git::https://github.com/narenderttn/terraform-aws-elasticache"
  env                = "dev"
  name               = "Memcached-cluster"
  engine             = "memcached"
  cluster_mode_enabled = true
  clusters           = "2"
  failover           = "true"
  subnets            = ["subnet-043d59b3957d49e1d", "subnet-093641ce3f549831e", "subnet-0d911d25c86c0a429"]
  vpc_id             = "vpc-0c7ca42512bbbb3df"
  availability_zones = ["us-east-1a", "us-east-1b","us-east-1c"]
  node_type          = "cache.r7g.large"
  cluster_version_redis    = "7.0"
  cluster_version_memcached = "1.6.17"
}