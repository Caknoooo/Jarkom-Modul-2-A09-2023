echo -e '
nameserver 192.173.1.2 # IP Yudhistira
nameserver 192.173.2.2 # IP Werkudara
nameserver 192.168.122.1
' > /etc/resolv.conf
apt-get update
apt-get install dnsutils -y
apt-get install lynx -y

apt-get install bind9 nginx -y

echo '
  upstream backend {
    server 192.173.3.2; # IP PrabuKusuma
    server 192.173.3.3; # IP Abimanyu
    server 192.173.3.4; # IP Wisanggeni
  }

  server {
    listen 80;
    server_name arjuna.a09.com www.arjuna.a09.com;

    location / {
      proxy_pass http://backend;
    }
  }
' > /etc/nginx/sites-available/jarkom

ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom

rm /etc/nginx/sites-enabled/default

service nginx restart