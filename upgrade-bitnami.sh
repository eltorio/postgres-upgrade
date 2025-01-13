#!/bin/bash
# Upgrade Bitnami PostgreSQL from one version to the next version
# It is a very basic script that can be improved
# Don't forget to backup your data before running this script

POSTGRES_ROOT=${POSTGRES_ROOT:-"/bitnami/postgresql"}
FROM_VERSION={$FROM_VERSION:-"16"}
TO_VERSION={$TO_VERSION:-"17"}

echo "Upgrading PostgreSQL from $FROM_VERSION to $TO_VERSION"
echo "Make sure you have a backup of your data before running this script"
echo "Source data directory: $POSTGRES_ROOT/data"
echo "  datas will be moved to $POSTGRES_ROOT/data$FROM_VERSION"
echo "Press any key to continue or CTRL+C to cancel"
read -n 1 -s
cd /tmp || exit
mv $POSTGRES_ROOT/data $POSTGRES_ROOT/data$FROM_VERSION
mkdir $POSTGRES_ROOT/data
pg_ctl initdb -D $POSTGRES_ROOT/data
cp $POSTGRES_ROOT/data/*.conf $POSTGRES_ROOT/data$FROM_VERSION/
chmod -R 0750 $POSTGRES_ROOT/data$FROM_VERSION
pg_upgrade -b /usr/lib/postgresql/$FROM_VERSION/bin --old-datadir $POSTGRES_ROOT/data$FROM_VERSION --new-datadir $POSTGRES_ROOT/data -B /usr/lib/postgresql/$TO_VERSION/bin
rm -rf $POSTGRES_ROOT/data/pg_upgrade_output.d/*
