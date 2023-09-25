# oag-reverse-proxy

Based on this article : https://francoisromain.medium.com/host-multiple-websites-with-https-inside-docker-containers-on-a-single-server-18467484ab95

### 1. directory

Create a nginx-proxy directory next to the websites directories.

> /home/ubuntu/oag-reverse-proxy/nginx-proxy

First create the network:

$ docker network create nginx-proxy

Then create the reverse proxy with the nginx, nginx-gen and nginx-letsencrypt containers from the docker-compose.yml file:

$ cd /home/ubuntu/oag-reverse-proxy/nginx-proxy
$ docker-compose up -d


# ----- ----- ---- --- -- -- -- --- DEPRECATED AS OF 24/09/2023 ---- --- -- -- -- --- -- 

run by typing :

> sudo docker-compose up -d


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
