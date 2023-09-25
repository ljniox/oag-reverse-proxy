upstream app_server {
    server unix:/home/ubuntu/projet_hsh/run/run/gunicorn.sock fail_timeout=0;
}

server {

    # add here the ip address of your server
    # or a domain pointing to that ip (like example.com or www.example.com)
    server_name hsh.3xperts.tech;

    keepalive_timeout 5;
    client_max_body_size 4G;

    access_log /home/ubuntu/projet_hsh/run/logs/nginx-access.log;
    error_log /home/ubuntu/projet_hsh/run/logs/nginx-error.log;

    location / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;
                        
        if (!-f $request_filename) {
            proxy_pass http://app_server;
            break;
        }
        }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/hsh.3xperts.tech/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/hsh.3xperts.tech/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}


server {
    if ($host = hsh.3xperts.tech) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    listen 8090;
    server_name hsh.3xperts.tech;
    return 404; # managed by Certbot


}
