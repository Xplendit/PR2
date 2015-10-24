#Documentatie DHCP server  

## Inleiding ##
Dynamic Host Configuration Protocol (DHCP) is een netwerk protocol dat automatisch TCP/IP informatie aan verchillende clienten toewijst. Iedere DHCP client verbind met de centraal geplaatste DHCP server, deze zendt dan de client zijn netwerk configuratie terug (zoals het IP adres, gateway en DNS servers).  
 
DHCP wordt vooral gebruikt voor het automatisch configureren van de netwerk interfaces van clienten. Hierdoor moeten zij niet zelf een specifieke configuratie ingeven en is het makkelijker voor de administrator om aanpassingen te maken.

## Installeren van CentOS met DHCP server ##
Voor het installeren van DHCP server gaan we gebruik maken van Vagrant. We gebruiken Vagrant om op een eenvoudige manier een virtuele machine op te zetten in Virtualbox.

Eerst moeten we Vagrant gaan downloaden via de link:[http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html "Vagrant downloaden") en selecteert u het besturingssysteem die voor u geschikt is. Wanneer de installatie voltooid is heb je nu de mogelijkheid om via git bash de commando's van Vagrant op te roepen. 

De volgende stap is het aanmaken van je virtuele machine. Je opent git bash en met het commando *mkdir* kan je een nieuwe map aanmaken waarin je u virtuele machine kan opslaan. Via het commando *cd* kan je navigeren naar de map waarin je u virtuele machine wil opslaan.

Het activeren en toevoegen van Vagrant gaat als volgt te werk. Zorg er eerst voor dat je in de juiste map zit en typ daarna *vagrant init chef/centos-7.0* in, dit commando maakt de vagrantfile aan. Daarna typ je het commando *vagrant box add chef/centos-7.0 chef/centos-7.0* in. Er wordt ons dan gevraagd met welke tool we onze virtuele machine willen runnen, wij kiezen voor optie 1 namelijk Virtualbox. Nu wordt de machine gedownload en geïnstalleerd, deze stap kan enkele minuten in beslag nemen. 

**Aanpassen van de vagrantfile**

Om de vagrantfile aan te passen gaan we gebruik maken van het commando *vi Vagrantfile*. Het is de bedoeling dat we een aantal zaken in dit bestand gaan bewerken. Door éénmalig op de 'i' toets te klikken kan je links onderaan het venster zien dat we in de insert modus zitten. We gaan een paar aanpassingen doen in de vagrantfile. Om zaken uit commentaar te halen moet je het #-teken verwijderen. Als je de aangepaste Vagrantfile wil bekijken klik dan [hier](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht05/DHCP/Vagrantfile). Als je de Vagrantfile manueel wilt aanpassen volg de stappen die hieronder vermeld staan.

**Uit commentaar halen**

`#`config.vm.network "forwarded_port", guest: 80, host: 8080 : Hierbij krijgt de gast toegang tot poort 80 via poort 8080 van de host.

`#` config.vm.network "public_network", ip:"192.168.1.5"    
Zorg dat het ip adress zeker 192.168.1.5 is.

**Toevoegen aan vagrantfile**

Het deel *config.vm.provision :shell, path: "dhcp.sh"* dat we gaan toevoegen aan de vagrantfile komt net onder *Vagrant.configure(2) do |config|*. Wanneer we dit gedaan hebben duwen we op *esc* en op deze manier gaan we uit de insert modus van vi. Nu moeten we alleen nog onze vagrantfile opslaan, dit doen we door *:wq* in te typen en op enter te duwen.

**Aanmaken provision.sh script**

Het aanmaken van het dhcp.sh script moet in dezelfde map gebeuren waar de vagrantfile opgeslagen is. Gebruik het commando *vi dhcp.sh* om het script aan te maken. Ga daarna in de insert modus en plak onderstaande code in het script. Sla daarna het script op.

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

Dit script zorgt ervoor dat alles automatisch geïnstalleerd wordt op je virtuele machine.

**Opstarten van virtuele machine**

Nadat we alle stappen hiervoor hebben uitgevoerd is het tijd om onze virtuele machine op te starten. Dit doen we via het command *vagrant up*. Het opstarten van de virtuele machine kan enkele minuten tijd in beslag nemen. Je gaat niet echt uitvoer zien, omdat vagrant werkt zonder GUI. Om volledige toegang te krijgen tot je virtuele machine gebruik je het commando *vagrant ssh* zo kan je via de command line aanpassingen doen aan je machine.

**DHCP server manueel installeren en configureren**

Na het opstarten van de virtuele machine verander je je naar de root gebruiker.     
	`$su -`      
	`password: vagrant`  
(of je plaats voor ieder command 'sudo').  
Eerst installeren we de DHCP service.
	`$yum -y install dhcp`   
Vooraleer de service zal werken moet je een configuratie file opstellen en hierin de juiste configuratie schrijven.  
	`$vi /etc/dhcp/dhcpd.conf`  
![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht05/img/DHCPD.conf.png)  

Hierna start je de service.  
`$systemctl start dhcpd`   
`$systemctl enable dhcpd`   

**Troubleshooting**   

Controleer eerst en vooral de status van de service dmv.    
`$systemctl status dhcpd`  

Als er hier problemen zijn is het best om de log te bekijken via.  
`$less /var/log/messages`
(klik hier op END om de laatste berichten te bekijken en op Q om te sluiten.)

Meestal is er een fout in het configuratiebestand, na iedere aanpassing van dit bestand zul je ook de service moeten herstarten.    
`$systemctl restart dhcpd`  

Ook belangrijk is dat het IP adres van u eigen virtuele machine deel uitmaakt van de range van de DHCP server. Als je de documentatie goed gevolgd hebt moet dit normaal in orde zijn. Het IP adres kun je makkelijker controleren door: `$ifconfig`

Soms kan het ook nuttig zijn om het lease bestand te bekijken. Dit doe je via `$vi /var/lib/dhcpd/dhcpd.leases`  

**Nuttige links**    

- Algemene info:  
https://www.centos.org/docs/5/html/Deployment_Guide-en-US/s1-dhcp-configuring-server.html  
http://www.brennan.id.au/10-DHCP_Server.html

- Snel voorbeeld:
http://www.server-world.info/en/note?os=CentOS_7&p=dhcp

- Stappenplan:
http://www.yoyoclouds.com/2015/01/quick-start-setup-centos-7-as-dhcp.html



