#!/bin/bash

# Configurar o ECS Cluster
echo ECS_CLUSTER=ecs-cluster-${cluster_name} >> /etc/ecs/ecs.config

# Atualizar e instalar dependências
yum update -y
yum install -y wget

# Definir a versão do Node Exporter
NODE_EXPORTER_VERSION="1.8.0"

# Instalar o Prometheus Node Exporter
useradd --no-create-home --shell /bin/false node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz -O node_exporter.tar.gz
tar xzf node_exporter.tar.gz
cp node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64/node_exporter /usr/local/bin/
chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Criar o arquivo de serviço systemd para o Node Exporter
cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

# Iniciar e habilitar o Node Exporter
systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter
