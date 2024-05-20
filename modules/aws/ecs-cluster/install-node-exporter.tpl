#!/bin/bash

# Configurar o ECS Cluster
echo ECS_CLUSTER=ecs-cluster-${cluster_name} >> /etc/ecs/ecs.config

# Atualizar e instalar dependências
yum update -y
yum install -y wget

# Instalar o Prometheus Node Exporter
wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz -O node_exporter.tar.gz
tar xzf node_exporter.tar.gz
cp node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64/node_exporter /usr/local/bin/
chown ec2-user:ec2-user /usr/local/bin/node_exporter
chmod +x /usr/local/bin/node_exporter


# Criar o arquivo de serviço systemd para o Node Exporter
cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=ec2-user
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

# Iniciar e habilitar o Node Exporter
systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter
