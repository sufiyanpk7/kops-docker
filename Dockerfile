FROM ubuntu:18.04
RUN apt-get update &&  apt-get install -y apt-transport-https curl
RUN apt-get install -y nano
RUN apt-get install -y telnet
RUN apt-get install -y host
RUN apt-get install -y net-tools
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y --no-install-recommends tzdata
RUN echo "Asia/Dubai" > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata
# Install Unzip
RUN apt-get install unzip -y
# need wget
RUN apt-get install wget -y 
# vim
RUN apt-get install -y vim
RUN apt-get install openssh-client -y

RUN apt-get install -y gnupg2
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo deb https://apt.kubernetes.io/ kubernetes-xenial main | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN  apt-get update
RUN  apt-get install -y kubectl
RUN  wget https://github.com/kubernetes/kops/releases/download/v1.24.1/kops-linux-amd64
RUN chmod +x kops-linux-amd64
RUN mv kops-linux-amd64 /usr/local/bin/kops
RUN apt-get install -y  awscli 
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
RUN mv /tmp/eksctl /usr/local/bin
RUN mkdir /home/ubuntu/ /home/ubuntu/kops
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
RUN rm get_helm.sh

WORKDIR /home/ubuntu/kops
ENTRYPOINT /bin/bash
