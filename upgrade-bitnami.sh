#!/bin/bash
FROM_VERSION={$FROM_VERSION:-"16"}
TO_VERSION={$TO_VERSION:-"17"}
cd /tmp || exit
mv /bitnami/postgresql/data /bitnami/postgresql/data$FROM_VERSION
mkdir /bitnami/postgresql/data
pg_ctl initdb -D /bitnami/postgresql/data
cp /bitnami/postgresql/data/*.conf /bitnami/postgresql/data$FROM_VERSION/
chmod -R 0750 /bitnami/postgresql/data$FROM_VERSION
pg_upgrade -b /usr/lib/postgresql/$FROM_VERSION/bin --old-datadir /bitnami/postgresql/data$FROM_VERSION --new-datadir /bitnami/postgresql/data -B /usr/lib/postgresql/$TO_VERSION/bin
rm -rf /bitnami/postgresql/data/pg_upgrade_output.d/*
