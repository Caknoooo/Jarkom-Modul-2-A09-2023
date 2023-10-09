# Jarkom-Modul-2-A09-2023
**Praktikum Jaringan Komputer Modul 2 Tahun 2023**

## Author
| Nama | NRP |Github |
|---------------------------|------------|--------|
|Andika Laksana Putra | 5025211001 | https://github.com/DikaPutra07 |
|M. Naufal Badruttamam | 5025211240 | https://github.com/Caknoooo |

### List Soal
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
www     IN      CNAME   arjuna.a09.com' > /etc/bind/jarkom/arjuna.a09.com

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
www     IN      CNAME   abimanyu.a09.com' > /etc/bind/jarkom/abimanyu.a09.com

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

### Soal 5
> Buat juga reverse domain untuk domain utama.

### Soal 6
> Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.

### Soal 7
> Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu baratayuda.abimanyu.yyy.com dengan alias www.baratayuda.abimanyu.yyy.com yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda

### Soal 8
> Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu.

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
