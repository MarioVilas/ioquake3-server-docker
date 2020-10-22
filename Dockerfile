FROM ubuntu:latest
RUN apt update && apt install -y ioquake3-server
ENTRYPOINT [ "/usr/lib/ioquake3/ioq3ded", "+exec", "server.cfg" ]
RUN groupadd -r ioquake3 && \
    useradd -r -g ioquake3 ioquake3 && \
    mkdir -p /home/ioquake3/.q3a && \
    chown -R ioquake3:ioquake3 /home/ioquake3 && \
    chmod 755 /home/ioquake3 && \
    chmod 755 /home/ioquake3/.q3a
USER ioquake3
EXPOSE 27960/udp
