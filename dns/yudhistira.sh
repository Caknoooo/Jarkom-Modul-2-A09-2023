echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install bind9 -y

# 2
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

# Test 
# ping arjuna.a09.com -c 5
# ping www.arjuna.a09.com -c 5

# 3
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

# Test
# ping abimanyu.a09.com -c 5
# ping www.abimanyu.a09.com -c 5

# 4
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

# Test
# ping parikesit.abimanyu.a09.com -c 5

# 5
echo 'zone "arjuna.a09.com" {
        type master;
        file "/etc/bind/jarkom/arjuna.a09.com";
        allow-transfer { 192.173.3.5; }; // IP Arjuna
};

zone "abimanyu.a09.com" {
        type master;
        file "/etc/bind/jarkom/abimanyu.a09.com";
        allow-transfer { 192.173.3.3; }; // IP Arjuna
};

zone "3.173.192.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/3.173.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/3.173.192.in-addr.arpa

echo ';
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

# Test
# host -t PTR 192.173.3.3

# 6
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

service bind9 restart

service bind9 stop

# 7
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