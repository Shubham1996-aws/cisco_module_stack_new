data "aws_availability_zones" "azs" {
  state = "available"
}

### instance ###
/*data "aws_ami" "amazon" {
  most_recent = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}*/

data "aws_iam_instance_profile" "instance_profile" {
  name = "ssm_instance_profile-s"
}

data "aws_security_group" "selected" {
  name = "cml-security-group"
}
/*data "aws_eip" "eip" {
  count = 4
   tags = {
    Name = "cml_eip-${count.index}"
  }
 }*/
########################################################
########## EIP Association #############
########################################################
resource "aws_eip_association" "eip_assoc" {
  count         = var.instanceCount
  instance_id   = aws_instance.web-server[count.index].id
  allocation_id = var.eip_assoc_id
  depends_on = [
    aws_instance.web-server
  ]
}
/*resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits = 4096
}*/

/*resource "aws_key_pair" "ssh" {
  key_name = "devops-cml"
  #public_key = tls_private_key.ssh-key.public_key_openssh
  public_key = file("/ssh_key/id_rsa.pub")
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCuS7MeGC4iehHI4kLBR+HP17d+yLXbNs/LwgFMwtYZPE5LNNhPCO5P6bvsbTlEwT/iOBbDow6vSYhO1Y1VIquwWl1nsuq1mzAqPyIcgw20Ht748vYUOKdThDvftLCnnQ7e1dTsJuFbV2nZWNr4xPygbqTom57NooM1Nz0NzkgdH0d6Bj2Pk77T6He5PkUOU7Tc8n6ESdgRt+k+CFXJneTr9CNhfnyn80cpZGbQ/mi5pKgJPlUHtHJmd6epuhiTwfWtIU+/CZSUKVNKpobKTXWZfqUI62+dPlpkzOoMOET965yCKXK+fC91E23gZ3yE2OpsZztwd63nDHdKin9qLjlLbZdxMFnVlkuJtS6sR7kOABKJyFsqOQ/ipuZhEBr7Ybk/xTMExDfGp27n5SY2dhJNlU6sdRNTr7iVq4GORWAsu+1nS2Gqq0cjDlNId9QsGRjnUh9dzHwdRCiuT56GdY+Ho6zkcRM4taSlkyunA+pgzH8kFkSyoH1VDcdO9zUsaWNZG8W1YpRqdFv8yl1JmKJ9gKVPi750gFnWVvtc2jEtmMt8Mgn/lIIX7Wtu51c5zC+zKnspEvecAoVM9FF4VbnC3g8pKdgE4kwVaLbbX6w4yCEy1rVw1Q0OPlsyMQDNvGV5b5OKF+3eoVdpXNrbL7iEAqLtEgS1gfx+ZJOUhvJRfQ== cml-on-aws"
}*/
###################################################
########### Instance Creation ###########
###################################################
resource "aws_instance" "web-server" {
  count                       = var.instanceCount
  ami                         = var.ami_id
  key_name                    = var.key_name
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [data.aws_security_group.selected.id]
  iam_instance_profile        = data.aws_iam_instance_profile.instance_profile.name
  ebs_block_device {
    #device_name = "/dev/xvda" # for additional volume on root device
    device_name = "/dev/sda1"  # for additional ebs volume
    volume_size = var.ebs_volume_size
  }
  tags = local.common_tags
}


output "instance_id" {
  value = aws_instance.web-server[*].public_ip
}

