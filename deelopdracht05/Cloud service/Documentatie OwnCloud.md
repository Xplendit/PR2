#Documentatie ownCloud


## Inleiding ##
OwnCloud is een gratis softwaresuite met een serveronderdeel en verschillende clientonderdelen. Het doel van ownCloud is om serveronafhankelijke online opslagruimte aan te bieden. In contrast met commerciële online opslagdiensten kan iedereen zijn eigen ownCloud-server opzetten, en verschillende computers er mee verbinden via de clientapplicaties

## Opzetten van een Point-to-site VPN connectie met een Azure Virtual Netwerk
### Een virtueel netwerk aanmaken ###
1. Log in in je Azure Management Portal
2. Klik op **New** in de linkeronderhoek. Kies voor **Network Services** en dan voor **Virtual Network**. Kies uiteindelijk voor **Custom Create**.
3. Vul de nodige informatie aan. Zorg er voor dat je tijdens de tweede stap de checkbox onder de optie **Point-To-Site Connectivity** aanvinkt.
![](http://puu.sh/hMZ6t/02b3a4a4c1.png)
4. Bij de laatste stap zorg je ervoor dat je een Gateway subnet aanmaakt door op **Add gateway subnet** te klikken.
![](http://puu.sh/hMZDn/814273a2d4.png)
5. Na de laatste stap wordt je virtueel netwerk aangemaakt. Klik vervolgens op dit netwerk en ga naar je dashboard. Hier zie je de foutmelding dat er nog geen gateway is aangemaakt. Klik vervolgens op de knop **create gateway** om een gateway aan te maken. Deze vind je onderaan het scherm. Dit kan tot 15 minuten duren. 
![](http://puu.sh/hN00l/a979756a3b.png)

### Certificaten aanmaken ###
1. Om een X.509 certificaat aan te maken, maak je gebruik van van de **Certificate Creation Tool **. Om deze tool te kunnen gebruiken, moet  je [ Microsoft Visual Studio Express 2013](https://www.visualstudio.com/products/visual-studio-express-vs.aspx ) installeren.
2. Navigeer naar de installatiefolder van Visual Studio Tools en voer de commandprompt uit als administrator.
3. Het volgende commando zal een rootcertificaat aanmaken dat je nodig hebt om up te loaden naar je Managemtent Portal. Verander eerst de directory naar de directory waar je het certificaat wilt aanmaken.

		makecert -sky exchange -r -n "CN=RootCertificateName" -pe -a sha1 -len 2048 -ss My "RootCertificateName.cer"

4. Vervolgens upload je dit certificaat naar je management portal. Klik op je virtueel netwerk en kies vervolgens voor **Certificates**. Upload hier je certificaat
![](http://puu.sh/hN1os/d0cfcb8924.png)
5. Nu gaan we een clientcertificaat aanmaken. Open opnieuw de visual studio command prompt en voor volgend commando uit.

		makecert.exe -n "CN=ClientCertificateName" -pe -sky exchange -m 96 -ss My -in "RootCertificateName" -is my -a sha1
6. Je moet op elke computer die je wilt verbinden met dit netwerk een client certificaat installeren. Voer het programma *certmgr.msc* uit. Klik met ej rechtermuisknop op het client certificaat dat je wilt exporteren, klik op **alle taken** en klik dan op **export**.
![](http://puu.sh/hPeFI/6192537e64.png)
7. Tijdens het exporteren moet je er voor zorgen dat je een wachtwoord instelt op je private key en dat je deze mee exporteert. Exporteer het .pfx file naar elke computer die je wilt verbinden met dit virtueel netwerk. Dubbelklik vervolgens op het .pfx file om de key te installeren.

![](http://puu.sh/hPeTo/1677d99270.png)
![](http://puu.sh/hPeVu/5c0abc74e7.png)

### VPN client configureren ###

1. Installeer de VPN client op je virtueel machine waar de AD server is geïnstalleerd . Dit programma download je in het management portal van je virtueel netwerk. Installeer dit programma, kijk vervolgens naar je verbindingen, hier zal je het vpn zien bij staan. Verbind met dit vpn.

## Installeren van ownCloud ##

### Virtueel machine aanmaken ###

1. We gaan eerst een virtueel machine aanmaken in je virtueel netwerk. Klik op **new** vervolgens kies je voor **virtueel machine** en dan voor **from gallery**. We kiezen hier voor een **Ubunutu 14.04 LTS** virtueel machine.
![](http://puu.sh/hSO3L/676b5e827a.png)
2. Zorg ervoor dat je ervoor kiest om een wachtwoord te gebruiken in plaats van een certificaat.
![](http://puu.sh/hSO7e/403239074e.png)
3. Selecteer je virtueel netwerk bij **Region/affinity group/ virtual network**
![](http://puu.sh/hSOaw/5528653300.png)
4. Vervolledig de setup. Nu zal de virtueel machine aangemaakt worden, dit kan even duren.

### Owncloud installeren ###

1. Om Owncloud te installeren moet je verbinding maken met je virtueel machine via [Putty](http://www.putty.org/). In je dashboard van je virtueel machine vind je de SSh details om te kunnen verbinden. Verbind met je virtueel machine en voor de volgende commando's uit.

		sudo apt-get install apache2 mariadb-server libapache2-mod-php5 -y
		sudo apt-get install php5-gd php5-json php5-mysql php5-curl php5-ldap -y
		sudo apt-get install php5-intl php5-mcrypt php5-imagick -y
2. Hiermee heb je alle nodige services geïnstalleerd om Owncloud te kunnen draaien. Met volgende commando's installeer je Owncloud.

		sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud.list"
		sudo apt-get update -y 
		sudo apt-get install owncloud --force-yes -y
3. In de Azure portal, navigeer je eerst naar je virtueel netwerk. Vervolgens ga je naar je dashboard en kijk je welk ip adres je virtueel machine in je virtueel netwerk heeft gekregen. Navigeer nu op je virtueel machine die je hebt verbonden met het netwerk naar dit ip-adres zoals de volgende screenshot.
![](http://puu.sh/hSRRl/844708ed3c.png)	
4. Rond de installatie af. Vergeet niet om MySQL/MariaDB als database te kiezen.
![](http://puu.sh/hSRZ2/a8cde87aa8.png)
5. Door de vorige stap te doen heb je ervoor gezorgd dat er een basis config file is gegenereerd. Deze gaan we nu aanpassen via putty. We gaan ervoor zorgen dat je owncloud ook buiten het virtueel netwerk bereikbaar is. Ga eerst naar de volgende locatie.
		cd ../../var/www/owncloud/config/

Hier zal je een config file vinden. Deze zier er zo uit:


		$CONFIG = array (
		'instanceid' => 'oc09w1939bip',
		'passwordsalt' => 'Pq5QPCHin6gTUCEJnPpXVPIpr/QgXt',
		'secret' => 'yDuCrbgufoNKsPBKsSIOzDloN/vfJOBRVLo4gRLFhYHIZSCw',
		'trusted_domains' =>
		array (
		0 => '10.0.0.4',
		),
		'datadirectory' => '/var/www/owncloud/data',
		'overwrite.cli.url' => 'http://10.0.0.4/owncloud',
		  'dbtype' => 'mysql',
		  'version' => '8.0.3.4',
		  'dbname' => 'owncloud',;

Verwijder uit deze config file vervolgens het volgende gedeelte.

		'trusted_domains' =>
		array (
		0 => '10.0.0.4',
		),
6. Als laatste voeg je nog een endpoint toe aan je Virtual machine. Zoals de volgende screenshot. Normaal zal je enkel een http endpoint moeten toevoegen.
![](http://puu.sh/hSYbI/f45391d780.png)
7. Als het goed is, is het nu mogelijk om buiten je virtueel machine naar je owncloud te navigeren.

## Active Directory verbinden met ownCloud ##

1. Log in op je owncloud. Klik dan vervolgens inde linker bovenhoek op **apps**, daarna terug op **apps**. Klik nu op **niet ingeschakeld**, en scroll naar beneden tot je **LDAP user and group backend**  ziet staan. Activeer dit.
2. Vervolgens klik je rechtsboven op **admin** en kies je voor **beheer**. Zorg ervoor dat je alles gegevens correct invoert zoals volgende screenshots. Als je de juiste host invult, zal het poort automatisch ingevuld worden.
![](http://puu.sh/hSZQT/deab1e816b.png)
Open het scherm **Active Directory Users en Computers** op je AD-server. Om de juiste user DN te vinden ga je naar de properties van een user in je AD(in dit voorbeeld hebben we een user aangemaakt specifiek voor Owncloud) en ga je naar attribute editor. Als dit niet beschikbaar is dan ga je naar **view** en kies je voor **Advanced Features**.

![](http://puu.sh/hT01l/806670136e.png)

3. Zorg er nu voor dat je configuratie hetzelfde eruit ziet zoals de volgende screenshots.
![](http://puu.sh/hT0KG/429dddafca.png)
![](http://puu.sh/hT0LU/28f846079c.png)
![](http://puu.sh/hT0ND/570c6e4e6e.png)
![](http://puu.sh/hT0Pw/a24f1dfb19.png)
![](http://puu.sh/hT0QY/41ddb01588.png)


