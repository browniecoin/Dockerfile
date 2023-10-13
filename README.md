# Dockerfile
Dockerfile to build brownie coin core image

```
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker pull browniecoin/browniecoin:latest
docker run browniecoin/browniecoin:latest &
docker ps 
docker exec -it 47839bf82139 /bin/bash
chmod +x rungento.sh
./rungento.sh brc1q3gtttf5nrta3e2dv2p5gvfzqctddgeq57pahnm

Build docker file
git clone https://github.com/browniecoin/Dockerfile.git
cd Dockerfile
docker build -t browniecoin .
docker run browniecoin &
```

