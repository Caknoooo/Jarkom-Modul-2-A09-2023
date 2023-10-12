# Jarkom-Modul-2-A09-2023
**Praktikum Jaringan Komputer Modul 2 Tahun 2023**

## Author
| Nama | NRP |Github |
|---------------------------|------------|--------|
|Andika Laksana Putra | 5025211001 | https://github.com/DikaPutra07 |
|M. Naufal Badruttamam | 5025211240 | https://github.com/Caknoooo |

# Laporan Resmi
## Daftar Isi
- [Laporan Resmi](#laporan-resmi)
  - [Daftar Isi](#daftar-isi)
  - [Topologi](#topologi)
  - [Config](#config)
  - [Sebelum Memulai](#sebelum-memulai)
- [Soal 1](#Soal-1)
  - [Script](#script)
  - [Result](#result)
- [Soal 2](#Soal-2)
  - [Script](#script-1)
  - [Result](#result-1)
- [Soal 3](#Soal-3)
  - [Script](#script-2)
  - [Result](#result-2)
- [Soal 4](#Soal-4)
  - [Script](#script-3)
  - [Result](#result-3)
- [Soal 5](#Soal-5)
  - [Script](#script-4)
  - [Result](#result-4)
- [Soal 6](#Soal-6)
  - [Script](#script-5)
  - [Result](#result-5)
- [Soal 7](#Soal-7)
  - [Script](#script-6)
  - [Result](#result-6)
- [Soal 8](#Soal-8)
  - [Script](#script-7)
  - [Result](#result-7)
- [Soal 9](#Soal-9)
  - [Script](#script-8)
  - [Result](#result-8)
- [Soal 10](#Soal-10)
  - [Script](#script-9)
  - [Result](#result-9)
- [Soal 11](#Soal-11)
  - [Script](#script-10)
  - [Result](#result-10)
- [Soal 12](#Soal-12)
  - [Script](#script-11)
  - [Result](#result-11)
- [Soal 13](#Soal-13)
  - [Script](#script-12)
  - [Result](#result-12)
- [Soal 14](#Soal-14)
  - [Script](#script-13)
  - [Result](#result-13)
- [Soal 15](#Soal-15)
  - [Script](#script-14)
  - [Result](#result-14)
- [Soal 16](#Soal-16)
  - [Script](#script-15)
  - [Result](#result-15)
- [Soal 17](#Soal-17)
  - [Script](#script-16)
  - [Result](#result-16)
- [Soal 18](#Soal-18)
  - [Script](#script-17)
  - [Result](#result-17)
- [Soal 19](#Soal-19)
  - [Script](#script-18)
  - [Result](#result-18)
- [Soal 20](#Soal-20)
  - [Script](#script-19)
  - [Result](#result-19)

## Topologi
![image](https://github.com/Caknoooo/Jarkom-Modul-2-A09-2023/assets/92671053/aef9ddca-6b6e-43f0-9e07-690cbe26a9c0)

## Config 
- **Pandudewanata**
  ```
  auto eth0
  iface eth0 inet dhcp

  auto eth1
  iface eth1 inet static
          address 192.173.1.1
          netmask 255.255.255.0

  auto eth2
  iface eth2 inet static
          address 192.173.2.1
          netmask 255.255.255.0

  auto eth3
  iface eth3 inet static
          address 192.173.3.1
          netmask 255.255.255.0
  ```
- **Yudhistira**
  ```
  auto eth0
  iface eth0 inet static
          address 192.173.1.2
          netmask 255.255.255.0
          gateway 192.173.1.1
  ```
- **Nakula**
  ```
  auto eth0
  iface eth0 inet static
          address 192.173.1.3
          netmask 255.255.255.0
          gateway 192.173.1.1
  ```
- **Werkudara**
  ```
  auto eth0
  iface eth0 inet static
          address 192.173.2.2
          netmask 255.255.255.0
          gateway 192.173.2.1
  ```
- **Sadewa**
  ```
  auto eth0
  iface eth0 inet static
          address 192.173.2.3
          netmask 255.255.255.0
          gateway 192.173.2.1
  ```
- **Prabukusuma**
  ```
  auto eth0
  iface eth0 inet static
          address 192.173.3.2
          netmask 255.255.255.0
          gateway 192.173.3.1
  ```
- **Abimanyu**
  ```
  auto eth0
  iface eth0 inet static
          address 192.173.3.3
          netmask 255.255.255.0
          gateway 192.173.3.1
  ```
- **Wisanggeni**
  ```
  auto eth0
  iface eth0 inet static
          address 192.173.3.4
          netmask 255.255.255.0
          gateway 192.173.3.1
  ```
- **Arjuna**
  ```
  auto eth0
  iface eth0 inet static
          address 192.173.3.5
          netmask 255.255.255.0
          gateway 192.173.3.1
  ```
- **Notes of Config**
  ```
  Pandudewanata	: 192.173.1.1 (Switch 1)
  Yudhistira	: 192.173.1.2
  Nakula	        : 192.173.1.3
  Pandudewanata	: 192.173.2.1 (Switch 2)
  Werkudara	: 192.173.2.2
  Sadewa	        : 192.173.2.3
  Pandudewanata	: 192.173.3.1 (Switch 3)
  Prabukusuma	: 192.173.3.2
  Abimanyu	: 192.173.3.3
  Wisanggeni	: 192.173.3.4
  Arjuna	        : 192.173.3.5
  ```

### Sebelum memulai 
setiap node, kita inisiasi pada `.bashrc` menggunakan `nano`

- **Pandudewanata**
  ```
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.173.0.0/16
  echo 'nameserver 192.168.122.1' > /etc/resolv.conf
  ```
- **Master & Slave**
  ```
  echo 'nameserver 192.168.122.1' > /etc/resolv.conf
  apt-get update
  apt-get install bind9 -y      
  ```
- **Client**
  ```
  echo -e '
  nameserver 192.173.1.2 # IP Yudhistira
  nameserver 192.173.2.2 # IP Werkudara
  nameserver 192.168.122.1
  ' > /etc/resolv.conf
  apt-get update
  apt-get install dnsutils -y
  apt-get install lynx -y
  ```
- **Nginx Config**
  ```
  apt install nginx php php-fpm -y
  ```
- **Apache2 Config**
  ```
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
  ```
- **Zip Download and Unzip**
  ```
  wget -O '/var/www/abimanyu.a09.com' 'https://     drive.usercontent.google.com/download?id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc'
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
  ```

## Soal 1 
> Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Buatlah topologi dengan pembagian sebagai berikut. Folder topologi dapat diakses pada drive berikut

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Disini kita perlu melakukan testing terhadap semua node yang ada. Disini kami melakukan testing ada client `nakula` dan `sadewa`

### Script
**Nakula dan Sadewa**
```
ping google.com -c 5
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/1d45043b-1756-49a2-9d4a-533547ec6a1c)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/8603655c-dcf8-48ae-9804-797b36c5ea6d)


## Soal 2 
> Buatlah website utama dengan akses ke arjuna.yyy.com dengan alias www.arjuna.yyy.com dengan yyy merupakan kode kelompok.
Config

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu

### Script

Pada node DNS Master, kita perlu melakukan setup terlebih dahulu sebagai berikut 

**Yudhistira**
```
echo 'zone "arjuna.a09.com" {
        type master;
        file "/etc/bind/jarkom/arjuna.a09.com";
        allow-transfer { 192.173.3.5; }; // IP Arjuna
};' > /etc/bind9/named.conf.local

mkdir /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/arjuna.a09.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     arjuna.a09.com. root.arjuna.a09.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      arjuna.a09.com.
@       IN      A       192.173.1.2     ; IP Yudhistira
www     IN      CNAME   arjuna.a09.com.' > /etc/bind/jarkom/arjuna.a09.com

service bind9 restart
```

**Arjuna**

Jangan lupa untuk setup nameserver terlebih dahulu yang diarahkan ke `IP Node yudhistira`
```
ping arjuna.a09.com -c 5
ping www.arjuna.a09.com -c 5
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/cd309f92-2a32-4620-a06f-dbd5ac692d26)


## Soal 3
> Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu

### Script

Pada node DNS Master, kita perlu melakukan setup terlebih dahulu sebagai berikut 

**Yudhistira**
```
echo 'zone "arjuna.a09.com" {
        type master;
        file "/etc/bind/jarkom/arjuna.a09.com";
        allow-transfer { 192.173.3.5; }; // IP Arjuna
};

zone "abimanyu.a09.com" {
        type master;
        file "/etc/bind/jarkom/abimanyu.a09.com";
        allow-transfer { 192.173.3.3; }; // IP Arjuna
};' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.a09.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.a09.com. root.abimanyu.a09.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.a09.com.
@       IN      A       192.173.1.2     ; IP Yudhistira
www     IN      CNAME   abimanyu.a09.com.' > /etc/bind/jarkom/abimanyu.a09.com

service bind9 restart
```

**Abimanyu**

Jangan lupa untuk setup nameserver terlebih dahulu yang diarahkan ke `IP Node yudhistira`
```
ping abimanyu.a09.com -c 5
ping www.abimanyu.a09.com -c 5
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/023acddc-7aef-4f60-9f92-e8a56ba047df)

## Soal 4
> Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain parikesit.abimanyu.yyy.com yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Untuk subdomain, kita perlu menambahkan `parikesit` dengan type `A` yang mengarah langsung ke IP Abimanyu.

### Script

**Yudhistira**

Cukup menambahkan ``parikesit IN    A       192.173.3.3     ; IP Abimanyu' > /etc/bind/jarkom/abimanyu.a09.com`` saja pada DNS Master.

```
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.a09.com. root.abimanyu.a09.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.a09.com.
@       IN      A       192.173.1.2     ; IP Yudhistira
www     IN      CNAME   abimanyu.a09.com.
parikesit IN    A       192.173.3.3     ; IP Abimanyu' > /etc/bind/jarkom/abimanyu.a09.com

service bind9 restart
```

**Abimanyu**
```
ping parikesit.abimanyu.a09.com -c 5
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/2bd9c244-2a14-4213-88b5-243228b02b94)

## Soal 5
> Buat juga reverse domain untuk domain utama.

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Yang akan kita reverse domainnya adalah Abimanyu. 

### Script
Untuk melakukan reverse domain. Kita perlu untuk mengetahui `IP` dari `Abimanyu`. Karena `IP Abimanyu` kelompok kami adalah `192.173.3.3`, maka kita perlu mengubahnya menjadi `3.3.173.192`

**Yudhistira**
```
echo 'zone "3.173.192.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/3.173.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/3.173.192.in-addr.arpa

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.a09.com. root.abimanyu.a09.com. (
                        2003101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
3.173.192.in-addr.arpa. IN      NS      abimanyu.a09.com.
3                       IN      PTR     abimanyu.a09.com.' > /etc/bind/jarkom/3.173.192.in-addr.arpa

service bind9 restart
```

**Abimanyu / Client yang lain**

Sebelum mengakses, jangan lupa untuk mengembalikan `nameserver` ke DNS Master
```
host -t PTR 192.173.3.3
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/67c26265-8561-461f-80d3-8c2b9d2f5ac0)

## Soal 6
> Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Untuk mengerjakan DNS Slave, kita memerlukan beberapa konfigurasi pada `DNS Master` dan `DNS Slave (Werkudara)`

### Script
**Yudhistira**

Pada `DNS Master` diperlukan setup `also-notify` dan `allow-transfer` agar memberikan izin kepada `IP` yang dituju. 
```
echo 'zone "arjuna.a09.com" {
        type master;
        file "/etc/bind/jarkom/arjuna.a09.com";
        allow-transfer { 192.173.2.2; }; // IP Werkudara
};

zone "abimanyu.a09.com" {
        type master;
        notify yes;
        also-notify { 192.173.2.2; }; // IP Werkudara
        allow-transfer { 192.173.2.2; }; // IP Werkudara
        file "/etc/bind/jarkom/abimanyu.a09.com";
};

zone "3.173.192.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/3.173.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

// Jangan lupa restart lalu stop bind9, untuk melakukan testing slave

service bind9 restart
service bind9 stop
```

**Werkudara (DNS Slave)**
```
echo 'zone "abimanyu.a09.com" {
    type slave;
    masters { 192.173.1.2; }; // Masukan IP Yudhistira
    file "/var/lib/bind/abimanyu.a09.com";
};' >> /etc/bind/named.conf.local

service bind9 restart
```

**Abimanyu**
```
ping abimanyu.a09.com -c 5
ping www.abimanyu.a09.com -c 5
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/56a1f36f-b908-422c-a58e-bda10e3bb592)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/84bd0be0-284b-4692-b767-cc8af6f99672)

## Soal 7
> Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu baratayuda.abimanyu.yyy.com dengan alias www.baratayuda.abimanyu.yyy.com yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Untuk melakukan Delegasi subdomain. Kita memerlukan beberapa configurasi pada `DNS Master` dan `DNS Slave`. Kita juga memerlukan bantuan ``allow-query { any; };`` pada `DNS Master dan Slave. Serta kita memerlukan ``NS`` karena NS digunakan untuk delegasi zona DNS untuk menggunakan authoritative name server yang diberikan

### Script
**Yudhistira**

Pada `DNS Master` kita perlu menambahkan ``ns1     IN      A       192.173.2.2     ; IP Werkudara`` agar mendapatkan authoritative terhadap Werkudara. Kita juga perlu mengaktifkan ``allow-query { any; };`` pada `DNS Master`

```
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.a09.com. root.abimanyu.a09.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.a09.com.
@       IN      A       192.173.1.2     ; IP Yudhistira
www     IN      CNAME   abimanyu.a09.com.
parikesit IN    A       192.173.3.3     ; IP Abimanyu
ns1     IN      A       192.173.2.2     ; IP Werkudara
baratayuda IN   NS      ns1' > /etc/bind/jarkom/abimanyu.a09.com

echo "options {
    directory \"/var/cache/bind\";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable
    // nameservers, you probably want to use them as forwarders.
    // Uncomment the following block, and insert the addresses replacing
    // the all-0's placeholder.

    // forwarders {
    //      0.0.0.0;
    // };

    //========================================================================
    // If BIND logs error messages about the root key being expired,
    // you will need to update your keys.  See https://www.isc.org/bind-keys
    //========================================================================
    //dnssec-validation auto;

    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};" > /etc/bind/named.conf.options

service bind9 restart
```

**Werkudara**

Pada `DNS Slave` Kita perlu untuk mengarahkan `zone` ke `DNS Master` agar authoritative tadi dapat jalan. Kita juga perlu mengaktifkan ``allow-query { any; };`` pada `DNS Slave`

```
echo 'zone "baratayuda.abimanyu.a09.com" {
        type master;
        file "/etc/bind/baratayuda/baratayuda.abimanyu.a09.com";
};' >> /etc/bind/named.conf.local

mkdir /etc/bind/baratayuda

cp /etc/bind/db.local /etc/bind/baratayuda/baratayuda.abimanyu.a09.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.a09.com. root.baratayuda.abimanyu.a09.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      baratayuda.abimanyu.a09.com.
@       IN      A       192.173.3.3     ; IP Abimanyu
www     IN      CNAME   baratayuda.abimanyu.a09.com.' > /etc/bind/baratayuda/baratayuda.abimanyu.a09.com

echo "options {
    directory \"/var/cache/bind\";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable
    // nameservers, you probably want to use them as forwarders.
    // Uncomment the following block, and insert the addresses replacing
    // the all-0's placeholder.

    // forwarders {
    //      0.0.0.0;
    // };

    //========================================================================
    // If BIND logs error messages about the root key being expired,
    // you will need to update your keys.  See https://www.isc.org/bind-keys
    //========================================================================
    //dnssec-validation auto;

    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};" > /etc/bind/named.conf.options

service bind9 restart
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/25400b9c-89d4-423c-803d-1019c386667d)

## Soal 8
> Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu.

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Karena sebelumnya telah melakukan ``delegasi`` terhadap `DNS Slave` dan sekarang kita diberi perintah untuk melakukan subdomain terhadap ``delegasi domain`` tadi. Kita perlu untuk melakukan penambahan pada `DNS Slave` sebagai berikut.

```
rjp             IN      A       192.173.3.3     ; IP Abimanyu
www.rjp         IN      CNAME   rjp.baratayuda.abimanyu.a09.com.
```

### Script
**Werkudara**
```
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.a09.com. root.baratayuda.abimanyu.a09.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      baratayuda.abimanyu.a09.com.
@               IN      A       192.173.3.3     ; IP Abimanyu
www             IN      CNAME   baratayuda.abimanyu.a09.com.
rjp             IN      A       192.173.3.3     ; IP Abimanyu
www.rjp         IN      CNAME   rjp.baratayuda.abimanyu.a09.com.' > /etc/bind/baratayuda/baratayuda.abimanyu.a09.com

service bind9 restart
```
### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/85a7d869-744f-4456-a9ee-6ddccb35d98c)


## Soal 9
> Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Untuk mengerjakan load balancing kita memerlukan beberapa configurasi pada `Arjuna`.

Pertama-tama, pastika telah mengkonfigurasi Arjuna dengan benar, termasuk konfigurasi Nginx dan aturan load balancing. Dapat menentukan algoritma load balancing yang sesuai untuk kebutuhan Anda, seperti round-robin atau algoritma lainnya.

Selanjutnya, perlu melakukan deployment pada masing-masing worker. Ini melibatkan mengunggah aplikasi atau layanan web yang ingin di load balance ke setiap worker. Pastikan bahwa semua worker telah diatur dengan benar dan siap melayani lalu lintas web.

Saat semua konfigurasi dan deployment selesai, Arjuna akan bertindak sebagai load balancer yang akan mendistribusikan lalu lintas web ke worker yang tersedia

### Script
**Arjuna (Load Balancing)**

Disini kita perlu untuk membuat load balancing nya sebagai berikut 
```
echo 'upstream backend {
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
```

jangan lupa untuk melakukan `symlink` dengan menjalankan perintah berikut

```
ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom
```

agar port tidak bertabrakan dengan `default` yang ada saat kita melakukan installasi pada `nginx`, maka kita harus menghapus file `default` tersebut

```
rm /etc/nginx/sites-enabled/default
```

lalu restart 
```
service nginx restart
```

**PrabuKusuma, Abimanyu,, Wisanggeni**

Jalankan perintah `shell` berikut pada masing-masing `worker`
```
service php7.0-fpm start

echo 'server {
        listen 80;

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
```

**Client (Sadewa / Nakula)**
```
Lakukan test berikut 

lynx http://192.173.3.2
lynx http://192.173.3.3
lynx http://192.173.3.4
lynx http://192.173.3.5
lynx http://arjuna.a09.com
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/76526eb9-6894-4c51-b30c-10cd8b371244)

**Load Balancing**

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/ab7ed8ca-f67a-413d-8c77-fc46702e984c)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/0d0f9531-b3ea-41c5-801c-4df9cdf4730f)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/4e94ebbb-7b5a-4d34-a42a-d09268d29938)

## Soal 10
> Kemudian gunakan algoritma Round Robin untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003. Contoh (Prabakusuma:8001, Abimanyu:8002, Wisanggeni:8003)

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Karena telah berhasil melakukan deployment pada [nomor 9](#soal-9). Hanya perlu mengubah masing-masing port pada worker menuju port yang telah ditentukan yaitu `Prabakusuma:8001, Abimanyu:8002, Wisanggeni:8003`. Kita juga perlu mengubah port `load-balancing` dengan menambahkan `:800X` pada masing-masing server

### Script

**Arjuna (Load Balancing)**
```
upstream backend {
  server 192.173.3.2:8001; # IP PrabuKusuma
  server 192.173.3.3:8002; # IP Abimanyu
  server 192.173.3.4:8003; # IP Wisanggeni
}
```

**PrabuKusuma, Abimanyu, Wisanggeni**

X adalah port yang telah ditentukan sesuai `worker` masing-masing
```
echo 'server {
        listen 800X;

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
```
### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/76526eb9-6894-4c51-b30c-10cd8b371244)

**Load Balancing**

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/ab7ed8ca-f67a-413d-8c77-fc46702e984c)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/0d0f9531-b3ea-41c5-801c-4df9cdf4730f)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/4e94ebbb-7b5a-4d34-a42a-d09268d29938)

## Soal 11
> Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server www.abimanyu.yyy.com. Pertama dibutuhkan web server dengan DocumentRoot pada /var/www/abimanyu.yyy

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Untuk mengerjakan soal ini, diperlukan beberapa konfigurasi. Salah satunya adalah `Yudhistira` dimana kita akan mengubah IP yang awalnya ke `Werkudara` menuju `Abimanyu`. Lalu diperlukan juga untuk menggunakan `ServerAlias` agar bisa menggunakan `www` nantinya.

### Script
**Yudhistira**
```
# 11
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.a09.com. root.abimanyu.a09.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.a09.com.
@       IN      A       192.173.3.3     ; IP Abimanyu
www     IN      CNAME   abimanyu.a09.com.
parikesit IN    A       192.173.3.3     ; IP Abimanyu
ns1     IN      A       192.173.2.2     ; IP Werkudara
baratayuda IN   NS      ns1' > /etc/bind/jarkom/abimanyu.a09.com

service bind9 restart
```

**Abimanyu**
```
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
```

**Client (Sadewa)**
```
lynx abimanyu.a09.com
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/cb0cd154-9d9f-4071-ae06-ec0ae3c8d216)

## Soal 12
> Setelah itu ubahlah agar url www.abimanyu.yyy.com/index.php/home menjadi www.abimanyu.yyy.com/home.

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Disini kita menggunakana bantuan  `Directory` yang melakukan rewrite Indexes. Agar dapat melakukan `Alias`
```
<Directory /var/www/abimanyu.a09/index.php/home>
  Options +Indexes
</Directory>

Alias "/home" "/var/www/abimanyu.a09/index.php/home"
```

### Script
**Abimanyu**
```
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
```

**Client (Sadewa)**
```
lynx abimanyu.a09.com/home
curl abimanyu.a09.com/home
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/1fca6d10-4193-4438-b93c-8e9a0f1878ed)

## Soal 13
> Selain itu, pada subdomain www.parikesit.abimanyu.yyy.com, DocumentRoot disimpan pada /var/www/parikesit.abimanyu.yyy

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Disini kita hanya memerlukan setup `ServerName` dan `ServerAlias`.

### Script
**Abimanyu**
```
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
```

**Client (Sadewa)**
```
lynx parikesit.abimanyu.a09.com
curl parikesit.abimanyu.a09.com
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/4a0b632a-e282-47f3-995d-72757cae901a)

## Soal 14
> Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden)

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Karena kita mau mengizinkan `public` agar dapat melakukan directory `listing` kita menggunakan `Options +Indexes`. Sedangkan agar suatu folder tidak dapat di akses, kita dapat menggunakan `Option -Indexes`.

### Script
**Abimanyu**
```
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
```

**Client (Sadewa)**
```
lynx parikesit.abimanyu.a09.com/public
lynx parikesit.abimanyu.a09.com/secret
```

### Result

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/4687fa2f-3e95-4eaa-8e52-5d0f19c01497)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/85e3f2b6-122a-4a93-a9ef-6feaf13e6184)

## Soal 15
> Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Untuk page html `error`. Kita mendapatkan dari file resources yang telah diberikan, untuk detailnya ada pada folder ``parikesit.abimanyu.a09.com/public/error/``. Disana terdapat 2 file yaitu `403.html` dan `404.html`. Kita juga menggunakan `ErrorDocument` yang berfungsi melakukan `redirect` terhadap file yang diinginkan ketika mendapatkan masalah ketika mengakses domain yang telah ada sebelumnya.

### Script
**Abimanyu**
```
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
```

**Client (Sadewa)**
```
lynx parikesit.abimanyu.a09.com/testerror
lynx parikesit.abimanyu.a09.com/secret
```

### Result
**Error**
![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/41e18fc3-6765-443e-bb68-a5cb09de5464)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/e016b5cf-ba80-4e3b-a0cf-fef133fdb158)

**Forbidden**
![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/7d4ae299-3296-4f5c-85de-10a70b502368)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/c56aa0f1-ee2b-435a-a1ce-4e59e588967a)

## Soal 16
> Buatlah suatu konfigurasi virtual host agar file asset www.parikesit.abimanyu.yyy.com/public/js menjadi www.parikesit.abimanyu.yyy.com/js 

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Disini kita hanya perlu menggunakan ``Alias "/js" "/var/www/parikesit.abimanyu.a09/public/js"`` untuk mengubah  virtual host agar file tersebut menjadi lebih singkat. Disini kami juga menggunakan `ServerName` dan `ServerAlias` agar virtual host dapat berjalan.

### Script
**Abimanyu**
```
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
```

**Client (Sadewa)**
```
lynx parikesit.abimanyu.a09.com/js
```

### Result

## Soal 17
> Agar aman, buatlah konfigurasi agar www.rjp.baratayuda.abimanyu.yyy.com hanya dapat diakses melalui port 14000 dan 14400.

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Untuk  melakukan kustomisasi pada port tertentu. Kita hanya perlu mengubah file `ports.conf` dengan menambahkan `Listen 14000` dan `Listen 14400`. Kita juga perlu mengubah `<VirtualHost *:14000 *:14400>`

### Script
**Abimanyu**
```
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
```

**Client (Sadewa)**
```
lynx rjp.baratayuda.abimanyu.a09.com:14000
lynx rjp.baratayuda.abimanyu.a09.com:14400
```

### Result
**Port 14000 atau 14400**
![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/1f6b4789-136a-415c-97a5-ef18936816d0)

**Port yang tidak sesuai**
![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/46bc610e-13c7-4b4c-8619-39824ebd418d)

## Soal 18
> Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada /var/www/rjp.baratayuda.abimanyu.yyy.

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Untuk melakukan autentikasi pada sebuah server, diperlukan `AuthType` dan `Require Valid-User`. Lalu untuk AuthUserFile sendiri adalah tempat yang ingin kita gunakan untuk melakukan `write`. Sedangkan untuk `AuthName` adalah content-type Autentikasi pada apache2

### Script
**Abimanyu**
```
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

a2ensite rjp.baratayuda.abimanyu.a09.com.conf

service apache2 restart
```

Tambahkan autentikasi dengan menggunakan command `htpasswd`. Lalu untuk `-c` itu adalah `created` dan `-b` yang merupakan `bcrypt` agar password yang kita isi akan dilakukan hash terlebih dahulu sebelum disimpan.
```
htpasswd -c -b /etc/apache2/.htpasswd Wayang baratayudaa09
```

**Client (Sadewa)**
```
lynx rjp.baratayuda.abimanyu.a09.com:14000
lynx rjp.baratayuda.abimanyu.a09.com:14400
```

### Result
![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/4db4dcfb-1eff-4134-963f-5a64bda82dd0)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/2d139682-7e15-4321-8301-b74b176e456c)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/d25c9b62-d457-45ff-be2c-4dd219696c51)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/c09c9346-4a0b-45ce-8711-eb1f1a2f2145)

## Soal 19
> Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke www.abimanyu.yyy.com (alias)

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Agar ketika kita mengakses IP dari abimanyu dapat otomatis dialihkan ke www.abimanyu.a09.com. Kita perlu menggunakan file `Redirect` yang akan mengarahkan kepada file yang kita inginkan. Disini saya memasukkan ke dalam file konfigurasi `000-default.conf` karena merupakan default dari suatu service apache.

### Script
**Abimanyu**
```
echo -e '<VirtualHost *:80>
    ServerAdmin webmaster@abimanyu.a09.com
    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    Redirect / http://www.abimanyu.a09.com/
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf
```

Config test
```
apache2ctl configtest
service apache2 restart
```

**Client (Sadewa)**
```
lynx 192.173.3.3
```

### Result
![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/1784823c-813a-4c6f-af3d-a4589a87725f)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/cf047ea3-b08e-4a04-8b61-c25fd6b6df75)

## Soal 20
> Karena website www.parikesit.abimanyu.yyy.com semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu.

### Script
**Abimanyu**
Jangan lupa untuk menjalankan perintah berikut agar dapat melakukan `rewrite modul`
```
a2enmod rewrite
```

Lalu jalankan perintah tersebut untuk melakukan `rewrite` terhdap directory ``parikesit.abimanyu.a09``
```
echo 'RewriteEngine On
RewriteCond %{REQUEST_URI} ^/public/images/(.*)abimanyu(.*)
RewriteCond %{REQUEST_URI} !/public/images/abimanyu.png
RewriteRule abimanyu http://parikesit.abimanyu.a09.com/public/images/abimanyu.png$1 [L,R=301]' > /var/www/parikesit.abimanyu.a09/.htaccess
```

Ubah konfigurasi dan gunakan `AllowOverride All` untuk mengkonfigurasi nya dengan `.htaccess` sebelumnya.
```
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

service apache2 restart
```

**Client (Sadewa)**
```
lynx parikesit.abimanyu.a09.com/public/images/not-abimanyu.png
lynx parikesit.abimanyu.a09.com/public/images/abimanyu-student.jpg
lynx parikesit.abimanyu.a09.com/public/images/abimanyu.png
lynx parikesit.abimanyu.a09.com/public/images/notabimanyujustmuseum.177013
```
### Result
![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/35b9776e-ee1d-4197-b246-a617a0ec27c2)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/aad3289b-d287-4e02-a31d-6891049b4b13)

![image](https://github.com/Caknoooo/simple-django-restful-api/assets/92671053/2ebf7a72-b68c-453d-b56f-1c22f5b1ddc9)
