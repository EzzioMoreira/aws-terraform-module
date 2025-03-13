# Find a certificate that is issued
data "aws_acm_certificate" "issued" {
  domain   = "*.rapadura.com.br"
  statuses = ["ISSUED"]
}
