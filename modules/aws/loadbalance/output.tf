output "lb_arn" {
  value       = aws_lb.this.arn
  description = "value of the load balance arn"
}

output "lb_dns_name" {
  value       = aws_lb.this.dns_name
  description = "value of the load balance dns name"
}

output "load_balance_zone_id" {
  value       = aws_lb.this.zone_id
  description = "value of the load balance zone id"
}

output "lb_listener_https" {
  value       = aws_lb_listener.https
  description = "value of the listener https"
}
