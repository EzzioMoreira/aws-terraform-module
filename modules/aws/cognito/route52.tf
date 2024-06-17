data "aws_route53_zone" "this" {
  name = "drcash.com.br."
}

resource "aws_route53_record" "this" {
  name    = aws_cognito_user_pool_domain.this.domain
  type    = "A"
  zone_id = data.aws_route53_zone.this.zone_id
  alias {
    evaluate_target_health = false

    name    = aws_cognito_user_pool_domain.this.cloudfront_distribution
    zone_id = aws_cognito_user_pool_domain.this.cloudfront_distribution_zone_id
  }
}
