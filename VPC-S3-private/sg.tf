
# Create the Security Group
resource "aws_security_group" "My_VPC_Security_Group_Private" {
  vpc_id       = "${aws_vpc.My_VPC.id}"
  name         = "My VPC Security Group Private"
  description  = "My VPC Security Group Private"
ingress {
    security_groups = ["${aws_security_group.My_VPC_Security_Group_Public.id}"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]  
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
tags = {
        Name = "My VPC Security Group Private"
  }
} 


resource "aws_security_group" "My_VPC_Security_Group_Public" {
  vpc_id       = "${aws_vpc.My_VPC.id}"
  name         = "My VPC Security Group Public"
  description  = "My VPC Security Group Public"
ingress {
    cidr_blocks = ["${var.ingressCIDRblockPub}"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  egress {
    cidr_blocks = ["${var.ingressCIDRblockPub}"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
tags = {
        Name = "My VPC Security Group Public"
  }
}
