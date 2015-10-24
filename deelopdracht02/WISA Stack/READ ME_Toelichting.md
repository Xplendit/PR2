#Toelichting WISA stack
##Algemeen
De virtuele machine is 28 GB groot. Daarom is het zeer moeilijk om deze te uploaden op GitHub. de virtuele machine is wel terug te vinden op de Vagrant Cloud.

Er zijn twee documentatiefiles terug te vinden. "WisaStack" bevat de documentatie zoals wij de webserver hebben opgezet. Er wordt dus een vagrant box gedownload en alle instellingen worden toegepast. De tweede file legt uit hoe je de webserver automatisch kunt binnenhalen.

##Mogelijke foutmelding bij startup script
Een mogelijke foutmelding "HTTP server doesn't seem to support byte ranges. Cannot resume" kan voorkomen indien de box nog de temporary files bevindt. Deze dient u dan te verwijderen via C:\Users\<username\.vagrant.d\tmp\

##Links
- [Vagrant cloud](https://atlas.hashicorp.com/zwadderich/boxes/Wisa)
