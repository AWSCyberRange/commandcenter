FROM ubuntu:latest
LABEL maintainer='github/awscyberrange' \
      author='cappetta' \
      release='v0.1' \
      release_date='2020-06-12'

RUN apt update && apt install wget -y git make ruby ruby-bundler ruby ruby-dev make gcc libc-dev g++ python python-dev py-pip build-base ruby-rdoc && pip install awscli

RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec
RUN wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip -O /tmp/terraform.zip && unzip /tmp/terraform.zip && mv /tmp/terraform /usr/bin/terraform

HEALTHCHECK NONE

