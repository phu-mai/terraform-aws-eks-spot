resource "aws_security_group" "allow_all_protocol" {
  count       = "${var.sec_create}"
  name        = "${var.name}"
  description = "Allow protocol inbound traffic"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags   = {
    Name = "${var.name}"
  }
}

resource "aws_security_group_rule" "allow_all" {
  count                    = "${var.sec_create}"
  description              = "Allow protocol inbound traffic"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.allow_all_protocol.id}"
  cidr_blocks              = ["0.0.0.0/0"]
}