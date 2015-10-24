## Testplan en -rapport taak 3: Proefopstelling netwerkapparatuur

* Verantwoordelijke uitvoering: Jordi
* Verantwoordelijke testen: Lucas

### Testplan

Auteur(s) testplan: Lucas, Jordi, Lara

**Doel:**  
netwerkapparatuur beter leren aan de hand van enkele eenvoudige proefopstellingen met routers en switches.

**Acceptatiecriteria:**   

 * Opstellingen in bijlage realiseren, demonstreren en verslag over schrijven.  
 * checklist/procedure opstellen om het apparaat te resetten naar fabrieksinstellingen.
 * cheat sheet bijhouden voor basiscommando's.
 
**lab1: Consolesessie met een switch:**

- Packet tracer is correct geopend
- De switch en pc staan correct verbonden

![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo1.PNG)


**lab2: Eenvoudig netwerk met 2 switches:** 
 
- verify network connectivity:
	- controleer ip-addressen en configuratie router 
		- open command line PC-A en voer "ping 192.168.1.11" in  
		![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo2_2.PNG)  
		- open command line PC-B en voer "ping 192.168.1.10" in   
		![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo2_3.PNG)  
		
- verifieer de device informatie
	- voer "show ip interface brief" in op alletwee de switches en verifieer de output    
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo2_4.PNG)
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo2_5.PNG)    

![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo2_1.PNG)  
wachtwoorden voor switches: "cisco" als password en "class" als priviliged EXEC password

**lab3: Eenvoudig netwerk met router en switch:**

- verify network connectivity:
	- controleer ip-addressen en configuratie router  
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo3_1.PNG)   
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo3_3.PNG)  
	- open command line PC-A en voer "ping 192.168.0.3" in   
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo2_2.PNG)  
- verifieer de device informatie
	- open exec mode in router en switch en verifieer via het "show version" commando.
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo3_4.PNG)    
	- voer "show ip route" in op de router en controleer de vragen.   
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo3_5.PNG)  
	- voer "show interface g0/1" in op de router en controleer de vragen.  
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo3_6.PNG)  
	-  voer "show ip interface brief" in op router en switch en verifieer de output  
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo3_7.PNG)  

wachtwoorden voor router: "cisco" als console password en "class" als priviliged EXEC password.
  

**lab4: complexer netwerk statische routering (optioneel)**  

- verifeer network connectivity
	- controleer ip-addressen en configuratie router en van PC's   
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_1.PNG)  
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_2.PNG)    
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_3.PNG)    
	- Open command line op PC3 en voer een ping command uit naar R3(192.168.1.1) en naar R2(192.168.1.2)    
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_4.PNG)  
	- Open command line op PC1 en voer een ping command uit naar R1(172.16.3.1) en naar R2(192.168.1.2)   
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_5.PNG)  
	-Open command line op PC2 en voer een ping command uit naar R2(172.16.1.1) en naar R1(172.16.2.1)    
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_6.PNG)  
- verifieer de device informatie
	- voer "show ip route" in op de routers en controleer de vragen.    
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_7.PNG)     
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_8.PNG)     
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_9.PNG)  
	- voer "show running-config" in op router3 in priviliged EXEC modus en kijk welke static routes er aanwezig zijn.    
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_10.PNG)      
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_11.PNG)  
	- voer "show ip interface brief" in op de routers en switch en verifieer de output.   
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_14.PNG)     
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_13.PNG)       
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_12.PNG)       
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_15.PNG)      
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_16.PNG)       
	![alt text](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht03/img/labo4_17.PNG)  



Wachtwoorden voor routers: voor router1 = "router1" ,router2="router2" en voor router3="router3"

### Testrapport


* Verantwoordelijke opmaak testplan: Lucas
* Verantwoordelijke testen: Lara

**lab1: Consolesessie met een switch:**

- Packet tracer is correct geopend [OK]
- De switch en pc staan correct verbonden [OK]

**lab2: Eenvoudig netwerk met 2 switches:** 
 
- verify network connectivity:
	- controleer ip-addressen en configuratie router 
		- [OK] open command line PC-A en voer "ping 192.168.1.11" in
		- [OK] open command line PC-B en voer "ping 192.168.1.10" in
- verifieer de device informatie
	- [OK] voer "show ip interface brief" in op alletwee de switches en verifieer de output

**lab3: Eenvoudig netwerk met router en switch:**

- verify network connectivity:
	- [OK] controleer ip-addressen en configuratie router 
	- [OK] open command line PC-A en voer "ping 192.168.0.3" in.
	
- verifieer de device informatie
	- [OK] open exec mode in router en switch en verifieer via het "show version" commando  
	- [OK] voer "show ip route" in op de router en controleer de vragen.
	- [OK] voer "show interface g0/1" in op de router en controleer de vragen
	- [OK] voer "show ip interface brief" in op router en switch en verifieer de output

**lab4: complexer netwerk statische routering (optioneel)**  

- verifeer network connectivity
	- [OK] controleer ip-addressen en configuratie router en van PC's  
	- [OK] Open command line op PC3 en voer een ping command uit naar R3(192.168.1.1) en naar R2(192.168.1.2)
	- [OK] Open command line op PC1 en voer een ping command uit naar R1(172.16.3.1) en naar R2(192.168.1.2)
	- [OK] Open command line op PC2 en voer een ping command uit naar R2(172.16.1.1) en naar R1(172.16.2.1) 
- verifieer de device informatie
	- [OK] voer "show ip route" in op de routers en controleer de vragen.
	- [OK] voer "show running-config" in op router3 en kijk welke static routes er aanwezig zijn.
	- [OK] voer "show ip interface brief" in op de routers en switch en verifieer de output.
