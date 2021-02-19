# aspdm
Progetto di APPLICAZIONI SOFTWARE E PROGRAMMAZIONE PER DISPOSITIVI MOBILI della Laurea Magistrale in Informatica Applicata dell'Università di Urbino Carlo Bo

**Studente:** Paride Dominici 
**Matricola:** 306075

# Introduzione
Il progetto ha lo scopo di realizzare una applicazione per lo svolgimento di test generici con valutazione automatica del risultato.

# Casi d'uso
1. Valutazione autonoma delle capacità dello studente
2. Verifica delle competenze degli studenti da parte degli insegnanti (risultato caricato su un server)


## Fasi del test
Il test si divide in diverse fasi:
1. Scelta del Test da svolgere
2. Esecuzione del test
3. Valutazione delle risposte e visualizzazione del risultato

Nella prima fase l'elenco dei test disponibili verrà scaricato dal server che contiene i test e, una volta scelto, verrà scaricato il test desiderato e lanciato.
Nella fase di esecuzione del test ogni domanda avrà una pagina a se' stante. Ci si potrà muovere tra le pagine facendo swipe destra o sinistra (per avanzare o retrocedere nelle domande). In ogni momento sarà possibile consegnare e far valutare il test cliccando sull'apposito pulsante.
Premuto il pulsante della valutazione del test si aprirà la finestra con il riepilogo delle risposte esatte o errate.


# Fasi dello sviluppo
1. Applicazione statica con test hard coded e come unica tipologia di test quello a scelta multipla
2. Scaricamento dei dati dei test da un server remoto ed eventuale caricamento dei risultati su un server remoto
3. Aggiunta di altre tipologie di test (fill in the gaps, dropdown, ecc.)

