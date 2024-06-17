# Use uma imagem oficial do Python como base
FROM python:3.8-slim-buster

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia os arquivos de requisitos para o contêiner
COPY requirements.txt .

# Instala as bibliotecas necessárias
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código para o contêiner
COPY . .

# Comando para executar quando o contêiner iniciar
CMD ["python", "estrutura-yaml.py"]
