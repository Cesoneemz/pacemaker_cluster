FROM debian:latest

RUN apt-get update && apt-get install -y \
    systemd \
    systemd-sysv \
    dbus \
    openssh-server \
    fence-agents \
    pcs \
    corosync \
    pacemaker \
    crmsh \
    python3-pip \
    iproute2 \
    netmask \
    nginx \
    && apt-get clean

RUN mkdir -p /var/run/sshd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin without-password/' /etc/ssh/sshd_config

RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

RUN pcs cluster destroy

COPY ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa

RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY nginx.conf /etc/nginx/nginx.conf

RUN echo "hacluster:123" | chpasswd

CMD ["/lib/systemd/systemd"]