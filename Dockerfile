FROM jenkins
USER root
RUN groupadd -g 1001 docker \
 && usermod -a -G docker jenkins
USER jenkins
