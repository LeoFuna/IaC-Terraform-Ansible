module "aws_dev" {
  source = "../../infra"
  instance = "t2.micro"
  region_aws = "us-west-2"
  key = "IaC-DEV"
}

output "IP" {
  value = module.aws_dev.IP_publico
}