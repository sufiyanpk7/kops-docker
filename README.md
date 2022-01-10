# kops-docker
## image to manage KOPS in docker 
```
We can manage kops without directing to our system.
All we need to do is just put the image into a container in docker.
Moreover all datas like AWS, SSH and kops credentials can be mounted to the desired path.
```
### You can pull images by 
``` 
docker pull sufiyanpk/kops-docker
docker run -it -d docker.io/sufiyanpk/kops-docker:beta /bin/bash
```
## volume mount paths
```
 - /home/ubuntu/kops 
 - /root/.ssh 
 - /root/.aws
```
