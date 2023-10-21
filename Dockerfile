FROM postgres:15 as previous
FROM postgres:16
USER root
COPY --from=previous /usr/lib/postgresql/15 /usr/lib/postgresql/15
COPY --from=previous /usr/share/postgresql/15 /usr/share/postgresql/15
COPY --chmod=0775 upgrade-bitnami-15-to-16.sh /upgrade-bitnami-15-to-16.sh
RUN apt update -y && apt install sudo vim \
    && sed -i s/999:999/1001:1001/ /etc/passwd \
    && chmod ugo+x /upgrade-bitnami-15-to-16.sh
CMD ["/bin/sh","-c","sleep infinty"]
ENTRYPOINT [ "/bin/sh","-c","echo 'ROOT MODE'" ] 