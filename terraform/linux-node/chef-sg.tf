resource "aws_security_group" "opsworks_node_sg" {
  name        = "opsworks_node_sg"
  description = "sg for opsworks node"
  vpc_id = "vpc-4f209529"

  # ALL Trafic access from anywhere
  
  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
 

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}
