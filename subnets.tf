resource "aws_subnet" "subnets" {
  count      = length(var.subnet_name_tags)
  #count      = length(var.vpc_name_tags)
  vpc_id =  aws_vpc.activity[count.index % 2 == 0 ? "0":"1"].id
  cidr_block = cidrsubnet(var.vpc_cidr_range[count.index % 2 == 0 ? "0":"1"], 8, count.index)
  tags = {
    Name = var.subnet_name_tags[count.index]
  }
}