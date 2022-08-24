# Configuração extra do docker daemon que não vem por padrão
# habilita o uso do daemon de forma remota em uma porta especifica
# facilitando o uso do docker pelo jenkins em máquinas slaves, mesmo que ele como mestre tenha instalado

mkdir -p /etc/systemd/system/docker.service.d/
touch /etc/systemd/system/docker.service.d/override.conf
touch /etc/docker/daemon.json

cat > /etc/docker/daemon.json << 'EOF'
{ 
"storage-driver": "overlay2",
"registry-mirrors": ["https://"],
"hosts": ["unix://", "tcp://0.0.0.0:2376"]
}
EOF

cat > /etc/systemd/system/docker.service.d/override.conf << 'EOF'
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
EOF

systemctl daemon-reload
systemctl restart docker.service