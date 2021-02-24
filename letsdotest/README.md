# ASPDM
![app logo](docs/img/logo_base_small.png "Logo")

Progetto di APPLICAZIONI SOFTWARE E PROGRAMMAZIONE PER DISPOSITIVI MOBILI della Laurea Magistrale in Informatica Applicata dell'Università di Urbino Carlo Bo

**Studente:** Paride Dominici

**Matricola:** 306075

# Introduzione
Il progetto ha lo scopo di realizzare una applicazione per lo svolgimento di test generici con valutazione automatica del risultato.

# Casi d'uso
1. Valutazione autonoma delle capacità dello studente scegliendo uno dei test a disposizione
2. Verifica delle competenze degli studenti da parte degli insegnanti che sceglieranno il test da 
far fare allo studente. 

## Fasi del test
Il test si divide in diverse fasi:
1. Scelta del Test da svolgere
2. Esecuzione del test
3. Valutazione delle risposte e visualizzazione del risultato

# Fasi dello sviluppo
1. Applicazione statica con test hard coded e come unica tipologia di test quello a scelta multipla
2. Scaricamento dei dati dei test da un server remoto e caricamento dei risultati su un server remoto
3. Aggiunta di altre tipologie di test (fill in the gaps, dropdown, ecc.)

# Interfaccia utente e funzionamento
Quando si lancia il programma si viene posti di fronte alla scelta se fare uno dei test già caricati
o se mettersi in attesa che un test venga lanciato da remoto (ad esempio da un insegnante)

![prima schermata](docs/img/schermata1.png "Prima schermata")

Cliccando sulla scelta *Seleziona un test da svolgere autonomamente* si apre una seconda pagina in
cui è possibile scegliere quale, dei test a disposizione si vuole fare.

![scelta test](docs/img/selezione_test.png "Scelta test")

L'elenco dei test viene caricato dinamicamente dall'esterno. Al momento il file json che contiene
l'elenco dei test è contenuto nel file [test_list.json](https://raw.githubusercontent.com/pdomi2001/aspdm/main/resources/test_list.json)

Cliccando sul test desiderato questo viene caricato e viene mostrata la prima domanda.
Ci si può muovere tra le domande scrollando a destra e sinistra e selezionare la risposta che si 
ritiene esatta cliccando sul box a fianco della risposta.

![esecuzione test](docs/img/esecuzione_test.gif "Esecuzione del test")

I vari test sono contenuti in diversi file .json. Quelli su cui sono state fatte le prove sono i seguenti:

* [Test di Inglese](https://raw.githubusercontent.com/pdomi2001/aspdm/main/resources/inglese.json)
* [Test di Francese](https://raw.githubusercontent.com/pdomi2001/aspdm/main/resources/francese.json)
* [Test di Spagnolo](https://raw.githubusercontent.com/pdomi2001/aspdm/main/resources/spagnolo.json)
* [Test di Tedesco](https://raw.githubusercontent.com/pdomi2001/aspdm/main/resources/tedesco.json)

Una volta terminato di esaminare le domande per conoscere il risultato sarà sufficiente cliccare sul 
pulsante in basso al centro con la scritta *Consegna Test*.
Il test verrà valutato e sarà mostrato un riepilogo dei punti ottenuti sul massimo dei punti 
ottenibili.

# Funzioni aggiuntive
L'applicazione è in grado di generare eventuali avvisi da mostrare 

L'appicazione è anche in grado, come abbiamo detto, di ricevere indicazioni sul test che deve
essere fatto, mediante una notifica Firebase.

La notifica può essere generata usando il link del [backend](http://www.wesic.it/aspdm/index.php)

Il sorgente del backend, ripulito dai codici privati della piattaforma è visibile qui: 
[Sorgente del backend](docs/backend/index.php)

# Note di realizzazione
## Sviluppo multipiattaforma
L'applicazione è stata sviluppata in modo che possa essere compilata sia in modalità android che 
in modalità web. Sono stati utilizzati diversi accorgimenti in modo da avere una compilazione
differente in base al sistema di destinazione come ad esempio l'utilizzo della istruzione 

    if (dart.library.js)
per caricare dinamicamente le librerie web o 

    if (dart.library.io)
per caricare le librerie per android nel file [notificationmanager.dart](lib/notificationmanager.dart).

Nel drawer inoltre è stata aggiunta la possibilità di chiudere l'applicazione

![immagine del drawer](docs/img/drawer.png)



## Gestione dell'orientamento 
Si è cercato, il più possibile, di fare in modo che l'applicazione funzionasse correttamente sia in 
portrait che in landscape adattando, ad esempio, l'immagine di sfondo della schermata inziale a seconda del verso.




# Librerie utilizzate

    provider: ^4.3.2
    
Il package **provider** ci consente di passare le notifiche tra i vari widget dell'applicazione.
Nello specifico di accedere ai dati del progetto e dei test dalle varie pagine.

    http: ^0.12.2
    
Questo package ci serve per poter scaricare i file json con l'elenco dei test disponibili e il 
contenuto del test.

    equatable: ^1.2.5

Questa libreria ci aiuta nella gestione dell'import dei dati dai file json.

    flutter_local_notifications: ^3.0.1
    
Questa libreria ci consente di poter segnalare all'utente, tramite una notifica, eventuali
necessità dell'applicazione.

    firebase_core: ^0.7.0
    
Questa è la libreria base per poter utilizzare google firebase

    firebase_messaging:  "^8.0.0-dev.15"
    
Questa libreria ci permette di mandare dal backend messaggi alla nostra applicazione.
Se si compila l'applicazione in modalità web. Questa riga va commentata e va eseguito nuovamente **pub get** dato che non 
ha una gestione delle notifiche per il web. 

