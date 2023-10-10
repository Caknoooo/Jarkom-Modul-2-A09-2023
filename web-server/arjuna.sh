apt-get update
apt-get install nginx -y

service nginx start

echo 'upstream backend {
    server 192.173.3.2;
    server abimanyu.a09.com;
    server 192.173.3.4;
}

server {
    listen 80;
    server_name arjuna.a09.com www.arjuna.a09.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}' > /etc/nginx/sites-available/arjuna.a09.com