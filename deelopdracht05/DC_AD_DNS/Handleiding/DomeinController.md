#Handleiding DC ADDS
* Toevoegen nieuwe VB met Windows 2012. Vergeet niet om te kiezen voor een server met GUI. Kies tevens voor een clean install
* Stel voor het opstarten een nieuwe netwerkkaart in. Uiteindelijk heb je 1 NAT en 1 Host-only adapter. Ga vervolgens naar je netwerkverbindingen. Hernoem de eeste naar LAN en de tweede naar INTERNET. Bekijk nu de eigenschappen van LAN. Vink ipv6 uit en bekijk de eigenschappen van ipv4. Vul als ip adres 192.0.0.1 aan.
* Verander de naam van de computer naar DomeinController. Dit doe je via configuratiescherm -> systeem en beveiliging -> systeem -> systeemeigenschappen. Ga naar het tabblad computernaam en typ DomeinController in. Controleer hier ook of de pc lid is van de werkgroep WERKGROEP
* Installeren AD DS Role	
 `Add-windowsfeature AD-Domain Services`
* Waardeer de server op tot een domeincontroller. Klik hiervoor op de meldingenknop en selecteer 'opwaarderen tot een domeincontroller'. Bij distributieconfiguratie selecteer je een nieuw forest toevoegen. Wij zullen ons domein corp.WindowsOfOpportunities.com noemen. Klik op volgende. Geef een veilig wachtwoord in. Wij kiezen voor Groep09. Klik tweemaal op volgende. Geef als netBIOS-domeinnaam WOP op. Klik vervolgens terug tweemaal op volgende. Controleer je selecties en verbeter indien nodig. Klik op volgende en vervolgens op installeren.
Eenmaal de installatie succesvol is afgerond zal de computer opnieuw opstarten. De naam zal nu WOP\Administrator zijn. 

Geef het script voor de users (zie Github) in in de powershell. Nu zitten alle gebruikers in de Active Directory - gebruikers en computers. Nu maken we 3 OU's aan. Klik drie keer op 'Een neiuwe organisatie-eenheid maken in de huidige container. Zorg ervoor dat je ze aanmaakt onder corp.WindowsOfOpportunities.com. Voer per OU nu een passende beschrijving in. 
Wat we nu gaan doen is voor iedere groep gebruikers gepaste beperkingen op leggen. De eerste groep is HR. Hiervoor maken we een nieuwe GPO aan. Dit noemen we GPO_HR. Ga naar de editor voor groepsbeleidbeheer. Indien er bepaalde software voor HR is, stel je deze in via de software-installatie, die is er momenteel niet. Het volgende is de windows instellingen. Bij beveiligingsinstellingen stellen we accountbeleid het wachtwoord- en acountvergrendelingsbeleid in. We stellen in dat men om de 60 dagen een nieuw wachtwoord moet kiezen. De minimale wachtwoordlengte stellen we in op 8 tekens. Tevens kiezen we om de twee vorige paswoorden te onthouden, om zo de uniekheid te forceren. Tot slot stellen we ook in dat het wachtwoord moet voldoen aan de complexiteitsvoorwaarden. Bij Accountvergrendelingsbeleid stellen we de drempel voor accountvergrendelingen op 3 ongeldige pogingen in. Dit betekent dat na drie foute pogingen men niet meer kan inloggen. Daarnaast stellen we het opnieuw beginnen tellen na in op 30 minuten. Na 30 minuten kan de gebruiker dus opnieuw proberen. Vervolgens passen we de gebruikersconfiguratie aan. Onder beheerssjablonen - configuratiescherm zorg je ervoor dat de gebruikre geen toegang tot het configuratiescherm en de pc instellingen krijgt. Zorg bij het tabblad ervoor dat de gebruiker geen software kan installeren en deleten. Doe dit nu ook voor de Sales en Technical gebruikers. 

Dit is de basis configuratie voor onze Active Directory. 

#Interessante links

- Add custom attributes in AD: [http://www.sharepointpals.com/post/How-to-Custom-Attributes-in-Active-Directory-in-Windows-Server-2012-ADDS](http://www.sharepointpals.com/post/How-to-Custom-Attributes-in-Active-Directory-in-Windows-Server-2012-ADDS)
>>>>>>> f3f55534e3e8e683eac9c85d1b7c8ae9a25de859