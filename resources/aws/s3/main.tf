module "s3" {
  source      = "../../../modules/aws/s3"
  for_each    = local.environment[terraform.workspace].buckets
  bucket_name = each.value
  tags        = local.tags
}
