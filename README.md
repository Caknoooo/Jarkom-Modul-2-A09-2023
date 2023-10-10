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
- [Soal 2](#Soal-2)
- [Soal 3](#Soal-3)
- [Soal 4](#Soal-4)
- [Soal 5](#Soal-5)
- [Soal 6](#Soal-6)
- [Soal 7](#Soal-7)
- [Soal 8](#Soal-8)
- [Soal 9](#Soal-9)
- [Soal 10](#Soal-10)
- [Soal 11](#Soal-11)
- [Soal 12](#Soal-12)
- [Soal 13](#Soal-13)
- [Soal 14](#Soal-14)
- [Soal 15](#Soal-15)
- [Soal 16](#Soal-16)
- [Soal 17](#Soal-17)
- [Soal 18](#Soal-18)
- [Soal 19](#Soal-19)
- [Soal 20](#Soal-20)

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
  apt-get update
  apt-get install nano -y
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.173.0.0/16
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
  nameserver 192.168.122.1
  ' > /etc/resolv.conf
  apt-get update
  apt-get install dnsutils
  apt-get install lynx
  ```

### Soal 1 
> Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Buatlah topologi dengan pembagian sebagai berikut. Folder topologi dapat diakses pada drive berikut

### Soal 2 
> Buatlah website utama dengan akses ke arjuna.yyy.com dengan alias www.arjuna.yyy.com dengan yyy merupakan kode kelompok.
Config

**Yudhistira**
```
nano .bashrc

-> 
nameserver 192.168.122.1
apt-get update
apt-get install bind9 -y
```

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
```
echo 'nameserver 192.173.1.2' > /etc/resolv.conf
ping arjuna.a09.com -c 5
```

**Result**

![image](https://github.com/Caknoooo/Jarkom-Modul-2-A09-2023/assets/92671053/da1a8f5f-6c35-45a7-b10d-b084d5fb23b8)

### Soal 3
> Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.

**Yudhistira**
```
nano .bashrc (kalau belum setup)

-> 
nameserver 192.168.122.1
apt-get update
apt-get install bind9 -y
```

```
echo 'zone "abimanyu.a09.com" {
        type master;
        file "/etc/bind/jarkom/abimanyu.a09.com";
        allow-transfer { 192.173.3.3; }; // IP Arjuna
};' > /etc/bind9/named.conf.local

mkdir /etc/bind/jarkom

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
```
echo 'nameserver 192.173.1.2' > /etc/resolv.conf
ping abimanyu.a09.com -c 5
```

**Result**

![image](https://github.com/Caknoooo/Jarkom-Modul-2-A09-2023/assets/92671053/651c1699-2cdf-490a-88ec-f483cba17d11)


### Soal 4
> Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain parikesit.abimanyu.yyy.com yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.

**Yudhistira**
```
echo 'parikesit IN    A       192.173.3.3     ; IP Abimanyu' > /etc/bind/jarkom/abimanyu.a09.com

service bind9 restart

nano /etc/bind/jarkom/abimanyu.a09.com
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
parikesit IN    A       192.173.3.3     ; IP Abimanyu
```

**Abimanyu**
```
ping parikesit.abimanyu.a09.com -c 3
```

**Result**

![image](https://github.com/Caknoooo/Jarkom-Modul-2-A09-2023/assets/92671053/3aea4e68-6e53-4aff-ad27-d7d4dbcebc77)


### Soal 5
> Buat juga reverse domain untuk domain utama.

Karena IP ``Yudhistira`` adalah ``192.173.1.2`` maka akan menggunakan reverse sebagai berikut
```
nano /etc/bind/named.conf.local

zone "1.173.192.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/1.173.192.in-addr.arpa";
};

cp /etc/bind/db.local /etc/bind/jarkom/1.173.192.in-addr.arpa

nano /etc/bind/jarkom/1.173.192.in-addr.arpa

;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     arjuna.a09.com. root.arjuna.a09.com. (
                        2003101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
1.173.192.in-addr.arpa. IN      NS      arjuna.a09.com.
2                       IN      PTR     arjuna.a09.com.

service bind9 restart
```

**Arjuna**
```
- Ubah nameserver menuju 192.168.122.1 agar mendapatkan akses internet 
- apt-get update
- apt-get install dnsutils
- ubah kembali nameserver menuju IP Yudhistira
- host -t PTR 192.173.1.2
```

**Result**

![image](https://github.com/Caknoooo/Jarkom-Modul-2-A09-2023/assets/92671053/8fd99b37-4f44-4a28-b830-211389ce5de7)


### Soal 6
> Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.

**Yudhistira**
```
nano /etc/bind/named.conf.local

zone "arjuna.a09.com" {
        type master;
        notify yes;
        also-notify { 192.173.2.2; }; // IP Werkudara
        file "/etc/bind/jarkom/arjuna.a09.com";
        allow-transfer { 192.173.2.2; }; // IP Werkudara
};

service bind9 restart
```

**Werkudara**
```
- Ubah nameserver menuju 192.168.122.1 agar mendapatkan akses internet 
- apt-get update
- apt-get install bind9 -y
- nano /etc/bind/named.conf.local
zone "arjuna.a09.com" {
    type slave;
    masters { 192.173.1.2; }; // Masukan IP Yudhistira
    file "/var/lib/bind/arjuna.a09.com";
};

- service bind9 restart
```

**Yudhistira**
```
service bind9 stop
```

**Arjuna**
```
ping arjuna.a09.com -c 5
```

**Result**

![image](https://github.com/Caknoooo/Jarkom-Modul-2-A09-2023/assets/92671053/1e0c0966-5d7b-4bbe-8e68-3673028de4b9)


### Soal 7
> Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu baratayuda.abimanyu.yyy.com dengan alias www.baratayuda.abimanyu.yyy.com yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda

**Yudhistira**
```
nano /etc/bind/named.conf.local

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
parikesit IN    A       192.173.3.3     ; IP Abimanyu
ns1     IN      A       192.173.2.2     ; IP Werkudara
baratayuda IN   NS      ns1

nano /etc/bind/named.conf.options
tambahkan allow-query{any;}; dan comment dnssec

service bind9 restart
```

**Werkudara**
```
nano /etc/bind/named.conf.local

zone "baratayuda.abimanyu.a09.com" {
        type master;
        file "/etc/bind/baratayuda/baratayuda.abimanyu.a09.com";
};

mkdir /etc/bind/baratayuda

cp /etc/bind/db.local /etc/bind/baratayuda.abimanyu.a09.com

nano baratayuda.abimanyu.a09.com
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
www     IN      CNAME   baratayuda.abimanyu.a09.com.

nano /etc/bind/named.conf.options
tambahkan allow-query{any;}; dan comment dnssec

service bind9 restart
```

**Abimanyu**
```
ping baratayuda.abimanyu.a09.com -c 5
ping www.baratayuda.abimanyu.a09.com -c 5
```

**Result**

![image](https://github.com/Caknoooo/Jarkom-Modul-2-A09-2023/assets/92671053/72a39d43-aeda-4bf2-9585-6bb72bb5450a)

![image](https://github.com/Caknoooo/Jarkom-Modul-2-A09-2023/assets/92671053/476c6b98-fd90-4f4f-af0f-d8aa682be401)

### Soal 8
> Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu.

**Werkudara** 
```
nano /etc/bind/baratayuda/baratayuda.abimanyu.a09.com

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
@               IN      NS      baratayuda.abimanyu.a09.com.
@               IN      A       192.173.3.3     ; IP Abimanyu
www             IN      CNAME   baratayuda.abimanyu.a09.com.
rjp             IN      A       192.173.3.3     ; IP Abimanyu
www.rjp         IN      CNAME   rjp.baratayuda.abimanyu.a09.com.

service bind9 restart
```

**Abimanyu**
```
ping www.rjp.baratayuda.abimanyu.a09.com -c 5
ping rjp.baratayuda.abimanyu.a09.com -c 5
```

**Result**

![image](https://github.com/Caknoooo/Jarkom-Modul-2-A09-2023/assets/92671053/e46fc859-83a9-40a8-a72c-4e3857be5bfd)


### Soal 9
> Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker

### Soal 10
> Kemudian gunakan algoritma Round Robin untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003. Contoh (Prabakusuma:8001, Abimanyu:8002, Wisanggeni:8003)

### Soal 11
> Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server www.abimanyu.yyy.com. Pertama dibutuhkan web server dengan DocumentRoot pada /var/www/abimanyu.yyy

### Soal 12
> Setelah itu ubahlah agar url www.abimanyu.yyy.com/index.php/home menjadi www.abimanyu.yyy.com/home.

### Soal 13
> Selain itu, pada subdomain www.parikesit.abimanyu.yyy.com, DocumentRoot disimpan pada /var/www/parikesit.abimanyu.yyy

### Soal 14
> Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden)

### Soal 15
> Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.

### Soal 16
> Buatlah suatu konfigurasi virtual host agar file asset www.parikesit.abimanyu.yyy.com/public/js menjadi www.parikesit.abimanyu.yyy.com/js 

### Soal 17
> Agar aman, buatlah konfigurasi agar www.rjp.baratayuda.abimanyu.yyy.com hanya dapat diakses melalui port 14000 dan 14400.

### Soal 18
> Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada /var/www/rjp.baratayuda.abimanyu.yyy.

### Soal 19
> Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke www.abimanyu.yyy.com (alias)

### Soal 20
> Karena website www.parikesit.abimanyu.yyy.com semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.
