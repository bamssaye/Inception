#!/bin/sh
#set -ex

openssl req -x509 -newkey rsa:2048 -nodes -keyout $KEY_ -out $CERTS_ -days 365 -subj "/CN=$DOMAIIN_NAME"
cat << x80"" >> /files/default.conf
server {
    listen 443 ssl;
    server_name www.bamssaye.42.fr bamssaye.42.fr;

    root /var/www/html;
    index index.php index.html;

    ssl_certificate     /etc/ssl/certs/nginx-ssl.crt;
    ssl_certificate_key /etc/ssl/private/nginx-ssl.key;
    ssl_protocols       TLSv1.2 TLSv1.3;

    location / {
        try_files $uri $uri/ /index.php?$args;
    }
    location /adminer {
        proxy_pass http://adminer:8080;
        proxy_set_header Host $host;
    }
    location /me {
        proxy_pass http://website:80;
        proxy_set_header Host $host;
    }
    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }

    location ~ /\.ht {
        deny all;
    }
}
x80
mv /files/default.conf /etc/nginx/http.d/default.conf

nginx -g "daemon off;"