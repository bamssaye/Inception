#!/bin/sh
set -ex
# if [! -f /etc/ssl/private/nginx-ssl.key ]; then
openssl req -x509 -newkey rsa:2048 -nodes -keyout $KEY_ -out $CERTS_ -days 365 -subj "/CN=$DOMAIIN_NAME"
# fi

cat << x80"" >> /files/default.conf
server {

	listen 80;
	listen [::]:80;
	server_name bamssaye.42.fr;
	return 301 https://$host$request_uri;

}

server {

	listen 443 ssl;
	listen [::]:443 ssl;
	
	server_name bamssaye.42.fr;
	
	ssl_certificate  /etc/ssl/certs/nginx-ssl.crt;
	ssl_certificate_key /etc/ssl/private/nginx-ssl.key;
	ssl_protocols TLSv1.2 TLSv1.3;

	root /var/www/html;
	index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }
	location ~ \.php$ {
    		fastcgi_split_path_info ^(.+\.php)(/.+)$;
    		fastcgi_pass wordpress:9000;
    		fastcgi_index index.php;
    		include fastcgi_params;
    		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    		fastcgi_param PATH_INFO $fastcgi_path_info;
            fastcgi_param HTTP_HOST $host;
    	}

}
x80
# cat /files/default.conf
mv /files/default.conf /etc/nginx/http.d/default.conf

nginx -g "daemon off;"