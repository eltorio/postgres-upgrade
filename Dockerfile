FROM postgres:16
USER root
RUN apt update -y && apt install sudo
CMD ["/bin/sh","-c","sleep infinty"]
ENTRYPOINT [ "/bin/sh","-c","echo 'ROOT MODE'" ]