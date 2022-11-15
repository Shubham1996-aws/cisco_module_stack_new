### EIP ###
resource "aws_eip" "eip" {
  count = 4
  vpc      = true
  tags = {
    Name = "cml_eip${count.index}"
  }
}

########################################################################################################
########################################################################################################
########################################################################################################

/*resource "aws_eip_association" "eip_assoc" {
  count = 4
  #instance_id   = aws_instance.web-server[count.index].id
  instance_id = data.aws_instance.ec2-data[count.index].id
  allocation_id = data.aws_eip.eip[count.index].id
}*/
