resource "aws_iam_role" "grafana_labs_cloudwatch_integration" {
  name        = var.iam_role_name
  description = "Role used by Grafana CloudWatch integration."
  # Allow Grafana Labs' AWS account to assume this role.
  assume_role_policy = data.aws_iam_policy_document.trust_grafana.json
  tags               = local.tags

  # This policy allows the role to discover metrics via tags and export them.
  inline_policy {
    name = var.iam_role_name
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "tag:GetResources",
            "cloudwatch:GetMetricData",
            "cloudwatch:ListMetrics",
            "apigateway:GET",
            "aps:ListWorkspaces",
            "autoscaling:DescribeAutoScalingGroups",
            "dms:DescribeReplicationInstances",
            "dms:DescribeReplicationTasks",
            "ec2:DescribeTransitGatewayAttachments",
            "ec2:DescribeSpotFleetRequests",
            "shield:ListProtections",
            "storagegateway:ListGateways",
            "storagegateway:ListTagsForResource"
          ]
          Resource = "*"
        }
      ]
    })
  }
}
output "role_arn" {
  value       = aws_iam_role.grafana_labs_cloudwatch_integration.arn
  description = "The ARN for the role created, copy this into Grafana Cloud installation."
}