# docker

inside python 2.7.12, terraform 11.14, ansible 2.8.0 and other

#to build a container run

docker build -t <container_name> .

#to run container

docker run -it -v "$(pwd)":/data <container_name>  bash

#to remove all images and container

sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -q)