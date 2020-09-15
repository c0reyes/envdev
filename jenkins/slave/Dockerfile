FROM debian:buster

RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg2
RUN curl -s https://download.docker.com/linux/debian/gpg | apt-key add -
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" | tee -a /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce docker-compose

RUN apt-get install -y openjdk-11-jre python3-pip git
RUN pip3 install jenkins-webapi

RUN mkdir -p /home/jenkins
RUN mkdir -p /var/lib/jenkins

COPY slave.py /var/lib/jenkins/slave.py

RUN curl -s -q -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl

WORKDIR /home/jenkins

ENV JENKINS_URL "http://jenkins:8080"
ENV JENKINS_SLAVE_ADDRESS ""
ENV JENKINS_USER "admin"
ENV JENKINS_PASS "admin"
ENV SLAVE_NAME ""
ENV SLAVE_SECRET ""
ENV SLAVE_EXECUTORS "1"
ENV SLAVE_LABELS "docker"
ENV SLAVE_WORING_DIR ""
ENV CLEAN_WORKING_DIR "true"

CMD [ "python3", "-u", "/var/lib/jenkins/slave.py" ]
