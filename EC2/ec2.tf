data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [${var.hash_commit}"]
  }

  owners = ["178520105998"]
}

resource "aws_instance" "insttance" {
  count = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HW"
  }
}
