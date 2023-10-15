# Dockerfile
Dockerfile to build brownie coin core image or pull and run from Docker Hub

```
sudo apt update && sudo apt install -y docker.io && sudo systemctl start docker && sudo systemctl enable docker

docker pull browniecoin/browniecoin:latest 

docker run -d browniecoin/browniecoin:latest && docker exec -it $(docker ps -lq) sh

./mine.sh brc1qhnulky5ccd35xevt9k32w6qdggvgq74qe6mstl 2100000000 & exit

Build Docker Image
git clone https://github.com/browniecoin/Dockerfile.git
cd Dockerfile
docker build -t browniecoin .
```

