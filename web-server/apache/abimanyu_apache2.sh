echo -e '
nameserver 192.173.1.2 # IP Yudhistira
nameserver 192.173.2.2 # IP Werkudara
nameserver 192.168.122.1
' > /etc/resolv.conf
apt-get update
apt-get install dnsutils -y
apt-get install lynx -y
apt-get install nginx -y
service nginx start
apt-get install apache2 -y
apt-get install libapache2-mod-php7.0 -y
service apache2 start
apt-get install wget -y
apt-get install unzip -y
apt-get install php -y
echo -e "\n\nPHP Version:"
php -v

wget -O '/var/www/abimanyu.a09.com' 'https://drive.usercontent.google.com/download?id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc'
unzip -o /var/www/abimanyu.a09.com -d /var/www/
mv /var/www/abimanyu.yyy.com /var/www/abimanyu.a09
rm /var/www/abimanyu.a09.com
rm -rf /var/www/abimanyu.yyy.com

wget -O '/var/www/parikesit.abimanyu.a09.com' 'https://drive.usercontent.google.com/download?id=1LdbYntiYVF_NVNgJis1GLCLPEGyIOreS'
unzip -o /var/www/parikesit.abimanyu.a09.com -d /var/www/
mv /var/www/parikesit.abimanyu.yyy.com /var/www/parikesit.abimanyu.a09
rm /var/www/parikesit.abimanyu.a09.com
rm -rf /var/www/parikesit.abimanyu.yyy.com
mkdir /var/www/parikesit.abimanyu.a09/secret

wget -O '/var/www/rjp.baratayuda.abimanyu.a09.com' 'https://drive.usercontent.google.com/download?id=1pPSP7yIR05JhSFG67RVzgkb-VcW9vQO6'
unzip -o /var/www/rjp.baratayuda.abimanyu.a09.com -d /var/www/
mv /var/www/rjp.baratayuda.abimanyu.yyy.com /var/www/rjp.baratayuda.abimanyu.a09
rm /var/www/rjp.baratayuda.abimanyu.a09.com
rm -rf /var/www/rjp.baratayuda.abimanyu.yyy.com

# 11
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/abimanyu.a09.com.conf

rm /etc/apache2/sites-available/000-default.conf

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/abimanyu.a09

  ServerName abimanyu.a09.com
  ServerAlias www.abimanyu.a09.com

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/abimanyu.a09.com.conf

a2ensite abimanyu.a09.com.conf

service apache2 restart

# Test
# lynx abimanyu.a09.com
# curl abimanyu.a09.com

# 12
echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/abimanyu.a09
  ServerName abimanyu.a09.com
  ServerAlias www.abimanyu.a09.com

  <Directory /var/www/abimanyu.a09/index.php/home>
          Options +Indexes
  </Directory>

  Alias "/home" "/var/www/abimanyu.a09/index.php/home"

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/abimanyu.a09.com.conf

service apache2 restart

# Test 
# lynx abimanyu.a09.com/home
# curl abimanyu.a09.com/home

# 13
# Selain itu, pada subdomain www.parikesit.abimanyu.yyy.com, DocumentRoot disimpan pada /var/www/parikesit.abimanyu.yyy

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.a09
  ServerName parikesit.abimanyu.a09.com
  ServerAlias www.parikesit.abimanyu.a09.com

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.a09.com.conf

a2ensite parikesit.abimanyu.a09.com.conf

service apache2 restart

# Test
# lynx parikesit.abimanyu.a09.com
# curl parikesit.abimanyu.a09.com

# 14
# Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden).

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.a09
  ServerName parikesit.abimanyu.a09.com
  ServerAlias www.parikesit.abimanyu.a09.com

  <Directory /var/www/parikesit.abimanyu.a09/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.a09/secret>
          Options -Indexes
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.a09/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.a09/secret"

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.a09.com.conf

service apache2 restart

# Test
# lynx parikesit.abimanyu.a09.com/public
# lynx parikesit.abimanyu.a09.com/secret

# 15
# Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.a09
  ServerName parikesit.abimanyu.a09.com
  ServerAlias www.parikesit.abimanyu.a09.com

  <Directory /var/www/parikesit.abimanyu.a09/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.a09/secret>
          Options -Indexes
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.a09/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.a09/secret"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.a09.com.conf

