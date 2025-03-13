
# Módulo Terraform para AWS API Gateway

Esse modulo terraform é utilizado para criar API Gateway. 

- [Documentação Modulo Terrafor](module-docs.md)

### Backend

Terraform utiliza o arquivo de backend para armazenar o estado atual da infraestrutura. 

```terraform
terraform {
  backend "s3" {
    bucket         = "rapadura-terraform-tfstate"
    key            = "aws/<SERVICE-NAME>/<RESOURCE-NAME>/terraform.tfstate"
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
module "api-gateway" {
  source = "github.com/rapadura-brazil/rapadura_platform_infrastructure.git//modules/aws/ecs-app?ref=v0.2.0-api-gateway"

  name                   = "grafana-web"
  description            = "API Gateway for Grafana Web"
  protocol_type          = "HTTP"
  domain_name            = "grafana-web.rapadura.com.br"

  integrations = {
    "ANY /{proxy}" = {
      description        = "Grafana Web integration"
      integration_type   = "HTTP_PROXY"
      integration_uri    = aws_lb_listener.this.arn
      integration_method = "ANY"
      connection_type    = "VPC_LINK"
      vpc_link           = "grafana-web"
    }
  }

  vpc_links = {
    grafana-web = {
      subnet_ids = data.aws_subnets.private.ids
      tags       = local.tags
    }
  }

  tags = local.tags
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
