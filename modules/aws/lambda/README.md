
# Módulo Terraform para Lambda

Esse modulo terraform é utilizado para criar Lambda na AWS. 

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
module "lambda_notification-alert_slack" {
  source = "github.com/rapadura-brazil/rapadura_platform_infrastructure.git//modules/lambda/ecs-app?ref=v0.3.2-lambda"

  lambda_function_name = "teste-lambda"
  lambda_runtime       = "python3.8"
  handler              = "lambda_function.lambda_handler"
  description          = "Lambda function to send alerts to Slack"
  tags                 = {
    env           = "${terraform.workspace}"
    service       = "grafana"
    team          = "devops"
    repository    = "rapadura-brazil/rapadura_platform_infrastructure"
    documentation = "https://notion.so/rapadura/Infraestrutura-como-C-digo"
    created       = "terraform"
  }

  environment_variables = {
    SLACK_WEBHOOK_URL = var.slack_webhook_url
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
