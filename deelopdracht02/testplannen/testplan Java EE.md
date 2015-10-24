## Testplan en -rapport taak 2: Java EE stack
* Verantwoordelijke uitvoering: Jordi
* Verantwoordelijke testen: Lucas

### Testplan

Auteur(s) testplan: Jordi

- [ ] Documentatie nalezen op schrijffouten
- [ ] Java 1.7 is geïnstalleerd: java -version
- ![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/JavaVersion.PNG)
- [ ] Tomcat 7 service is running: service tomcat status
- ![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/TomcatStatus.PNG)
- [ ] Firewall running : sudo systemctl status firewalld 
- ![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/testplannen/Afbeeldingen/firewallJava.PNG)
- [ ] Tomcat 7 succesvol geinstalleerd: surfen naar 192.168.50.4:8080
- [ ] De testapp werkt op de server: surfen naar 192.168.50.4:8080/sample

### Testrapport

Uitvoerder(s) test: Lucas

- [OK] Documentatie nalezen op schrijffouten
- [OK] Java 1.7 is geïnstalleerd
- [OK] Tomcat 7 service is running
- [OK] Firewall is running
- [OK] Tomcat 7 succesvol geinstalleerd
- [OK] De testapp werkt op de server