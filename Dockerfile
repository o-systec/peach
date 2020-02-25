FROM alpine

LABEL maintainer="guozheng-yang@systechn.com"

RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/community/" >> /etc/apk/repositories

RUN apk update && \
    apk add --no-cache openssh tzdata && \
    ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \
    echo "admin:x:501:" >> /etc/group && \
    echo "admin:x:501:501:admin:/home/admin:/bin/sh" >> /etc/passwd && \
    mkdir -p /home/admin/.ssh && \
    touch /home/admin/.ssh/authorized_keys && \
    chmod 0600 /home/admin/.ssh/authorized_keys && \
    chown -R admin:admin /home/admin

COPY sshd_config /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]

