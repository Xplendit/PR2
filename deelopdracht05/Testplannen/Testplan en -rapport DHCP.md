##Testplan en -rapport taak 5: Linux server met DHCP  

* verantwoordelijke uitvoering: Lucas
* verantwoordelijke testen: Jordi

### Testplan

Auteur(s) testplan: Lucas

* [ ] Documentatie nalezen op schrijffouten.
* [ ] De machine start correct op.
* [ ] De DHCP server wil starten. 
	* commando's "sudo systemctl start dhcpd" en "sudo systemctl enable dhcpd" geeft geen errors.
* [ ] Controleer de status van de dhpcd service via "systemctl status dhcpd". Er zou een groene "active (running)" moeten staan.
* [ ] controleer het dhcpd.conf bestand via "sudo vi /etc/dhcpd/dhcpd.conf".
  * ![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht05/img/DHCPD.conf.png)


### Testrapport

Auteur(s) testrapport: Jordi

* [OK] Documentatie nalezen op schrijffouten.
* [OK] De machine start correct op.
* [OK] De DHCP server wil starten. 
	* commando's "sudo systemctl start dhcpd" en "sudo systemctl enable dhcpd" geeft geen errors.
* [OK] Controleer de status van de dhpcd service via "systemctl status dhcpd". Er zou een groene "active (running)" moeten staan.
* [OK] controleer het dhcpd.conf bestand via "sudo vi /etc/dhcpd/dhcpd.conf".