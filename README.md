# Dockerfile
Dockerfile to build brownie coin core image

```
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker pull browniecoin/browniecoin:1
docker run browniecoin/browniecoin:1 &
docker ps 
docker exec -it 47839bf82139 /bin/bash
chmod +x rungento.sh
./rungento.sh brc1q3gtttf5nrta3e2dv2p5gvfzqctddgeq57pahnm
./rungento.sh brc1q3gtttf5nrta3e2dv2p5gvfzqctddgeq57pahnm

Build docker file
git pull https://github.com/browniecoin/Dockerfile.git
docker build -t browniecoin .
docker run browniecoin &
```

