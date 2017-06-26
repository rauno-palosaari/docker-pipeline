# jenkins in a Docker in Docker container
### Dockerfile
```Dockerfile
FROM jenkins:2.60.1
USER root
RUN groupadd -aG docker jenkins && apt-get install -y libltdl7
USER jekins
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
