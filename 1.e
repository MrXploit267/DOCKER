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


