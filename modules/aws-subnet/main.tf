
# Public subnets
resource "aws_subnet" "public" {
  count             = "${length(split(",",join(",",var.availability_zone)))}"
  vpc_id            = "${var.vpc_id}"
  availability_zone = "${element(var.availability_zone, count.index)}"
  cidr_block        = "${cidrsubnet(join(",",var.cidr_block), ceil(log(var.newbits, var.netnum)), count.index)}"
  tags = "${
    map(
      "Name:",format("subnet-%s", var.name),
    ) 
  }"
}

# Route table association
resource "aws_route_table_association" "public" {
  count          = "${length(split(",",join(",",var.availability_zone)))}"
  subnet_id      = "${aws_subnet.public.*.id[count.index]}"
  route_table_id = "${var.route_table_id}"
}