##Testplan en -rapport taak 2: LAMP stack

* Verantwoordelijke uitvoering: Lara
* Verantwoordelijke testen: Lucas

### Testplan

Auteur(s) testplan: Lara

- [ ] Vagrant box succesvol gedownload en geïnstalleerd
	- ``` vagrant init```
	- ```vagrant box add lmayorga1980/windows-2012r2```
	- Verwacht: De box werd succesvolg geïnstalleerd, er werden geen foutmeldingen verkregen.
- [ ] Vagrant up en ssh werkt
	- ```vagrant up```
	- ```vagrant ssh```
	- Verwacht: er werden geen foutmeldingen gegeven, de user is nu ingelogd in gitbash.
- [ ] De GUI verschijnt bij het typen van vagrant up
	- Verwacht:![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/wisa_ready.png)
- [ ] Suvvesvol aangepast vagrantfile
	- Verwacht: ``` Vagrant.configure("2") do |config|
  config.vm.define "vagrant-windows-2012-r2"
  config.vm.box="lmayorga1980/windows-2012r2"
  config.ssh.insert_key=false
  config.vm.communicator="winrm"
  config.vm.guest = :windows
  config.vm.network "private_network", ip:"192.168.33.11"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end
end```
- [ ] Succesvol aangemeld als administrator met paswoord in de GUI
	- ```control+alt+delete```
	- Invullen HogentStack2015
	- verwacht:![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/wisa_succesvolleLogin.png)
- [ ] IIS8 is geïnstalleerd
	-  Commando: ```install-windowsfeature web-server``` 
	- Dit kun je controleren door de Server manager op te starten. Helemaal links moet er IIS staan.
	- Verwacht:![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/wisa_IISCheck.png)
- [ ] SQL server werd succesvol geinstalleerd
	- Installeer SQL server via [deze link](http://www.microsoft.com/en-us/download/details.aspx?id=8961).
	- Verwacht: na een geslaagde installatie zie kun je de SQL server Management Studio open met het commando ```Ssms```. 
- [ ] .Net werd succesvol geïnstalleerd
	- Start de IIS manager op, klik op VAGRANT-2012-R2(VAGRANT-2012-R2\Administrator) -> Application pools. De geïnstalleerde versie(s) moeten nu verschijnen.
	- Verwacht:![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/wisa_dotnet.png)
- [ ] Beveiliging staat op punt
	- Klik op tools- local security policy. Maak nu een nieuwe policy aan. 
	- Pas ook de Local Security Policy aan, doe dit via tools. 
	- Verwacht:![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/wisa_secrity.png)
	- Pas nu de firewall instellingen aan via Local Security Policy. (Zie documentatie).
- [ ] De webserver werkt
	- Voer het adres http://192.168.33.11/ zowel in je virtuele machine als in je gewone brower in.
	- Verwacht resultaat:![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/wisa_draait.png).
- [ ] Documentatie nalezen op schrijffouten


### Testrapport

Uitvoerder(s) test: Lucas	


- [OK] Vagrant box succesvol gedownload en geïnstalleerd
- [OK] Vagrant up en ssh werkt
- [OK] De GUI verschijnt bij het typen van vagrant up
- [OK] Suvvesvol aangepast vagrantfile
- [OK] Succesvol aangemeld als administrator met paswoord in de GUI
- [OK] IIS8 is geïnstalleerd
- [OK] SQL server werd succesvol geinstalleerd
- [OK] .Net werd succesvol geïnstalleerd
- [OK] Beveiliging staat op punt
- [OK] Documentatie nalezen op schrijffouten
