FROM postgres:15 as previous
FROM postgres:16
USER root
RUN apt update -y && apt install sudo \
    && sed -i s/999:999/1001:1001/ /etc/passwd
COPY --from=previous /usr/lib/postgresql/15 /usr/lib/postgresql/15
CMD ["/bin/sh","-c","sleep infinty"]
ENTRYPOINT [ "/bin/sh","-c","echo 'ROOT MODE'" ]