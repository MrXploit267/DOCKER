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
  RUN sed -i 's|root:/bin/ash|root:sbin/nologin|' /etc/passwd
  RUN apk update && \
      apk add --no-cache \
      openssh \
      bash \
      xrdp \
      ftp vstfpd \
      &&  rm -rf  /var/cache/apk/*
  SHELL["/bin/bash", "-c"]
  EXPOSE 8080 #for internet
  USER username # specify default user

build the machine on the same dir aas dockerfile
docker build . -t imagename # the name of your choice
  run the image
-docker run -it --rm  #limiting privileges
                      --security-opt=no-new-priviliges <imageid> /bin/bash
                      --privileged
                      #limiting capabilities
                      --can-drop all <capability name eg --cap-add NET_ADMIN>
                      #running modes
                      --read-only
                      --tmpfs /dir # temporary file

DOCKER FILE
installer script + docker file
