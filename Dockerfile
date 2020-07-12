FROM ubuntu:latest
LABEL maintainer='github/awscyberrange' \
      author='cappetta' \
      release='v0.2' \
      release_date='2020-07-08' \
      commit_hash='alter-each-time-to-rebuild-all-steps'


ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y wget git make ruby ruby-bundler ruby jq vim nano \
    ruby-dev make gcc libc-dev g++ python python-dev python3-pip build-essential \
    ruby-rdoc vagrant tmux && pip3 install awscli && rm -rf /var/lib/apt/lists/*

RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec
RUN wget https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip \
    -O /tmp/terraform.zip && cd /tmp/ && unzip /tmp/terraform.zip && ls -alrt /tmp/ && mv /tmp/terraform /usr/bin/terraform

RUN git clone https://github.com/secdevops-cuse/CyberRange.git /opt/AWSCyberRange && \
    git clone https://github.com/rebuy-de/aws-nuke.git /opt/aws-nuke && \
    wget https://github.com/rebuy-de/aws-nuke/releases/download/v2.14.0/aws-nuke-v2.14.0-linux-amd64 -O /usr/bin/aws-nuke \
    chmod 755 /usr/bin/aws-nuke

RUN inspec version --chef-license accept-silent

WORKDIR /opt/AWSCyberRange

CMD echo "usage: docker run -it <image> /bin/bash"

HEALTHCHECK NONE