module "aws_prod" {
  source = "../../infra"
  region_aws = "us-west-2"
  key = "IaC-Prod"
  instance = "t2.micro"
}

output "IP" {
  value = module.aws_prod.IP_publico
}
