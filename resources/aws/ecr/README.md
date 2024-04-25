## Projeto cria os repositório ECR da Dr. Cash

Esse projeto centraliza a criação dos repositórios AWS ECR. 

### Criar um novo repositórios. 

Adicione o nome do novo repositório na lista `repositories` do arquivo `locals.tf`. 

```terraform
locals {
  repositories = [
    "repositorio-1",
    "repositorio-2",
    "repositorio-3",
  ]
}
```

### Documentação completa

- [Documentação do modulo](../../../modules/aws/ecr/module-docs.md)

- [Documentação do resource](../../../modules/aws/ecr/README.md)