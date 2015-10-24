##CheatSheet commando's

###Lab 3

Router:   

- enable : enable privileged EXEC mode
- conf t : enter configuration mode
- hostname R1 : geef de router de naam "R1"
- no ip domain-lookup: disable DNS lookup
- enable secret class: assign "class" als priviliged EXEC password
- line con 0: ga naar console 0 configuratie
- password cisco: assign "cisco" als console password
- login: enable login
- exit: exit configuratie
- line vty 0 4: ga naar vty 0 4 configuratie
- service password-encryption: encrypt de passwords
- banner motd # : create banner
- int g0/0: ga naar interface configuratie
- description Connection to PC-B: geef beschrijving aan interface
- ip address 192.168.0.1 255.255.255.0 : configureer ip address voor interface
- no shut: laat de interface niet shutdownen
- copy running-config startup-config: save running configuration to startup file
- clock set 17:00:00 29 Nov 2012 : zet de klok op de router
- erase startup-config : remove startup configuration from NVRAM
- reload : remove old configuration from memory
- show version : toont info 
- show ip route: toont routing tabel
- show interface g0/1: toont interface informatie
- show ip interface brief: toont lijst van interfaces