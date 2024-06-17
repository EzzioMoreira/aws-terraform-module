
# Módulo Terraform para AWS Cognito

Esse modulo terraform é utilizado para criar Cognito com App Integration.

- [Documentação Modulo Terrafor](module-docs.md)

### Backend

Terraform utiliza o arquivo de backend para armazenar o estado atual da infraestrutura. 

```terraform
terraform {
  backend "s3" {
    bucket         = "drcash-terraform-tfstate"
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
}
```

### Module

Modulo é a principal forma de empacotar e reutilizar configurações de recursos com o Terraform.

```terraform
module "ecr-drcash" {
  source = "git::ssh://git@github.com/drcash-brazil/drcash_platform_infrastructure.git//modules/aws/cognito?ref=<VERSION>"
  
  name            = "Plug-Play-DEV"
  domain          = "authenticator.dev.drcash.com.br"
  certificate_arn = "arn:aws:acm:us-east-1:852704159394:certificate/7f387fe9-ade8-45cd-b4d0-6d2c54deac39"
  
  resource_server = [
    {
      identifier = "clinics"
      name       = "Clinics Admin API Dr.Cash API 2.0"
      scopes = [
        {
          scope_name        = "admin"
          scope_description = "Admin scope"
      }]
  }]

  client = [
    {
      name   = "Admin APIs Dr.Cash 2.0"
      scopes = ["clinics/admin"]
    },
    {
      name   = "QA APIs Dr.Cash API 2.0"
      scopes = ["clinics/admin"]
    }]

  tags = {
    env           = "${terraform.workspace}"
    service       = "api-gateway"
    product       = "drcash2.0"
    project       = "${local.context[terraform.workspace].name}"
    team          = "devops"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "null"
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