service apache2 restart

# Test
# lynx parikesit.abimanyu.a09.com/publicc
# lynx parikesit.abimanyu.a09.com/secret

# 16
# Buatlah suatu konfigurasi virtual host agar file asset www.parikesit.abimanyu.yyy.com/public/js menjadi www.parikesit.abimanyu.yyy.com/js

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.a09
  ServerName parikesit.abimanyu.a09.com
  ServerAlias www.parikesit.abimanyu.a09.com

  <Directory /var/www/parikesit.abimanyu.a09/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.a09/secret>
          Options -Indexes
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.a09/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.a09/secret"
  Alias "/js" "/var/www/parikesit.abimanyu.a09/public/js"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.a09.com.conf

service apache2 restart

# Test
# lynx parikesit.abimanyu.a09.com/js

# 17
# Agar aman, buatlah konfigurasi agar www.rjp.baratayuda.abimanyu.yyy.com hanya dapat diakses melalui port 14000 dan 14400.

echo -e '<VirtualHost *:14000 *:14400>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/rjp.baratayuda.abimanyu.a09
  ServerName rjp.baratayuda.abimanyu.a09.com
  ServerAlias www.rjp.baratayuda.abimanyu.a09.com

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/rjp.baratayuda.abimanyu.a09.com.conf

echo -e '# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 14000
Listen 14400

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet' > /etc/apache2/ports.conf

a2ensite rjp.baratayuda.abimanyu.a09.com.conf

service apache2 restart

# Test
# lynx rjp.baratayuda.abimanyu.a09.com:14000
# lynx rjp.baratayuda.abimanyu.a09.com:14400

# 18
# Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada /var/www/rjp.baratayuda.abimanyu.yyy.

echo -e '<VirtualHost *:14000 *:14400>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/rjp.baratayuda.abimanyu.a09
  ServerName rjp.baratayuda.abimanyu.a09.com
  ServerAlias www.rjp.baratayuda.abimanyu.a09.com

  <Directory /var/www/rjp.baratayuda.abimanyu.a09>
          AuthType Basic
          AuthName "Restricted Content"
          AuthUserFile /etc/apache2/.htpasswd
          Require valid-user
  </Directory>

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/rjp.baratayuda.abimanyu.a09.com.conf

htpasswd -c -b /etc/apache2/.htpasswd Wayang baratayudaa09

a2ensite rjp.baratayuda.abimanyu.a09.com.conf

service apache2 restart

# Test
# lynx rjp.baratayuda.abimanyu.a09.com:14000
# lynx rjp.baratayuda.abimanyu.a09.com:14400

# 19
# Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke www.abimanyu.yyy.com (alias)

echo -e '<VirtualHost *:80>
    ServerAdmin webmaster@abimanyu.a09.com
    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    Redirect / http://www.abimanyu.a09.com/
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

apache2ctl configtest

service apache2 restart

# Test
# lynx 192.173.3.3


# 20
# Karena website www.parikesit.abimanyu.yyy.com semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.

echo 'RewriteEngine On
RewriteCond %{REQUEST_URI} ^/public/images/(.*)abimanyu(.*)
RewriteCond %{REQUEST_URI} !/public/images/abimanyu.png
RewriteRule abimanyu http://parikesit.abimanyu.a09.com/public/images/abimanyu.png$1 [L,R=301]' > /var/www/parikesit.abimanyu.a09/.htaccess

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.a09

  ServerName parikesit.abimanyu.a09.com
  ServerAlias www.parikesit.abimanyu.a09.com

  <Directory /var/www/parikesit.abimanyu.a09/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.a09/secret>
          Options -Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.a09>
          Options +FollowSymLinks -Multiviews
          AllowOverride All
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.a09/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.a09/secret"
  Alias "/js" "/var/www/parikesit.abimanyu.a09/public/js"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.a09.com.conf

a2enmod rewrite

service apache2 restart

# Test
# lynx parikesit.abimanyu.a09.com/public/images/not-abimanyu.png
# lynx parikesit.abimanyu.a09.com/public/images/abimanyu-student.jpg
# lynx parikesit.abimanyu.a09.com/public/images/abimanyu.png
# lynx parikesit.abimanyu.a09.com/public/images/notabimanyujustmuseum.177013
