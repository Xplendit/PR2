#Documentatie Java EE stack


## Inleiding ##
Java Enterprise Edition ( Java EE ) is een verzameling van Java - gebaseerde technologieën en hoe ze samenwerken. Java EE specificeert server en client -architecturen en maakt gebruik van profielen om technologie sets  te definiëren die gericht zijn op specifieke klassen van applicaties. Tal van implementaties zijn beschikbaar in de vorm van zowel commerciële producten en open source projecten. Het is ook mogelijk om volledige of gedeeltelijke implementaties te gebruiken.

## Installeren van Java EE stack ##
Voor het installeren van de Java EE stack gaan we gebruik maken van Vagrant. We gebruiken Vagrant om op een eenvoudige manier een virtuele machine op te zetten in Virtualbox.

Eerst moeten we Vagrant gaan downloaden via de link:[http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html "Vagrant downloaden") en selecteert u het besturingssysteem dat voor u geschikt is. Wanneer de installatie voltooid is heb je de mogelijkheid om via gitbash de commando's van Vagrant op te roepen. 

De volgende stap is het aanmaken van je virtuele machine. Je opent git bash en met het commando *mkdir* kan je een nieuwe map aanmaken waarin je u virtuele machine kan opslaan. Via het commando *cd* kan je navigeren naar de map waarin je u virtuele machine wil opslaan.

Het activeren en toevoegen van onze virtuele machine gaat als volgt te werk. Zorg er eerst voor dat je in de juiste map zit en typ daarna *vagrant init chef/centos-7.0* in, dit commando maakt de vagrantfile aan. Daarna typ je het commando *vagrant box add chef/centos-7.0 chef/centos-7.0 --provider virtualbox* in. 

**Aanpassen van de vagrantfile.**

Navigeer naar de map die zojuist hebt aangemaakt met de *mkdir* command. Hier zal je een bestand vinden, *vagrantfile* genaamd. Open dit met een tekstbewerker. Vervang de inhoud met het volgende:

	Vagrant.configure(2) do |config|
  		config.vm.box = "chef/centos-7.0"
  		config.vm.hostname = "JavaEEStack"
  		config.vm.provision :shell, path: "bootstrap.sh"
  		config.vm.network :private_network,
			ip: "192.168.50.4",
			netmask: "255.255.255.0"
  		end

**Aanmaken provision.sh script**

Het aanmaken van het provision.sh script moet in dezelfde map gebeuren waar de vagrantfile opgeslagen is. Gebruik het commando *vi provision.sh* om het script aan te maken. Ga daarna in de insert modus en plak onderstaande code in het script. Sla daarna het script op.
    
    #!/bin/bash
    # provision.sh -- install Tomcat 7 en Java 1.7
    
    
	sudo yum -y update
	sudo yum -y install java-1.7.0-openjdk* tomcat*
	sudo systemctl start tomcat
	sudo systemctl start firewalld
	sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
	sudo firewall-cmd --reload
	sudo systemctl restart firewalld
	sudo systemctl enable firewalld
	cd ../../usr/share/tomcat/conf
	sudo chmod 777 tomcat-users.xml
	> tomcat-users.xml
	echo "<?xml version='1.0' encoding='utf-8'?>" > tomcat-users.xml
	echo '<tomcat-users>
	<role rolename="manager-gui" />
	<role rolename="manager-status" />
	<role rolename="manager-script" />
	<role rolename="manager-jmx" />

	<role rolename="admin-gui" />
	<role rolename="admin-script" />

	<user username="admin" password="admin" roles="manager-gui, admin-gui"/>
	<user username="user" password="user" roles="manager-gui"/>
	</tomcat-users>' >> tomcat-users.xml


Dit script zorgt ervoor dat alles automatisch geïnstalleerd wordt op je virtuele machine.
Natuurlijk kies je zelf welk wachtwoord je wilt voor de admin en de gewone gebruiker.

**Opstarten van virtuele machine**

Nadat we alle stappen hiervoor hebben uitgevoerd is het tijd om onze virtuele machine op te starten. Dit doen we via het command *vagrant up*. Het opstarten van de virtuele machine kan enkele minuten tijd in beslag nemen. Je gaat niet echt uitvoer zien, omdat vagrant werkt zonder GUI. Om volledige toegang te krijgen tot je virtuele machine gebruik je het commando *vagrant ssh* zo kan je via de command line aanpassingen doen aan je machine.

**Gebruik van bestaand vagrantfile**

Als je al een bestaand vagrantfile en script gebruikt. Gebruik je de volgende command: *vagrant up*.

**Beveiliging**

De server is beveiligd met een firewall. We hebben ook ervoor gezorgd dat je als admin en gewone gebruiker op de appmanager kan.

**Interessante links**

Beveiliging centOS7: https://www.digitalocean.com/community/questions/hardening-centos-7-firewalld-selinux

Cloudplatform: http://stackoverflow.com/questions/8823969/javaee-technology-stack-on-windows-azure
















