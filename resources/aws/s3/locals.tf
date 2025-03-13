locals {
  environment = {
    default = {}
    development = {
      buckets = {
        bucket_1 = "rapadura-boletos-clinics-dev"
      }
    }
    staging = {
      buckets = {
        bucket_1 = "rapadura-boletos-clinics-stg",
        bucket_2 = "rapadura-contratos-clinics-stg"
      }
    }
    production = {
      buckets = {
        bucket_1 = "rapadura-boletos-clinics-prd",
        bucket_2 = "grafana-loki-rapadura",
        bucket_3 = "rapadura-contratos-clinics-prd"
      }
    }
  }
  tags = {
    env           = "${terraform.workspace}"
    service       = "terraform"
    team          = "infrastructure"
    repository    = "rapadura-brazil/rapadura_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}
