#Documentatie WISA Stack: handmatig

WISA staat voor Windows, IIS, SQL en ASP .NET. 

##Installeren van de WISA Stack
Voor het installeren van de WISA stack maken we gebruik van Vagrant. Dit vereenvoudigt het proces om een virtuele machine aan te maken. Eerst moet je vagrant gaan downloaden. Dit doe je via [deze link](http://www.vagrantup.com/downloads.html). Eenmaal de installatie voltooid is kun je commando's invoeren om zo vagrant op te roepen. Dit doe je via 'gitbash'. 

De eerste stap is navigeren naar een gewenste map. In deze map zullen al je bestanden staan die te maken hebben met deze virtuele machine. Je maakt dus een nieuwe map aan door het commando 'mkdir map1' aan te roepen. Nadien navigeer je naar die map met 'cd map1'. Eenmaal in de map activeer je Vagrant. Dit doe je door 'vagrant init' in te typen. Dit commando zorgt er voor dat er een vagrantfile in de map geplaatst wordt. Op dit document komen we later terug. Eenmaal gedaan kun je de virtuele box van de vagrant cloud halen. Wij kozen ervoor een voorgemaakte basisbox van de gebruiker lmayorga1980 te gebruiken. Hij noemde zijn box windows-2012r2. Het commando gaat als volgt: 'vagrant box add lmayorga1980/windows-2012r2'.

###Aanpassen van de vagrantfile.
Na het invoeren van 'vagrant init' verschijnt er een .Vagrantfile in map1. Navigeer terug naar map1. Dit bestand openen we door 'vi vagrantfile'. Om zaken in deze editor te kunnen bewerken moet je eenmalig op de i-toets drukken. Nu zit je in de bewerk modus. Plak vervolgens 

```
Vagrant.configure("2") do |config|
  config.vm.define "vagrant-windows-2012-r2"
  config.vm.box="lmayorga1980/windows-2012r2"
  config.ssh.insert_key=false
  config.vm.communicator="winrm"
  config.vm.guest = :windows
  config.vm.network "private_network", ip:"192.168.33.11"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end
end
```

in de editor. Sla op en sluit af met het commande ':wq'.


###Opstarten van de virtuele machine
Nu kunnen we de virtuele machine aanzetten. Eenmaal dit is gebeurd zal de virtuele machine ook op het scherm openen. De machine aanzetten doe je met het commando 'vagrant up'. Indien je de GUI niet wenst te gebruiken voer je hierna 'vagrant ssh' in en zit je zo in je virtuele machine via de gitbash.
	
### Wijzigingen doorvoeren op de virtuele machine
Neem nu het scherm van de virtuele machine voor u. Klik op ctrl+alt+del en voer het paswoord "HogentStack2015". Zorg ervoor dat je als Administrator bent ingelogd. In sommige gevallen kan het wachtwoord ook vagrant zijn. Open de powershell op de virtuele machine door op start te klikken en door te navigeren naar het pictogram van powershell. Eerst gaan we IIS 8 installeren. Dit doe je door het commando 'install-windowsfeature web-server' in te voeren. De web management service installeren we door 'install-windowsfeature web-mgmt-service' in te geven. Vervolgens enablen we de remote management. Dit met het commando 'Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WebManagement\Server -Name EnableRemoteManagement -Value 1'. Vervolgens zet je de web management service aan met 'net start wmsvc'. Tot slot stellen we de firewall in zodat het traffic naar wmsvc toestaat. Dit via 'netsh advfirewall firewall add rule name=”Allow Web Management” dir=in action=allow service=”WMSVC”'.

Gemakshalve installeren we eerst de IIS Management Console. Dit doe je via Control Panel -> Programs -> Turn windows features on or off -> IIS Management console. 

De sql management studio, dus de sql server kun je downloaden via http://www.microsoft.com/en-us/download/details.aspx?id=8961. Laat na de download de installatie wizard runnen en volg de stappen. Nu is ook sql server geïnstalleerd.

Als laatste moeten we nog .NET installeren. Dit is vrij eenvoudig. Klik op add Roles and Features -> role based -> selecteer de juiste server -> features -> .NET Framework 4.5. Via de PowerShell kun je dit met het `cd %windir%\Microsoft.NET\Framework\v4.5aspnet_regiis.exe –iru` commando realiseren.

Tot slot stellen we nog enkele beveiligingen in. Ga via Tools naar Local Security Policy. Hier zie je dat de windows firewall with advanced security nog niet geconfigureerd is.
Klik rechts op inbound rules en selecteer New Rule. Voeg een nieuwe predefined regel toe voor:
	- BranchCache Content Retrieval (HTTP-In)
	- BranchCache Hosted Cache Server (HTTP-in)
	- Windows Backup (RPC)
	- Windows Backup (RPC-EPMAP)
Allow deze regels enkel via een seure verbinding.
Voel nu voor Outbound deze regels toe:
	- BranchCache Content Retrieval (HTTP-Out)
	- BranchCache Hosted Cache Server (HTTP-Out)
	- BranchCache Hosted Cache Client(HTTP-Out)
Als laatste ga je naar het Control Panel -> System and Security -> Allow an app or feature through Windows Firewall. Vink nu World Wide Web services aan.

Kies daarnaast in tools voor security configuration wizard. Klik op het einde van deze wizard op apply now. 
	
Als bijkomende factor hebben we een automatische back-up geconfigureerd. Deze neemt dagelijks om 23:00 uur plaats. Log in op de Microsoft Azure, kies voor new -> Data services -> Recovery Services -> Backup vault. Geef de backup vault een naam en kies een regio. Nadien verschijnt je vault in de 'all items' pool. Selecteer je vault. Volg de stappen die Azure voorstelt. a) intalleer Microsoft Azure Backup Agent. Tijdens de installatie dien je de vault credentials in te geven. Deze download je via dezelfde website. Open daarna WIndows Server Backup via tools in de Server Manager. Selecteer online Backup. Klik okp 'schedule Backup' en volg de stappen in de wizard. Daarna is de back up gescheduled.

