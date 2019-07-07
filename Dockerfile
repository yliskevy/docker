FROM alpine:3.2

ENV TERRAFORM_VERSION=0.11.14 \
    PYTHON_VERSION=2.7.12-r0 \
    ANSIBLE_VERSION=2.8.0

VOLUME ["/data"]

WORKDIR /data


RUN apk update && \
    apk add curl openssh python=${PYTHON_VERSION} bash ca-certificates git openssl unzip wget py-pip && \
    pip install awscli
RUN apk --update add --virtual build-dependencies \
            python-dev libffi-dev openssl-dev build-base  && \
            pip install --upgrade pip cffi &&\
            pip install ansible==${ANSIBLE_VERSION}


RUN cd /usr/local/bin && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    install -m 755 terraform /usr/bin/terraform && \
    install -d ${HOME}/.terraform.d/plugins/linux_amd64 && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

CMD ["/bin/bash"]
