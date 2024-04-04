output "lb_arn" {
  value = aws_lb.this.arn
}

output "listener_arns" {
  value = { for k, v in aws_lb_listener.this : k => v.arn }
}

output "lb_dns_name" {
  value = aws_lb.this.dns_name
}
