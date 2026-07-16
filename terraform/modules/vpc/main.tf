# Create VPC
resource "aws_vpc" "this" {

  cidr_block           = var.vpc_cidr

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    local.common_tags,  
    {
      Name = "${local.name_prefix}-vpc"
    }
)
}

# Create public subnet
resource "aws_subnet" "public" {
  for_each = {
    for idx, cidr in var.public_subnet_cidrs :
    idx => {
      cidr = cidr
      az   = var.availability_zones[idx]
    }
  }

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
  {
    Name                                        = "${local.name_prefix}-public-${each.key + 1}"
    Tier                                        = "public"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${local.name_prefix}" = "shared"
  }
  )  
}

# Create private subnet
resource "aws_subnet" "private" {
  for_each = {
    for idx, cidr in var.private_subnet_cidrs :
    idx => {
      cidr = cidr
      az   = var.availability_zones[idx]
    }
  }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = merge(
    local.common_tags,
  {
    Name = "${local.name_prefix}-private-${each.key + 1}"
    Tier = "private"

    "kubernetes.io/role/internal-elb" = "1"

    "kubernetes.io/cluster/${local.name_prefix}" = "shared"
  }
  )
}

# Create Internet Gateway
resource "aws_internet_gateway" "this" {

  vpc_id = aws_vpc.this.id

  tags = merge(
    local.common_tags,
  {
    Name = "${local.name_prefix}-igw"
  }
  )
}

# Create Elastic IP
resource "aws_eip" "nat" {

  domain = "vpc"

  tags = merge(
    local.common_tags,
  {
    Name = "${local.name_prefix}-nat-eip"
  }
  )
}

# Create NAT Gateway
resource "aws_nat_gateway" "this" {

  allocation_id = aws_eip.nat.id

  subnet_id = values(aws_subnet.public)[0].id

  tags = merge(
    local.common_tags,
  {
    Name = "${local.name_prefix}-nat"
  }
  )
  depends_on = [
    aws_internet_gateway.this
  ]
}

# Create Public Route Table
resource "aws_route_table" "public" {

  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-public-rt"
    }
  )
}

# Create Private Route Table
resource "aws_route_table" "private" {

  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-private-rt"
    }
  )
}

# Public Route table association
resource "aws_route_table_association" "public" {

  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id

}

# Private Route table association
resource "aws_route_table_association" "private" {

  for_each = aws_subnet.private

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id

}