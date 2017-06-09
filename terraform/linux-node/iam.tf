######################################################################
# Role to opsworks-ec2-role
##
resource "aws_iam_role" "opsworks-ec2-role" {
    name = "opswork-ec2-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["opsworks.amazonaws.com","ec2.amazonaws.com"]
      },
      "Effect": "Allow",
      "Sid": "AssumeRoleopsworksEc2"
    }
  ]
}
EOF
}

######################################################################
# Policy for chef-node-associate-role-policy
##
resource "aws_iam_role_policy" "chef-role-policy" {
    name = "chef-node-associate-role-policy"
    role = "${aws_iam_role.opsworks-ec2-role.id}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "opsworks-cm:AssociateNode",
                "opsworks-cm:DescribeNodeAssociationStatus"
            ],
            "Effect": "Allow",
            "Resource": [
                "*"
            ]
        }
    ]
}   	 
EOF
}

resource "aws_iam_instance_profile" "instancerole" {
    name = "opsworks_ec2_instance_profile"
    role = "${aws_iam_role.opsworks-ec2-role.name}"
}