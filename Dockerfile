FROM postgres:16 AS previous
FROM postgres:17
USER root
COPY --from=previous /usr/lib/postgresql/16 /usr/lib/postgresql/16
COPY --from=previous /usr/share/postgresql/16 /usr/share/postgresql/16
COPY --chmod=0775 upgrade-bitnami-16-to-17.sh /upgrade-bitnami-16-to-17.sh
RUN apt update -y && apt install -y sudo vim \
    && sed -i s/999:999/1001:1001/ /etc/passwd \
    && chmod ugo+x /upgrade-bitnami-16-to-17.sh
CMD ["/bin/sh","-c","sleep infinty"]
ENTRYPOINT [ "/bin/sh","-c","echo 'ROOT MODE'" ] 