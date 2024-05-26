FROM debian:latest

RUN apt-get update && apt-get install -y \
    ansible \
    openssh-server \
    sshpass \
    python3-pip \
    iproute2 \
    netmask \
    nginx \
    && apt-get clean

RUN mkdir -p /var/run/sshd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin without-password/' /etc/ssh/sshd_config

RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY ssh/* /root/.ssh/

CMD ["/entrypoint.sh"]