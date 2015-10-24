#Documentatie LAMP stack


## Inleiding ##
Een LAMP stack is een groep van open source software die meestal op een server wordt geïnstalleerd om dynamische websites en web applicaties te hosten. De afkorting LAMP staat voor **L**inux besturingsysteem, de **A**pache webserver. De inhoud van de website wordt opgeslaan in een **M**ysql database hiervoor gebruiken we MariaDB en de dynamische inhoud wordt verwerkt door **P**HP.

## Installeren van LAMP stack ##
Voor het installeren van LAMP stack gaan we gebruik maken van Vagrant. We gebruiken Vagrant om op een eenvoudige manier een virtuele machine op te zetten in Virtualbox.

Eerst moeten we Vagrant gaan downloaden via de link:[http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html "Vagrant downloaden") en selecteert u het besturingssysteem die voor u geschikt is. Wanneer de installatie voltooid is heb je nu de mogelijkheid om via git bash de commando's van Vagrant op te roepen. 

De volgende stap is het aanmaken van je virtuele machine. Je opent git bash en met het commando *mkdir* kan je een nieuwe map aanmaken waarin je u virtuele machine kan opslaan. Via het commando *cd* kan je navigeren naar de map waarin je u virtuele machine wil opslaan.

Het activeren en toevoegen van Vagrant gaat als volgt te werk. Zorg er eerst voor dat je in de juiste map zit en typ daarna *vagrant init chef/centos-7.0* in, dit commando maakt de vagrantfile aan. Daarna typ je het commando *vagrant box add chef/centos-7.0 chef/centos-7.0* in. Er wordt ons dan gevraagd met welke tool we onze virtuele machine willen runnen, wij kiezen voor optie 1 namelijk Virtualbox. Nu wordt de machine gedownload en geïnstalleerd, deze stap kan enkele minuten in beslag nemen. 

**Aanpassen van de vagrantfile**

Om de vagrantfile aan te passen gaan we gebruik maken van het commando *vi Vagrantfile*. Het is de bedoeling dat we een aantal zaken in dit bestand gaan bewerken. Door éénmalig op de 'i' toets te klikken kan je links onderaan het venster zien dat we in de insert modus zitten. We gaan een paar aanpassingen doen in de vagrantfile. Om zaken uit commentaar te halen moet je het #-teken verwijderen. Als je de aangepaste Vagrantfile wil bekijken klik dan [hier](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/LAMP_Stack/Vagrantfile). Als je de Vagrantfile manueel wilt aanpassen volg de stappen die hieronder vermeld staan.

**Uit commentaar halen**

`#`config.vm.network "forwarded_port", guest: 80, host: 8080 : Hierbij krijgt de gast toegang tot poort 80 via poort 8080 van de host.

`#` config.vm.network "private_network", ip:"192.168.33.10" : Het ip adres kan verschillend zijn met wat hier gebruikt wordt.

**Toevoegen aan vagrantfile**

Het deel *config.vm.provision "shell", path: "provision.sh"* dat we gaan toevoegen aan de vagrantfile komt net onder *Vagrant.configure(2) do |config|*. Wanneer we dit gedaan hebben duwen we op *esc* en op deze manier gaan we uit de insert modus van vi. Nu moeten we alleen nog onze vagrantfile opslaan, dit doen we door *:wq* in te typen en op enter te duwen.

**Aanmaken provision.sh script**

Het aanmaken van het provision.sh script moet in dezelfde map gebeuren waar de vagrantfile opgeslagen is. Gebruik het commando *vi provision.sh* om het script aan te maken. Ga daarna in de insert modus en plak onderstaande code in het script. Sla daarna het script op.
    
    #!/bin/bash
    # provision.sh -- install apache and php and mysql(mariadb)
    #configureren van firewall 
    
    sudo yum update -y
    sudo yum install -y httpd php php-mysql mariadb-server mariadb
    
    sudo systemctl start httpd.service
    sudo systemctl enable httpd.service
    
    sudo systemctl start mariadb
    sudo systemctl enable mariadb.service
    
    sudo systemctl restart httpd.service
    echo '<?php phpinfo(); ?>' > /var/www/html/info.php
    
    sudo systemctl start firewalld
    sudo firewall-cmd --permanent --add-service=ssh
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --permanent --add-service=mysql
    sudo systemctl restart firewalld
    sudo systemctl enable firewalld
    
    mysql_password="Groep09" 
    
    mysqladmin password "${mysql_password}"
    #Remove anonymous users
    #mysql --user=root --password="${mysql_password}" --init-command="DELETE FROM mysql.user WHERE User='';"

    #mysql --user=root --password="${mysql_password}" --init-command="DELETE FROM mysql.user WHERE User='';"

    
    #Remove test database
    mysql --user=root --password="${mysql_password}" --init-command="DROP DATABASE test;"
    
    #Remove remote root
    #mysql --user=root --password="${mysql_password}" --init-command="DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
    
    #Removing privileges on test database
    #mysql --user=root --password="${mysql_password}" --init-command="DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"


Dit script zorgt ervoor dat alles automatisch geïnstalleerd wordt op je virtuele machine.

**Installeren van guest additions**

Het installeren van de guest additions is nodig om shared folders aan te maken in onze LAMP Stack omgeving. Door het commando *vagrant plugin install vagrant-vbguest* in te typen in git bash wordt de guest additions geïnstalleerd, dit kan enkele minuten duren. Om te controleren als de guest additions wel correct geïnstalleerd zijn voer je het commando *vagrant up* in. Als je in de console deze tekst terugziet ![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/Afbeeldingen/Guest_Additions.PNG) dan is de guest additions met succes geïnstalleerd.

**Opstarten van virtuele machine**

Nadat we alle stappen hiervoor hebben uitgevoerd is het tijd om onze virtuele machine op te starten. Dit doen we via het command *vagrant up*. Het opstarten van de virtuele machine kan enkele minuten tijd in beslag nemen. Je gaat niet echt uitvoer zien, omdat vagrant werkt zonder GUI. Om volledige toegang te krijgen tot je virtuele machine gebruik je het commando *vagrant ssh* zo kan je via de command line aanpassingen doen aan je machine.

**Demo applicatie maken**

Om een demo applicatie te maken, maken we gebruik van een sync folder. Dit werkt enkel als de guest additions correct zijn geïnstalleerd. In dit geval maken we een nieuwe folder aan waar onze vagrantfile is opgeslaan en geven we die de naam *html*. In deze folder maken we dan een *index.html* bestand aan die je [https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/LAMP_Stack/html/index.html](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/LAMP_Stack/html/index.html "hier") kan terug vinden. Wanneer je nu naar het adres 192.168.33.10 gaat kom je terecht op je demo applicatie.


##Interessante links

* Informatie guest additions: http://kvz.io/blog/2013/01/16/vagrant-tip-keep-virtualbox-guest-additions-in-sync/
* Informatie Vagrant: https://docs.vagrantup.com/v2/
* Informatie LAMP Stack: https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-centos-7










