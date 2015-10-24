#!/bin/bash
# dhcp.sh -- install and configure dhcp
# 

yum -y install dhcp

cat > /etc/dhcp/dhcpd.conf  <<- _EOF_

	#
	# DHCP Server Configuration file.
	#	see /usr/share/doc/dhcp*/dhcpd.conf.example
	#	see dhcpd.conf(5) man page
	#

	# specify domain name
	option domain-name "wop.local";
	# specify name server's hostname or IP address
	option domain-name-servers 192.168.1.2;

	# default lease time
	default-lease-time 86400;     # 24 hours
	# max lease time
	max-lease-time 172800;        # 48 hours

	# this DHCP server to be declared valid
	authorative;

	#specify network address and subnet mask
	subnet 192.168.1.0 netmask 255.255.255.0{

        #specify the range of lease IP address
        range dynamic-bootp 192.168.1.30 192.168.1.254;
        #specify broadcast address
        option broadcast-address 192.168.1.255;
        #specify default gateway
        option routers 192.168.1.1;
	}

	# specify static IP address DNS server
	host DNS {
		# hardware ethernet 08:00:27:10:0c:D0;
		fixed-address 192.168.1.2;
	}
_EOF_

systemctl start dhcpd
systemctl enable dhcpd