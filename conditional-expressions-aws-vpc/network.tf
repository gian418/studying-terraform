resource "aws_vpc" "vpc" {
  #o valor neste caso esta sendo passado por linha de comando
  #export TV_VAR_environment=prod
  count = var.environment == "prod" ? 1 : 0

  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "vpc-terraform"
  }
}

