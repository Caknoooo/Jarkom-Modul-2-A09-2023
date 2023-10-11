echo -e '
nameserver 192.173.1.2 # IP Yudhistira
nameserver 192.173.2.2 # IP Werkudara
nameserver 192.168.122.1
' > /etc/resolv.conf
apt-get update
apt-get install dnsutils -y
apt-get install lynx -y

apt install nginx php php-fpm -y

# 9 dan 10
mkdir /var/www/jarkom

echo "<?php
\$hostname = gethostname();
\$date = date('Y-m-d H:i:s');
\$php_version = phpversion();
\$username = get_current_user();

echo \"Hello World!<br>\";
echo \"Saya adalah: \$username<br>\";
echo \"Saat ini berada di: \$hostname<br>\";
echo \"Versi PHP yang saya gunakan: \$php_version<br>\";
echo \"Tanggal saat ini: \$date<br>\";
?>" > /var/www/jarkom/index.php

service php7.0-fpm start

echo 'server {
        listen 8001;

        root /var/www/jarkom;
        index index.php index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                try_files $uri $uri/ /index.php?$query_string;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }
}' > /etc/nginx/sites-available/jarkom

ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom

rm /etc/nginx/sites-enabled/default

service nginx restart

# Test 
# lynx http://192.173.3.2:8001
# curl http://192.173.3.2:8001