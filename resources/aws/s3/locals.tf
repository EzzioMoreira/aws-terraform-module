locals {
  environment = {
    default = {}
    development = {
      buckets = {
        bucket_1 = "drcash-boletos-clinics-dev"
      }
    }
    staging = {
      buckets = {
        bucket_1 = "drcash-boletos-clinics-stg",
        bucket_2 = "drcash-contractos-clinics-stg"
      }
    }
    production = {
      buckets = {
        bucket_1 = "drcash-boletos-clinics-prd",
        bucket_2 = "grafana-loki-drcash",
        bucket_3 = "drcash-contractos-clinics-prd"
      }
    }
  }
  tags = {
    env           = "${terraform.workspace}"
    service       = "terraform"
    team          = "infrastructure"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}
