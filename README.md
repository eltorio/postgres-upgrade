# postgres-upgrade
## MAKE A FULL BACKUP PRIOR TO ANY UPGRADE
This is a very simple image for upgrading to Bitnami Postgresql image from v15 to v16.  
When running it stops on sleep infiny as root user, letting administrators to run the necessaries upgrades.

A sample script `upgrade-bitnami-15-to-16.sh` is provided as an example.  
It contains all the steps I need on my Kubernetes services but not you might need to adapt it to your requirements.  
For editing vim is included.  

**MAKE A FULL BACKUP **before anything. And before…  
MAKE A FULL BACKUP !!!!!!

# How to for an helm chart with bitnami postgresql dependency
in your values.yaml add:
```yaml
postgresql:
  image:
    debug: true
    registry: docker.io
    tag: 15-to-16
    repository: highcanfly/postgres-upgrade
    pullPolicy: Always
  diagnosticMode:
    enabled: true
```
Upgrade your chart for changing the Docker image to this one.  
Log in the postgres-0 container
run the necessary commands for upgrading the database to v16. Or if you are lucky make a full backup and use `/upgrade-bitnami-15-to-16.sh` 

# if you loose your datas ?
You forgot to make a **full backup**