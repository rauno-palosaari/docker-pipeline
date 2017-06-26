FROM jenkins:2.60.1

USER root

RUN  DEBIAN_FRONTEND=noninteractive groupadd -g977 docker \
  && usermod -aG docker jenkins \
  && apt-get update \
  && apt-get install -y apt-utils libltdl7 \
  && apt-get clean  

USER jenkins

# docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker jenkins
