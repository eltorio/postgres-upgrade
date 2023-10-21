FROM postgres:16
USER root
RUN apt update -y && apt install sudo \
    && sed -i s/999:999/1001:1001/ /etc/passwd
CMD ["/bin/sh","-c","sleep infinty"]
ENTRYPOINT [ "/bin/sh","-c","echo 'ROOT MODE'" ]