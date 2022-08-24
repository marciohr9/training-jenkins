# Configuração extra do docker daemon que não vem por padrão
# habilita o uso do daemon de forma remota em uma porta especifica
# facilitando o uso do docker pelo jenkins em máquinas slaves, mesmo que ele como mestre tenha instalado

mkdir -p /etc/systemd/system/docker.service.d/
nano /etc/systemd/system/docker.service.d/override.conf

cat > file << 'EOF'
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H -fd:// -H tcp://0.0.0.0:2376
EOF