resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "client-ec2-key-pair"
  public_key = file("./ssh_cert.pub")
}
