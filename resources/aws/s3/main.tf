module "s3" {
  source      = "github.com/drcash-brazil/drcash_platform_infrastructure.git//modules/aws/s3?ref=v0.2.5-s3"
  for_each    = local.environment[terraform.workspace].buckets
  bucket_name = each.value
  tags        = local.tags
}
