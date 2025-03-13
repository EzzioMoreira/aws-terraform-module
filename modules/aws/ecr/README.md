
# Módulo Terraform para AWS ECS

Esse modulo terraform é utilizado para criar ECR Elastic Container Registrer.

- [Documentação Modulo Terrafor](module-docs.md)

### Backend

Terraform utiliza o arquivo de backend para armazenar o estado atual da infraestrutura. 

```terraform
terraform {
  backend "s3" {
    bucket         = "rapadura-terraform-tfstate"
    key            = "aws/<SERVICE-NAME>/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state_lock"
  }
}
```

### Provider

Provider será declarado que tipo de Cloud ou Serviço SAAS a infraestrutura será provisionada. 

```terraform
provider "aws" {
  region = "us-east-1"
}
```

### Version

Version declaramos a versão dos providers. 

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.7.4"
}
```

### Module

Modulo é a principal forma de empacotar e reutilizar configurações de recursos com o Terraform.

```terraform
module "ecr-rapadura" {
  source = "git::ssh://git@github.com/rapadura-brazil/rapadura_platform_infrastructure.git//modules/aws/ecs-app?ref=<VERSION>"
  name     = "REPO-NAME"

  tags = {
    env           = "<development, staging, production>"
    service       = "SERVICE-NAME"
    team          = "TEAM-NAME"
    repository    = "rapadura-brazil/rapadura_platform_infrastructure"
    documentation = "LINK-DOCUMENTATION"
    created       = "terraform"
  }
}
```

### DiggerHQ

Digger é reponsável pelo CI/CD dos projetos terraform, para novos projetos declare o seguinte bloco no arquivo digger.yaml. 

```yaml
- name: NOME-SERVIÇO-<development, staging, production>
  dir: CAMINHO-DIRETORIO-SERVIÇO
  workflow: default
  workspace: <development, staging, production>
```
