variable "sg_ports" {
type = list(number)
default = [8080,8000,9090,22,443]

}

resource "aws_security_group" "mysg" {
  name        = "allow_tls"
  dynamic  "ingress" {
    for_each = var.sg_ports
    iterator = port
    content{
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  }
}

