module "vpc" {
  source = "../../modules/vpc"

  environment        = "prod"
  vpc_cidr           = "172.16.0.0/16"
  public_subnets     = ["172.16.1.0/24", "172.16.2.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "ec2" {
  source = "../../modules/ec2"

  environment   = "prod"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_ids[0]
  instance_type = "t2.medium"
}
