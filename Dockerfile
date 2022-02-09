FROM amazonlinux:2

RUN amazon-linux-extras install epel php7.4 && \
    yum -y update && yum install -y \
    yum-utils \
    shadow-utils \
    procps wget \
    git \
    tar \
    openssl curl zip unzip file cronie epel-release supervisor httpd openssh-server sudo \
    && yum clean all \
    && rm -rf /var/cache/yum

# Set Supervisor Configs
COPY ./conf/supervisord.conf /etc/supervisord.conf

RUN mkdir -p /var/www/html
RUN mkdir -p /root/.ssh

COPY ./conf/ssh/* /etc/ssh/

RUN chmod -R 600 /etc/ssh

RUN useradd -ms /bin/bash ec2-user
RUN useradd sudo
RUN echo 'ec2-user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /root

# Add your port here later. Or create a new docker file to add the port.
# I'll add port 80 for your experiment.
EXPOSE 80 22

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]