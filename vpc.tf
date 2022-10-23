resource "aws_vpc" "activity" {
  count      = length(var.vpc_name_tags)
  cidr_block = var.vpc_cidr_range[count.index]
  tags = {
    Name = var.vpc_name_tags[count.index]
  }
}