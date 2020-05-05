FROM jenkins/jenkins:lts
# (In version 2.194 still based on Debian stretch)

USER root

# Ansible integration:
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" \
    >/etc/apt/sources.list.d/ansible-ppa.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN apt update && apt -y install ansible

USER jenkins



RUN /usr/local/bin/install-plugins.sh \
    greenballs \
    ansicolor \
    ansible \
    git \
    matrix-auth \
    ssh \
    workflow-aggregator

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
 
# Skip the initial setup wizard
ENV JAVA_OPTS \
    -Djenkins.install.runSetupWizard=false \
    -Djenkins.CLI.disabled=true
