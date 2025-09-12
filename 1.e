install docker 
--pacman -Sy docker , on arch
--apt install docker.io, on debian based
--docker version 
--systemctl enable docker
--systemctl start docker
get the image
---go to docker hub and download image of your choice
---docker pull <image name>
--- docker rmi <image/id>, this command removes the image
run the image 
-- docker run --name <alias> -it <image> /bin/bash, -it means interactive terminal
-- docker ps -a, this cmd views the running images
 or attach the image
-- docker attach image
after running the image 
#alpine
update the pags
-apk update

CRAFT DOCKER FILE - in host
-micro dockerfile
  FROM alpine:latest

  LABEL maintainer = "ME ofc"
  RUN addgroup -g <id> -S <groupname>
  RUN useradd -D -u <id> -G <goup> -s /bin/bash <username>
  RUN apk update && \
      apk add --no-cache \
      openssh \
      bash \
      xrdp \
      ftp vstfpd \
      &&  rm -rf  /var/cache/apk/*
  SHELL["/bin/bash", "-c"]
  EXPOSE 8080 #for internet
  
      




