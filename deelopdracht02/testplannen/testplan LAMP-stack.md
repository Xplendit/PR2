## Testplan en -rapport taak 2: LAMP stack

* Verantwoordelijke uitvoering: Daan
* Verantwoordelijke testen: Lucas

### Testplan

Auteur(s) testplan: Daan

- [ ] [Documentatie](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/LAMP_Stack/LampStack.md "Documentatie") nalezen op schrijffouten
- [ ] Apache geïnstalleerd en running : sudo service httpd status
	![httpd](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/LAMP_Stack/Httpd.PNG)
- [ ] Mysql geïnstalleerd en running : sudo service mariadb status
	![MariaDB](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/LAMP_Stack/MariaDB.PNG)
- [ ] Firewall running : sudo systemctl status firewalld
	![FirewallD](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/LAMP_Stack/FirewallD.PNG)
- [ ] Firewall services http,mysql en ssh geactiveerd: sudo firewall-cmd --list-all
	![FirewallD](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/LAMP_Stack/Firewall_list_all.PNG)
- [ ] PHP geïnstalleerd : http://192.168.33.10/info.php
- [ ] Apache bereikbaar van buiten af: http://192.168.33.10
- [ ] Inloggen mysql -u root -p : wachtwoord:Groep09
- [ ] Kijken of test database verwijderd is: mysql -u root -p --> wachtwoord Groep09 --> show databases;
	![database](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/LAMP_Stack/Database.PNG)




### Testrapport

Uitvoerder(s) test: Lucas

- [OK] Documentatie nalezen op schrijffouten
- [OK] Apache geïnstalleerd en running
- [OK] Mysql geïnstalleerd en running
- [OK] PHP geïnstalleerd (php.ini is aanwezig in /etc)
- [OK] Apache bereikbaar van buiten af: test linkt werkt correct
- [OK] Inloggen mysql -u root -p
- [OK] Test database verwijderd

