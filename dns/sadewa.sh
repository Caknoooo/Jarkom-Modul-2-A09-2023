echo -e '
nameserver 192.173.1.2 # IP Yudhistira
nameserver 192.173.2.2 # IP Werkudara
nameserver 192.168.122.1
' > /etc/resolv.conf
apt-get update
apt-get install dnsutils -y
apt-get install lynx -y