resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge(var.tags, { Name = "${var.name_prefix}-vpc" })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, { Name = "${var.name_prefix}-igw" })
}

resource "aws_subnet" "public" {
  for_each                = { for i, c in var.public_subnet_cidrs : i => c }
  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value
  availability_zone       = var.azs[tonumber(each.key)]
  map_public_ip_on_launch = true
  tags                    = merge(var.tags, { Name = "${var.name_prefix}-public-${each.key}" })
}

resource "aws_subnet" "private" {
  for_each          = { for i, c in var.private_subnet_cidrs : i => c }
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = var.azs[tonumber(each.key)]
  tags              = merge(var.tags, { Name = "${var.name_prefix}-private-${each.key}" })
}
