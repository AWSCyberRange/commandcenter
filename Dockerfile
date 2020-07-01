FROM ubuntu:latest
LABEL maintainer='github/awscyberrange' \
      author='cappetta' \
      release='v0.1' \
      release_date='2020-06-12'

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y wget git make ruby ruby-bundler ruby \
    ruby-dev make gcc libc-dev g++ python python-dev python3-pip build-essential \
    ruby-rdoc vagrant tmux && pip3 install awscli && rm -rf /var/lib/apt/lists/*

RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec
RUN wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip \
    -O /tmp/terraform.zip && cd /tmp/ && unzip /tmp/terraform.zip && ls -alrt /tmp/ && mv /tmp/terraform /usr/bin/terraform

RUN git clone https://github.com/secdevops-cuse/CyberRange.git /opt/AWSCyberRange
RUN inspec version --chef-license accept-silent

WORKDIR /opt/AWSCyberRange

CMD echo "usage: docker run -it <image> /bin/bash"

HEALTHCHECK NONE