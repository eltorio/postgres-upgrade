FROM postgres:16 AS previous
FROM postgres:17

ENV FROM_VERSION=16
ENV TO_VERSION=17
USER root
COPY --from=previous /usr/lib/postgresql/16 /usr/lib/postgresql/16
COPY --from=previous /usr/share/postgresql/16 /usr/share/postgresql/16
COPY --chmod=0775 upgrade-bitnami.sh /upgrade-bitnami.sh
RUN apt update -y && apt install -y sudo vim \
    && sed -i s/999:999/1001:1001/ /etc/passwd \
    && chmod ugo+x /upgrade-bitnami.sh
CMD ["/bin/sh","-c","sleep infinty"]
ENTRYPOINT [ "/bin/sh","-c","echo 'ROOT MODE'" ] 