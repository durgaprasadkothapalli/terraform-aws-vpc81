resource "aws_vpc" "main" {
 cidr_block = var.vpc_cidr 
 enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
  var.common_tags,
   var.vpc_tags, 
   {
    Name = local.resource_name
   }
)
}


resource "aws_subnet" "public" {
count = length(var.public_subnet_cidrs)
vpc_id = aws_vpc.main.id
cidr_block = var.public_subnet_cidrs[count.index]

tags = {
  Name = "Public-expense"
}
}

resource "aws_subnet" "private" {
count = length(var.private_subnet_cidrs)
vpc_id = aws_vpc.main.id
cidr_block = var.private_subnet_cidrs[count.index]

tags = {
  Name = "Private-expense"
}
}

resource "aws_subnet" "database" {
count = length(var.database_subnet_cidrs)
vpc_id = aws_vpc.main.id
cidr_block = var.database_subnet_cidrs[count.index]

tags = {
  Name = "database-expense"
}
}