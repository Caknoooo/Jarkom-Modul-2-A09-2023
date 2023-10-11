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