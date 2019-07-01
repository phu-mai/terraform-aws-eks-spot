# VPC
resource "aws_vpc" "this" {
  cidr_block = "${var.cidr_block}"
  tags       = "${
    map(
      "Name:",format("vpc-%s", var.name),
    )
  }"
}
# Internet Gateway
resource "aws_internet_gateway" "this" {
  count   = "${var.create_vpc}"
  vpc_id = "${aws_vpc.this.id}"
  tags   = "${
    map(
      "Name:",format("IGateway-%s", var.name),
    )
  }"
}

# Publiс routes
resource "aws_route_table" "public" {
  count  = "${var.create_vpc}"
  vpc_id = "${aws_vpc.this.id}"
  tags   = "${
    map(
      "Name:",format("Pub routes-%s", var.name),
    )
  }"
}
resource "aws_route" "public_internet_gateway" {
  count                  = "${var.create_vpc}"
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.this.id}"
  timeouts {
    create               = "5m"
  }
}