locals {
  cluster_name = "drcash-cluster-${terraform.workspace}"
  tags = {
    Name          = "drcash-cluster-${terraform.workspace}"
    env           = "${terraform.workspace}"
    service       = "terraform"
    team          = "infrastructure"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}
