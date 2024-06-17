import yaml
from collections import defaultdict

# Carregar o arquivo YAML
with open('postman.yaml', 'r') as file:
    yaml_content = yaml.safe_load(file)

paths = yaml_content['paths']

# Criar um dicionário para armazenar as rotas por método HTTP
routes_by_method = defaultdict(list)

# Iterar sobre cada rota e seus métodos
for path, methods in paths.items():
    for method, details in methods.items():
        # Armazenar os detalhes da rota
        routes_by_method[method.upper()].append({
            'path': path,
            'method': method.upper()
        })

# Função para salvar as rotas em um arquivo YAML
def save_routes_to_yaml(routes, filename):
    with open(filename, 'w') as file:
        yaml.dump({'routes': routes}, file, sort_keys=False)

# Salvar as rotas para cada método em arquivos YAML separados
for method, routes in routes_by_method.items():
    filename = f'{method}.yaml'
    save_routes_to_yaml(routes, filename)

# Lista de arquivos gerados para referência
generated_files = [f'{method}.yaml' for method in routes_by_method.keys()]
print(generated_files)
