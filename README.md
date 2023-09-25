# oag-reverse-proxy

# Directories for the whole setup

## oag_site_web
- contains the fastapi web site for oneagegroup.com

## class_management_app
- contains the fastapi web site for catesdb.oneagegroup.com

## oag-reverse-proxy
- contains the docker compose file to launch the whole setup

# oneagegroup.com site web fastapi :

- will be launched from the docker compose file

### OLD

> cd oag_site_web
#
> sudo docker build -t oag-com .

image : oag-com:latest

# catesdb.oneagegroup.com site web fastapi :

- will be launched from the docker compose file

### OLD

> cd class_management_app
#
> sudo docker build -t class-management .

image : class-management:latest
