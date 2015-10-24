#VM opzetten met Azure

##Inleiding 
Voor het opzetten van onze verschillende stacks maken we gebruik van het Microsoft Azure Platform. Dit is een cloud computing-platform van Microsoft. Deze software hoeft niet geïnstalleerd te worden op de computer want alles gebeurt via het web. Ook de toegang tot bestanden en mappen gebeurt via het web.

##Manueel opzetten van VM
Wanneer je de registratie en activatie van Azure hebt gedaan, surf je naar [https://manage.windowsazure.com](https://manage.windowsazure.com) en klik je in het menu op *portal*. 
Om een nieuwe virtuele machine op te zetten klik je links onderaan op new

![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/Afbeeldingen/Azure/New.PNG) 

We komen vervolgens op een nieuwe pagina terrecht waar we verschillende keuze mogelijkheden hebben. In ons geval kiezen voor compute --> virtual machine en kiezen we voor een virtuele machine uit de gallery.
![Galery](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/Afbeeldingen/Azure/Gallery.PNG)

In ons gevallen kiezen we voor een centos-based images en selecteren we OpenLogic-7.0 want dit komt overeen met het besturingssysteem Centos7
![OpenLogic](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/Afbeeldingen/Azure/Image.PNG)

We komen hierna op de configuratie pagina terecht van de virtuele machine. Geef een gepaste naam voor je machine. Indien je dit wenst kan je de username veranderen en geef ook een gepast wachtwoord in.
![Configuration](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/Afbeeldingen/Azure/Image1.PNG)

In de volgende stap geef je u machine een cloud service dns name en selecteer je de juiste regio. Je hebt ook de mogelijkheid om al verschillende endpoints te activeren.
![](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/Afbeeldingen/Azure/Image2.PNG)

Wanneer je volgende stap voltooid hebt wordt de virtuele machine geïnstalleerd, dit kan enkele minuten in beslag nemen. Om de gegevens van je machine te gaan bekijken selecteer je u machine dat je net aangemaakt hebt en kies je in het menu voor dashboard.

![Dashboard](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/Afbeeldingen/Azure/Dashboard.PNG)

##VM configureren via PuTTY##
PuTTY is een vrije SSH-client. Het is gratis software waarmee iemand een verbinding kan maken met een andere computer, dit wordt vooral gebruikt bij servers die op UNIX gebaseerd zijn. De verbinding tussen PuTTY en de server verloopt tegenwoordig via het SSH-protocol,dit is de opvolger van het verouderde en minder veiligere telnetprotocol.

Om te beginnen gaan we eerst PuTTY installeren. Onderaan dit document bij interessante links vind je de download link. Wanneer de installatie voltooid is keren we terug naar onze virtuele machine op Azure.

Voor een verbinding te maken via PuTTY met onze virtuele machine op Azure hebben we het SSH adres nodig van onze machine. Dit kan je terug vinden rechts op je dashboard bij SSH details.

![SSH](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/Afbeeldingen/Azure/Details.PNG)

Nu starten we PuTTY op en geven we het SSH adres in wat we bij de details gevonden hebben. In mijn voorbeeld is dit *groep09-lampstack.cloudapp.net* en als poortnummer gebruiken we standaard poort 22 voor SSH.
![PuTTY](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/Afbeeldingen/Azure/PuTTY.PNG)

Wanneer je alle gegevens hebt ingegeven klik je onderaan bij PuTTY op *open* en dan kom je op een terminal venster terecht waar ze je login en wachtwoord vragen. Wanneer je bij de configuratie van je machine de username niet hebt veranderd dan is deze standaard *azureuser*. Vul daarna het wachtwoord in dat je gekozen hebt. Als alles gelukt is heb je toegang tot je virtuele machine en je de mogelijkheid om je commando's in te vullen in het terminal venster.
![PuTTY](https://github.com/HoGentTIN/ops-g-09/blob/master/deelopdracht02/documentatie/Afbeeldingen/Azure/PuTTY1.PNG)

Als je volledig u virtuele machine hebt geconfigureerd en je wilt het resultaat bekijken dan kik dit door naar je DNS-name te surfen, in dit voorbeeld is dit namelijk: [https://groep09-lampstack.cloudapp.net](https://groep09-lampstack.cloudapp.net)



# Interessante links #
- [http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)
- [http://azure.microsoft.com/](http://azure.microsoft.com/)
