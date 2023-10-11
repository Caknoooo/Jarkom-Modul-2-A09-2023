# 9 dan 10
echo ';
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
@       IN      A       192.173.3.5     ; IP Arjuna
www     IN      CNAME   arjuna.a09.com.' > /etc/bind/jarkom/arjuna.a09.com

service bind9 restart