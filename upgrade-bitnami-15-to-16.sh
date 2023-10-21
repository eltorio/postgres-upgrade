#!/bin/bash
cd /tmp || exit
mv /bitnami/postgresql/data /bitnami/postgresql/data15
mkdir /bitnami/postgresql/data
pg_ctl initdb -D /bitnami/postgresql/data
cp /bitnami/postgresql/data/*.conf /bitnami/postgresql/data15/
chmod -R 0750 /bitnami/postgresql/data15
pg_upgrade -b /usr/lib/postgresql/15/bin --old-datadir /bitnami/postgresql/data15 --new-datadir /bitnami/postgresql/data -B /usr/lib/postgresql/16/bin
rm -rf /bitnami/postgresql/data/pg_upgrade_output.d/*
