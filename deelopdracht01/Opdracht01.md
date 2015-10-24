##Opdracht 01: IP adressering

### Oefening 1

* IP-adres van deze host: 196.83.116.133
* IP-adres van het subnet: 196.83.116.128/28
*	Broadcastadres van dat subnet: 196.83.116.143
*	Eerste machine van dat subnet: 196.83.116.129
*	Laatste machine van dat subnet: 196.83.116.128
*	Klasse van het hoofdnetwerk (A, B,…) : C
*	Aantal bruikbare subnetten in het hoofdnetwerk: 16
*	Aantal bruikbare hostadressen in elk subnet: 14

### Oefening 2

* Aantal Hosts: 536
* Keuze gaat uit naar 172.16.0.0/16 aangezien bij het eerste netwerkadres te weinig hosts beschikbaar zijn. Bij het laatste netwerkadres zijn er veel te veel beschikbare hosts.

| Nr. | Naam | Netwerkadr. | Subnetmask | CIDR | 1ste hostadr. | laatste hostadr. | Broadcastadr. |
|---|------|----------|-----------|-----|----------|----------|------------|
| 0 | Personeel | 172.16.0.0 | 255.255.254.0 | /23 | 172.16.0.1 | 172.16.1.254 | 172.16.1.255 |
| 1 | Administratie | 172.16.0.0 | 255.255.255.224 | /27 | 172.16.2.1 | 172.16.2.30 | 172.16.2.31 |
| 2 | Directie | 172.16.2.32 | 255.255.255.240 | /28 | 172.16.2.34 | 172.16.2.46 | 172.16.2.47 |
| 3 | Serieël 1 | 172.16.2.48 | 255.255.255.252 | /30 | 172.16.2.49 | 172.16.2.50 | 172.16.2.51 |
| 4 | Serieël 2 | 172.16.2.52 | 255.255.255.252 | /30 | 172.16.2.54 | 172.16.2.54 | 172.16.2.55|

