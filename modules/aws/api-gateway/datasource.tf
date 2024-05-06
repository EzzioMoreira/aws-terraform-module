# Find a certificate that is issued
data "aws_acm_certificate" "issued" {
  domain   = "*.drcash.com.br"
  statuses = ["ISSUED"]
}
