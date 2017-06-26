# jenkins
### Dockerfile
```Dockerfile
FROM jenkins:2.60.1
USER root
RUN groupadd -aG docker jenkins && apt-get install -y libltdl7
USER jekins
```
```bash
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker jenkins:2.60.1
```
# application
spring boot sample application
# proxy
haproxy
