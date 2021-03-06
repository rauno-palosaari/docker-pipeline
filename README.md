# jenkins in a Docker in Docker container
### Dockerfile
```Dockerfile
FROM jenkins:2.60.1

USER root

RUN  DEBIAN_FRONTEND=noninteractive groupadd -g977 docker \
  && usermod -aG docker jenkins \
  && apt-get update \
  && apt-get install -y apt-utils libltdl7 \
  && apt-get clean  

USER jenkins

# docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker docker images
```
### Start container
```bash
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker jenkins:2.60.1
```
### Start as Service (for test)
```bash
docker service create --name jenkins --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock --mount type=bind,src=/usr/bin/docker,dst=/usr/bin/docker --constraint 'node.role == manager' -p 8080:8080 -p 50000:50000 jenkins:2.60.1
```
Note that the final service will not poblish any ports and will add `--endpoint-mode=dnsrr`
```bash
docker service create --name jenkins --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock --mount type=bind,src=/usr/bin/docker,dst=/usr/bin/docker --endpoint-mode=dnsrr --constraint 'node.role == manager' -p 8080:8080 -p 50000:50000 jenkins:2.60.1
```
# docker network create
# test-application
spring boot sample application
# proxy
haproxy
