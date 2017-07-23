FROM jenkins
USER root

# Fix for shared library error https://github.com/jenkinsci/docker/issues/506
RUN apt-get update && apt-get install -y libltdl7 && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1001 docker \
 && usermod -a -G docker jenkins
USER jenkins
