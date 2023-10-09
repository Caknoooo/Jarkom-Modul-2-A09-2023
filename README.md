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
@       IN      SOA     arjuna.a09.com. arjuna.a09.com. (
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
