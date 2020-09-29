# create an ec2 instance 
provider  "aws" {
    # your provider block should look like this. It will pull creds from your environment variables
    region = "us-east-1"
}

resource "aws_instance" "tf_server" {
   ami           = data.aws_ami.server_ami.id
  instance_type = "t2.micro"
}

# resource "aws_instance" "tf_server" {
#   instance_type = var.instance_type
#   ami           = "${data.aws_ami.server_ami.id}"

#   tags = {
#     Name = "tf_server_${count.index + 1}"
#   }
#   key_name               = "${aws_key_pair.tf_auth.id}"
#   vpc_security_group_ids = ["${var.security_group}"]
#   subnet_id              = "${element(var.subnet, count.index)}"
#   user_data              = "${data.tempate_file.user-init.*.rendered[count.index]}"
# }

# This pulls the ID for the amzn box. 
data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"] #TODO change this to ubuntu. It's in the terraform book
  }
}