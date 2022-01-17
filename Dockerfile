ARG version=8

FROM centos:${version}

RUN yum install -y xinetd sudo

# create /docker-entrypoint.sh
RUN echo -e \
"#!/bin/bash\n\
xinetd -dontfork -stayalive"\
> /docker-entrypoint.sh

# create /etc/xinetd.d/check-mk-agent
RUN echo -e \
"service check_mk\n\
{\n\
        type           = UNLISTED\n\
        port           = 6556\n\
        socket_type    = stream\n\
        protocol       = tcp\n\
        wait           = no\n\
        user           = root\n\
        server         = /usr/local/bin/check_mk_agent\n\
        #only_from      = 1.1.1.1\n\
        disable        = no\n\
}" \
> /etc/xinetd.d/check-mk-agent

RUN useradd ansible && \
    #echo 'ansible' | passwd ansible --stdin && \
    #echo 'root' | passwd root --stdin && \
    usermod -aG wheel ansible && \
    sed -i -e 's/^%wheel/#%wheel/' -e 's/^# %wheel/%wheel/' /etc/sudoers && \
    chmod 777 docker-entrypoint.sh

EXPOSE 6556/tcp

ENTRYPOINT ["/docker-entrypoint.sh"]
