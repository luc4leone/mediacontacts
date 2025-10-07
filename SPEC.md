# SPEC DI ALTO LIVELLO - MediaContacts

## 1. Overview del Progetto

### 1.1 Descrizione Generale

MediaContacts è una web application responsive progettata per semplificare e ottimizzare il lavoro degli uffici stampa, comunicatori e professionisti delle PR nella creazione e gestione di liste di contatti giornalistici e nell'invio di comunicati stampa.

### 1.2 Obiettivo Principale

Permettere agli utenti di creare liste mirate di giornalisti attingendo da un database professionale costantemente aggiornato, e gestire l'invio di comunicati stampa con funzionalità anti-spam e tracking avanzato.

### 1.3 Utenti Target

- Addetti all'ufficio stampa
- Comunicatori
- Professionisti delle PR
- Agenzie di comunicazione

### 1.4 Mercato di Riferimento

Italia (fase iniziale), con database che copre anche Francia e Spagna.

---

## 2. Tipologie di Utenti e Permessi

### 2.1 Amministratore

**Capacità:**

- Creazione e gestione di nuovi utenti
- Creazione di liste visibili/non visibili a tutti gli utenti
- Creazione di liste modificabili/non modificabili
- Accesso a tutte le funzionalità della piattaforma

**Limitazioni:**

- Non può impostare limiti specifici per singolo utente
- Non vede i to-do personali degli altri utenti

### 2.2 Utente Standard

**Capacità:**

- Creazione e gestione delle proprie liste
- Consultazione del database giornalisti
- Creazione, modifica e invio di comunicati
- Gestione progetti
- Visualizzazione statistiche dei propri invii
- Creazione e gestione to-do personali
- Import di liste personali (che rimangono private)
- Export di liste

**Limitazioni:**

- Non può vedere tutte le liste create da altri utenti
- Tutti gli utenti standard hanno lo stesso livello di permessi

### 2.3 Ospite (Cliente)

**Capacità:**

- Visualizzazione dei progetti a lui assegnati
- Consultazione dei comunicati inviati nel progetto
- Visualizzazione della rassegna stampa collegata

**Limitazioni:**

- Solo visualizzazione (sola lettura)
- Nessuna possibilità di modificare, commentare o approvare
- Accesso limitato solo ai progetti specificamente assegnati

### 2.4 Gestione Account

- Registrazione: non autonoma, solo tramite creazione da parte dell'amministratore via back office
- Credenziali: rilasciate dall'azienda all'amministratore
- Multi-account: un utente non può appartenere a più organizzazioni
- Autenticazione a due fattori: non prevista nella versione iniziale
- Creazione utenti: l'amministratore crea utenti tramite pannello di controllo fornendo email e password

---

## 3. Funzionalità Core (MVP)

### 3.1 Priorità Assoluta

1. **Creazione di mailing list con filtri avanzati**

   - Filtraggio secondo criteri multipli
   - Ricerca tramite stringhe di testo
   - Sistema di filtri combinabili

2. **Invio di comunicati tramite piattaforma**

   - Sistema anti-spam integrato
   - Garanzia di deliverability superiore rispetto a invii da account personali

3. **Creazione di comunicati**
   - Editor interno per creare comunicati
   - Possibilità di caricare comunicati esterni (PDF)

### 3.2 Funzionalità Essenziali Aggiuntive

- Gestione e riutilizzo di liste precedenti
- Tracking e statistiche degli invii
- Gestione progetti per clienti
- Database giornalisti con ricerca avanzata

---

## 4. Gestione Database Giornalisti

### 4.1 Struttura Dati Giornalista

**Informazioni principali:**

- Nome e cognome
- Redazione di appartenenza
- Testata giornalistica
- Argomento/i di cui scrive
- Ruolo nella redazione

**Contatti:**

- Email diretta
- Telefono diretto
- Telefono di redazione
- Indirizzo fisico
- Social network (tutti i profili)

**Dati analitici:**

- Word cloud (parole chiave degli articoli, dimensione proporzionale alla frequenza)
- Lista articoli scritti
- Storico comunicati ricevuti
- Numero di articoli scritti basati su comunicati ricevuti (indice di "friendliness")

**Note e personalizzazione:**

- Note personali private dell'utente

### 4.2 Relazioni tra Entità

**Giornalista ↔ Testata ↔ Redazione:**

- Un giornalista appartiene a una redazione
- Un giornalista scrive per una testata
- Una redazione può avere più testate
- Una testata può avere più redazioni
- La relazione non è gerarchica ma complessa e molti-a-molti

**Gerarchia interna redazione:**

- Organigramma dal direttore responsabile al semplice redattore
- Rappresentata attraverso i ruoli

### 4.3 Ruoli Giornalisti

Lista ruoli (non esaustiva):

- Aggiunto al direttore
- Direttore
- Assistente
- Assistente ai programmi
- Autore
- Blogger
- Capo area
- Capo cronista
- Capo redattore
- Capo redattore centrale
- Capo servizio
- Collaboratore
- Comitato di redazione
- Conduttore
- Corrispondente
- Correttore
- Direttore editoriale
- Direttore politico
- Direttore di rete
- Direttore tecnico
- Altri

### 4.4 Argomenti e Categorie

**Macro-categorie:**

- Agricoltura
- Alimentari
- Ambiente
- Amministrazione
- Architettura
- Arredamento
- Arte
- Attualità
- Automazione
- Chimica
- Commercio
- Cosmesi
- Economia
- Edilizia
- Energia
- Fotografia
- Gestione e logistica materiale
- Hi-fi, elettronica
- Hobby, tempo libero
- Impiantistica, macchinario
- Impresa, lavoro
- Informatica, web
- Legge, diritto, fisco
- Management, organizzazione, politica
- Musica
- Motori
- Moda
- Scienza
- Ristorazione
- Radio
- Pubblicità
- Società
- Spettacoli
- Sport
- Telecomunicazioni
- Trasporto
- Turismo

**Sotto-categorie (esempio Turismo):**

- Agriturismo
- Camping
- Fiere
- Turismo
- Viaggi e turismo

_Nota: Ogni macro-categoria ha le proprie sotto-categorie specifiche_

### 4.5 Criteri di Filtro Giornalisti

Gli utenti possono filtrare i giornalisti secondo:

- **Argomento**: categoria/sottocategoria di interesse
- **Testata giornalistica**: nome della testata
- **Redazione**: sede/redazione di appartenenza
- **Frequenza di pubblicazione**: della testata
- **Diffusione territoriale**: ambito geografico della testata/redazione
- **Ruolo del giornalista**: posizione nella redazione
- **Tipo di media**: agenzia stampa, carta stampata, online, radio, TV
- **Ricerca testuale**: stringhe di testo libero

**Caratteristiche filtri:**

- Tutti i filtri sono combinabili tra loro
- Gli utenti possono salvare combinazioni di filtri per riutilizzarle
- Per escludere elementi specifici: selezionare tutti tranne quello da escludere

### 4.6 Ricerca Giornalisti

**Campi visualizzati nei risultati:**

- Nome e cognome
- Ruolo
- Indirizzo email
- Numero di telefono
- Argomento/i
- Testata

**Modalità di selezione:**

- Selezione singola
- Selezione multipla
- Aggiunta di tutti i risultati filtrati

### 4.7 Word Cloud

**Caratteristiche:**

- Generata dagli articoli del giornalista
- Parole dimensionate in base alla frequenza di utilizzo
- Scopo: comprendere rapidamente i temi trattati dal giornalista

**Aggiornamento:**

- Basata su articoli recenti (orizzonte temporale specifico)
- Aggiornamento ogni ~5 nuovi articoli disponibili
- Fonte dati: piattaforma di rassegna stampa integrata

### 4.8 Aggiornamento Database

**Frequenza:**

- Aggiornamento quotidiano dei dati giornalisti/redazioni/testate
- Gestito dall'azienda fornitrice della piattaforma

**Visibilità aggiornamenti:**

- Gli utenti devono vedere quali dati sono stati recentemente aggiornati
- Scopo: evidenziare l'importanza di avere dati sempre freschi
- Messaggio implicito: le liste esportate diventano obsolete nel tempo

**Interazione utenti con database:**

- Segnalazione errori/dati obsoleti
- Richiesta aggiunta di giornalisti non presenti
- Sistema di segnalazione integrato nell'applicazione

### 4.9 Gestione Duplicati

**Durante aggiunta manuale:**

- Sistema di alert per potenziali duplicati
- Basato su logica di matching (es. stesso nome + email simile)
- Avviso: "possibile duplicato rilevato"
- Decisione finale all'utente

---

## 5. Gestione Testate Giornalistiche

### 5.1 Informazioni Testata

**Dati principali:**

- Nome testata
- Tipo di media (supplemento, quotidiano, etc.)
- Frequenza di pubblicazione (settimanale, mensile, etc.)
- Argomento principale

**Contatti:**

- Telefono
- Email
- Indirizzo fisico
- Sito web
- Social network

**Relazioni:**

- Lista giornalisti della testata
- Testate collegate

**Dati pubblicitari:**

- Concessionario pubblicità
- Indirizzo concessione pubblicità

**Note:**

- Note personali dell'utente

### 5.2 Tipo di Media

Categorie disponibili:

- Agenzia stampa
- Carta stampata
- Online
- Radio
- TV

### 5.3 Contatti Redazione

- Contatti generici di redazione (email generale, centralino)
- Elenco dettagliato giornalisti con contatti individuali

---

## 6. Gestione Liste

### 6.1 Creazione Liste

**Modalità di creazione:**

1. **Da zero con filtri manuali**

   - Applicazione filtri combinati
   - Visualizzazione risultati
   - Selezione giornalisti

2. **Con assistenza AI (chat in linguaggio naturale)**

   - Descrizione criteri in linguaggio naturale
   - AI genera la lista secondo i criteri espressi
   - Coesistenza con sistema filtri tradizionale

3. **Da liste precedenti**

   - Riutilizzo completo di liste esistenti
   - Riutilizzo parziale (selezione giornalisti da liste esistenti)

4. **Duplicazione**
   - Possibilità di duplicare liste esistenti come base per nuove liste

### 6.2 Modifica Liste

**Operazioni possibili:**

- Aggiunta singola di giornalisti
- Aggiunta multipla di giornalisti
- Rimozione di giornalisti
- Modifica manuale in qualsiasi momento

**Tracciamento:**

- Data ultima modifica della lista
- Autore/creatore della lista

**Cronologia:**

- Non viene mantenuta cronologia completa delle modifiche
- Non viene tracciato chi ha modificato (solo chi ha creato)

### 6.3 Salvataggio e Organizzazione

**Attributi lista:**

- Nome obbligatorio
- Descrizione/note opzionali
- Data creazione
- Autore

**Struttura organizzativa:**

- Tutte le liste allo stesso livello (no cartelle)
- No sistema di tag/etichette (da valutare in futuro)

### 6.4 Condivisione e Visibilità

**Livello amministratore:**

- Può creare liste visibili a tutti o private
- Può creare liste modificabili o in sola lettura
- Ha accesso a tutte le liste

**Livello utente:**

- Non può creare liste completamente private (visibili solo a lui)
- Da decidere: se può creare liste che altri non possono modificare
- Vede le liste condivise dall'admin e dai colleghi (secondo permessi)

**Condivisione esterna:**

- Non prevista tramite link
- Solo tramite export

### 6.5 Cancellazione

- Le liste eliminate sono cancellate definitivamente
- Nessun cestino o recupero possibile
- Richiesta attenzione all'utente prima della cancellazione

### 6.6 Limiti

- Nessun limite al numero di giornalisti per lista

---

## 7. Import/Export Liste

### 7.1 Import

**Formato:**

- File CSV

**Processo:**

- Caricamento file CSV
- Mapping colonne CSV con campi database
- Importazione dati

**Requisiti:**

- Nessun campo obbligatorio
- Migliore corrispondenza possibile tra colonne CSV e struttura dati
- Dati importati rimangono privati (non arricchiscono database comune)

**Gestione duplicati:**

- Alert per potenziali duplicati durante import

### 7.2 Export

**Formato:**

- Excel

**Contenuto:**

- Lista completa con tutti i dati dei giornalisti selezionati

---

## 8. Gestione Comunicati

### 8.1 Creazione Comunicato

**Modalità:**

1. **Editor interno**

   - Editor HTML per formattazione
   - Standard minimo: capacità di costruire layout email
   - Supporto per testo formattato, immagini, link

2. **Caricamento esterno**
   - Upload file (es. PDF)

**Componenti comunicato:**

- Titolo del comunicato
- Corpo del messaggio (HTML)
- Media kit (allegati)

### 8.2 Media Kit e Allegati

**Tipologie supportate:**

- PDF
- Immagini
- Altri file

**Gestione:**

- Nessun limite di dimensione (da valutare)
- Possibilità di riutilizzare allegati da comunicati precedenti
- Libreria media centralizzata (da valutare implementazione)

### 8.3 Template

**Disponibilità:**

- Template preimpostati disponibili
- Template personalizzabili dall'utente/organizzazione

### 8.4 Personalizzazione e Branding

**Firma email:**

- Personalizzabile per utente o per organizzazione
- Inclusione logo
- Scelta colori
- Scelta font
- Layout firma customizzabile

**Oggetto email:**

- Campo separato dal titolo del comunicato
- Possibilità di usare titolo o creare oggetto diverso
- Tipicamente coincidono ma deve esserci flessibilità

### 8.5 Gestione Bozze

**Salvataggio:**

- Comunicati salvabili come bozze
- Ripresi e modificati in qualsiasi momento

**Eliminazione:**

- Solo le bozze possono essere eliminate
- Comunicati inviati non eliminabili (restano in storico)

### 8.6 Duplicazione

- Possibilità di duplicare comunicati esistenti come punto di partenza
- Utile per comunicati simili o ricorrenti

### 8.7 Versioni Multiple

**Personalizzazione avanzata:**

- Creazione di versioni diverse dello stesso comunicato
- Per target/liste diverse
- Personalizzazione messaggi per singoli destinatari o gruppi
- Funzionalità distinta dalla semplice duplicazione

### 8.8 Anteprima

**Funzionalità:**

- Anteprima multi-device (desktop/mobile)
- Visualizzazione prima dell'invio
- Verifica layout e formattazione

---

## 9. Invio Comunicati (Spedizioni)

### 9.1 Terminologia

**Importante:** Distinzione tra:

- **Comunicato**: il contenuto del messaggio
- **Spedizione/Invio**: l'atto di inviare il comunicato a una lista

### 9.2 Configurazione Invio

**Parametri obbligatori:**

- Lista destinatari
- Comunicato da inviare
- Oggetto email
- Indirizzo mittente

**Mittente:**

- Personalizzabile dall'utente
- Può essere qualsiasi indirizzo
- Le risposte arrivano all'indirizzo impostato come mittente

**Reply-to:**

- Coincide con il mittente
- Risposte dei giornalisti arrivano all'indirizzo mittente

### 9.3 Schermata di Riepilogo/Conferma

Prima dell'invio definitivo:

- Visualizzazione lista destinatari completa
- Oggetto email
- Mittente
- Anteprima comunicato
- Conferma esplicita richiesta

### 9.4 Test Invio

**Funzionalità:**

- Invio di test prima della spedizione definitiva
- A se stessi o a indirizzi specifici
- Verifica deliverability e formattazione

### 9.5 Modalità di Invio

**Tramite piattaforma (consigliato):**

- Sistema anti-spam integrato
- Maggiore garanzia di deliverability
- Nessun rischio di finire in spam
- Tracking completo

**Tramite account personale:**

- Possibile ma non consigliato per liste numerose
- Maggior rischio spam

### 9.6 Programmazione Invio

**Scheduling:**

- Possibilità di programmare data e ora specifica
- Spedizioni programmate modificabili prima dell'esecuzione
- Spedizioni programmate cancellabili prima dell'esecuzione

**Notifica:**

- Notifica quando spedizione programmata viene eseguita con successo

### 9.7 Processo di Invio

**Caratteristiche:**

- Invio a liste numerose (es. 2000 giornalisti) avviene nel tempo
- Non istantaneo per grandi quantità
- Notifica al completamento dell'invio

**Interruzione:**

- Non è possibile interrompere un invio in corso (versione iniziale)

### 9.8 Gestione Errori

**Monitoraggio:**

- Tracking indirizzi che non hanno ricevuto l'email
- Report errori di invio

**Notifica errori:**

- Utente riceve report con:
  - Indirizzi falliti
  - Motivo del fallimento (bounce)
  - Riepilogo invio

---

## 10. Statistiche e Tracking

### 10.1 Metriche Disponibili

**Metriche principali:**

- Aperture email
- Click sui link nel comunicato
- Bounce rate (email non consegnate)
- Unsubscribe (quando possibile)
- Tempo di lettura (quando possibile)

### 10.2 Livello di Dettaglio

**Per singola spedizione:**

- Statistiche dettagliate per ogni invio
- Visualizzazione giornalista per giornalista
- Timeline delle interazioni

**Nota importante:**

- Statistiche disponibili solo per singola spedizione
- Non esiste vista aggregata/comparativa (versione iniziale)
- Non è possibile confrontare performance di spedizioni diverse

### 10.3 Export Statistiche

- Non previsto nella versione iniziale

### 10.4 Storico Contatti Giornalista

**Nella scheda giornalista:**

- Numero di comunicati inviati a quel giornalista
- Numero di articoli scritti basati su comunicati ricevuti
- Indice di "friendliness" (quanto è reattivo ai comunicati)
- Informazione strategica per l'ufficio stampa

---

## 11. Progetti e Cliente Ospite

### 11.1 Struttura Progetto

**Un progetto contiene:**

- Lista di comunicati inviati
- Rassegna stampa associata
- Articoli risultanti dai comunicati

**Scopo:**

- Rendicontazione attività ufficio stampa
- Visibilità per il cliente finale
- Dimostrazione ROI delle attività PR

### 11.2 Durata Progetti

- Progetti aperti (nessuna durata predefinita)
- Non vincolati a periodi specifici

### 11.3 Rassegna Stampa

**Composizione:**

- Articoli scritti da giornalisti che hanno ricevuto il comunicato
- Link agli articoli
- Data pubblicazione
- Autore articolo

**Inserimento articoli:**

- **Automatico**: da piattaforma di rassegna stampa integrata
- **Manuale**: inserimento diretto da parte dell'utente

**Matching automatico:**

- Sistema riconosce articoli correlati a comunicati (da approfondire meccanismo)
- Possibili criteri: citazioni, link, timing, analisi contenuto

### 11.4 Accesso Ospite

**Visualizzazione:**

- Solo progetti assegnati specificamente all'ospite
- Lista comunicati del progetto
- Rassegna stampa completa

**Reportistica per ospite:**

- Comunicato X → Articoli risultanti (1, 2, 3, 4, 5...)
- Per ogni articolo: data, autore, link
- Metriche semplici: numero articoli, non reach/sentiment/valore pubblicitario equivalente

**Limitazioni:**

- Solo visualizzazione (sola lettura)
- Nessun commento o interazione
- Nessuna approvazione/rifiuto

---

## 12. Sistema To-Do

### 12.1 Funzionalità Base

**Creazione:**

- Utenti possono creare task personali
- Descrizione del to-do
- Data di scadenza (opzionale)

**Visualizzazioni:**

1. **Lista**: elenco semplice dei to-do
2. **Agenda/Calendario**: to-do organizzati per data
   - Non funziona come calendario tradizionale
   - Visualizzazione a calendario per vedere distribuzione temporale to-do

### 12.2 Collegamenti

**Associazione:**

- To-do collegabili a progetti specifici
- Non collegabili a liste o comunicati (versione iniziale)

### 12.3 Stati

**Stati disponibili:**

- Da fare
- Fatto/Completato

**Nota:** Non previsto stato "in corso"

### 12.4 Assegnazione

**Possibilità:**

- To-do assegnabili ad altri utenti dell'organizzazione
- Non solo personali

**Visibilità:**

- Ogni utente vede solo i propri to-do
- Admin non vede to-do di tutti (da rivalutare se admin può assegnare)

### 12.5 Notifiche

- Nessuna notifica/reminder per scadenze to-do (versione iniziale)

### 12.6 Utilizzo per Onboarding

**Idea per nuovo utente:**

- Schermata iniziale con pochi elementi (nessuna mail, lista, progetto)
- To-do preimpostati con primi step per utilizzare la piattaforma
- Guida contestuale attraverso task da completare
- Visualizzazione a calendario per pianificare apprendimento

---

## 13. Integrazione Intelligenza Artificiale

### 13.1 Creazione Liste con AI

**Modalità conversazionale:**

- Chat simile a ChatGPT
- Descrizione criteri in linguaggio naturale
- AI genera lista secondo i criteri espressi

**Esempio:**

- "Crea una lista di giornalisti che scrivono di tecnologia per testate nazionali con focus su intelligenza artificiale"
- AI interpreta e applica filtri automaticamente

**Coesistenza:**

- Sistema AI coesiste con filtri manuali
- Utente sceglie modalità preferita

### 13.2 Assistenza Creazione Comunicato

**Funzionalità:**

- AI può aiutare nella scrittura del comunicato
- Suggerimenti di contenuto
- Ottimizzazione testo

**Implementazione:** da definire

### 13.3 Suggerimenti Proattivi

**AI suggerisce giornalisti:**

- Analizza liste create dall'utente
- Identifica nuovi giornalisti aggiunti al database
- Suggerisce giornalisti corrispondenti ai criteri delle liste esistenti
- Utile perché database si aggiorna continuamente

**AI impara dalle scelte (da valutare):**

- Possibile apprendimento da pattern dell'utente
- "Vedo che selezioni spesso giornalisti di questo tipo..."
- Implementazione da definire

### 13.4 Timing Ottimale (da valutare)

**Suggerimento orario invio:**

- Basato su dati storici di apertura
- Identificazione momento migliore per inviare comunicato
- Funzionalità interessante da approfondire

---

## 14. Sistema Notifiche

### 14.1 Tipologie Notifiche

**Notifiche in-app:**

**Spedizioni:**

- Spedizione completata con successo
- Spedizione programmata eseguita
- Errori durante spedizione

**Database:**

- Nuovi giornalisti aggiunti
- Giornalisti esistenti modificati/aggiornati
- (Possibili) suggerimenti AI su nuovi contatti rilevanti

**Priorità notifiche:**

- Focus su eventi importanti
- Spedizioni completate: priorità alta
- Aggiornamenti database: informativo

### 14.2 Canali

**In-app:**

- Notifiche principali
- Centro notifiche interno

**Email:**

- Non previsto nella versione iniziale (da valutare)

---

## 15. Privacy, Sicurezza e Compliance

### 15.1 GDPR

**Diritti giornalisti:**

- Richiesta cancellazione dati dal database
- Opt-out da comunicazioni
- Gestione consensi

**Opt-out:**

- Giornalisti possono richiedere di non ricevere più comunicati
- Può essere specifico per organizzazione
- Sistema deve gestire liste di esclusione

### 15.2 Log Attività

**Tracking per compliance:**

- Log di tutte le attività rilevanti
- Invii effettuati
- Accessi al sistema
- Modifiche significative

**Retention:**

- Conservazione dati per fini di compliance
- Audit trail completo

### 15.3 Sicurezza Account

**Autenticazione:**

- Email e password
- No autenticazione a due fattori (versione iniziale)

**Gestione password:**

- Creazione iniziale da admin
- Cambio password da utente

---

## 16. Documentazione e Supporto

### 16.1 Sezione Aiuto

**Contenuto:**

- FAQ integrate nell'applicazione
- Casi d'uso comuni
- Guide passo-passo
- Risoluzione problemi tipici

### 16.2 Onboarding

**Primo accesso:**

- Schermata semplificata (pochi elementi se nuovo utente)
- Possibile uso di to-do preimpostati per guidare l'apprendimento
- Alternative da valutare con il designer

**Tutorial:**

- Non previsti tutorial invasivi/modali
- Preferenza per apprendimento contestuale
- Documentazione accessibile quando necessaria

---

## 17. Aspetti Tecnici

### 17.1 Stack Tecnologico

**Backend:**

- PHP
- Framework: Laravel

**Frontend:**

- Angular

**Database:**

- Da definire con team di sviluppo

### 17.2 Architettura

**Tipo applicazione:**

- Web application
- Responsive design

### 17.3 Responsive e Multi-Device

**Desktop:**

- Funzionalità complete
- Interfaccia ottimizzata per workflow complessi

**Mobile/Tablet:**

- Sotto un certo breakpoint (es. 500px)
- Funzionalità limitata a:
  - Ricerca singolo giornalista
  - Ricerca singola testata
  - Consultazione dati

**Funzionalità solo desktop:**

- Creazione mailing list con filtri
- Utilizzo AI per creazione liste
- Invio comunicati
- Creazione comunicati
- Gestione progetti complessi

### 17.4 Performance

**Aspettative:**

- Più veloce è meglio (standard web application moderne)
- Ricerche: responsive
- Filtri: tempi ragionevoli anche con query complesse
- Caricamento pagine: snappy

### 17.5 Browser Support

- Da definire (browser moderni standard)

---

## 18. Integrazione con Piattaforma Rassegna Stampa

### 18.1 Natura Integrazione

**Sistemi separati:**

- Piattaforma ufficio stampa (MediaContacts)
- Piattaforma rassegna stampa (sistema esterno)

**Connessione:**

- Integrazione API tra i due sistemi
- Dati sincronizzati

### 18.2 Sincronizzazione

**Modalità:**

- Tempo reale
- Nessuna sincronizzazione periodica manuale
- Utente non deve fare nulla

**Visualizzazione:**

- Utente accede a pagina rassegna stampa
- Dati aggiornati automaticamente
- Trasparenza totale per l'utente

### 18.3 Dati Condivisi

**Da rassegna stampa a MediaContacts:**

- Articoli scritti dai giornalisti
- Contenuto articoli per word cloud
- Matching articoli-comunicati (quando rilevati)
- Timeline pubblicazioni

---

## 19. Elementi Brand

### 19.1 Nome Progetto

**Nome in codice:** MediaContacts

### 19.2 Identità Visiva

**Elementi definiti:**

- Logo (già esistente)
- Colore accento (già definito)

**Elementi liberi:**

- Palette colori completa
- Typography
- Stile visivo generale
- Iconografia

**Nota:** Massima libertà al designer su scelte non vincolate

## 20. Considerazioni per il Design

### 20.1 Approccio alle Specifiche

**Filosofia:**

- Questo documento definisce **cosa** deve fare il prodotto
- Non prescrive **come** implementare le funzionalità nell'interfaccia
- Libertà totale al designer su:
  - Architettura informativa
  - Layout e composizione pagine
  - Navigazione e gerarchia
  - Pattern di interazione
  - Dashboard e visualizzazioni dati
  - Microinterazioni

### 20.2 Funzionalità vs. Implementazione

**Esempi di decisioni delegate al designer:**

- Presenza/assenza di barra di ricerca globale
- Organizzazione sezioni/aree principali dell'applicazione
- Dashboard iniziale e cosa mostrare all'accesso
- Modalità di visualizzazione risultati durante filtri in tempo reale
- Posizionamento e priorità delle azioni frequenti
- Sistema di navigazione tra sezioni

### 20.3 Complessità da Gestire

**Sfide principali per il design:**

1. **Ricchezza dati**: molte informazioni per giornalista/testata/lista
2. **Filtri multipli combinabili**: interfaccia filtri avanzati ma usabile
3. **Doppia modalità**: filtri tradizionali + AI chat
4. **Multi-ruolo**: differenze tra admin/utente/ospite
5. **Workflow lunghi**: dalla ricerca giornalisti all'invio comunicato
6. **Statistiche dettagliate**: presentazione dati tracking in modo chiaro

### 20.4 Focus su Usabilità

**Considerazioni importanti:**

- Target: professionisti con vari livelli di competenza tecnica
- Dimensioni uffici stampa: da 1 a 50 persone (tipicamente 2-4)
- Uso quotidiano intensivo
- Necessità di velocità nelle operazioni frequenti
- Importanza di non commettere errori (es. invii sbagliati)

---

## 21. Flussi Utente Principali

### 21.1 Flusso Creazione e Invio Comunicato (Completo)

1. Ricerca/filtro giornalisti nel database
2. Selezione giornalisti
3. Creazione lista (salvataggio)
4. Creazione comunicato (editor o upload)
5. Configurazione invio (mittente, oggetto)
6. Anteprima e verifica
7. Test invio (opzionale)
8. Conferma e invio definitivo (o programmazione)
9. Monitoraggio invio in corso
10. Visualizzazione statistiche

### 21.2 Flusso Riutilizzo Liste Esistenti

1. Accesso a liste salvate
2. Selezione lista
3. (Opzionale) Modifica/integrazione lista
4. Creazione comunicato
5. Prosegue come flusso principale da punto 5

### 21.3 Flusso con AI

1. Accesso modalità chat AI
2. Descrizione criteri in linguaggio naturale
3. AI genera lista
4. Revisione e modifica lista (se necessario)
5. Salvataggio lista
6. Prosegue come flusso principale da punto 4

### 21.4 Flusso Import Lista

1. Caricamento file CSV
2. Mapping campi
3. Verifica duplicati
4. Importazione
5. Revisione lista importata
6. Salvataggio
7. Prosegue come flusso principale da punto 4

### 21.5 Flusso Cliente Ospite

1. Accesso piattaforma (credenziali limitate)
2. Visualizzazione progetti assegnati
3. Selezione progetto
4. Consultazione comunicati inviati
5. Visualizzazione rassegna stampa
6. (Solo lettura, nessuna azione possibile)

---

## 22. Scenari d'Uso Tipici

### 22.1 Lancio Nuovo Prodotto

**Attività:**

- Ricerca giornalisti settore specifico + generalisti economia
- Filtro per testate nazionali + principali verticali di settore
- Creazione lista mirata (~50-200 giornalisti)
- Preparazione comunicato con media kit (immagini prodotto, scheda tecnica)
- Invio programmato per orario strategico
- Monitoraggio aperture nelle prime ore
- Rassegna stampa articoli usciti
- Report al cliente tramite progetto

### 22.2 Comunicato Ricorrente (es. Risultati Trimestrali)

**Attività:**

- Riutilizzo lista "Finanza ed Economia" già salvata
- Verifica aggiornamenti giornalisti
- AI suggerisce nuovi contatti rilevanti aggiunti
- Duplicazione template comunicato trimestre precedente
- Aggiornamento dati e cifre
- Invio a lista consolidata
- Confronto performance con trimestri precedenti (funzione futura)

### 22.3 Gestione Multi-Cliente (Agenzia)

**Attività:**

- Progetti separati per ogni cliente
- Liste personalizzate per settore cliente
- Comunicati brandizzati per ogni cliente
- Accesso ospite per ogni cliente al proprio progetto
- Rassegna stampa dedicata per cliente
- To-do per gestire timeline multiple clienti

### 22.4 Aggiornamento Lista Obsoleta

**Attività:**

- Apertura lista creata 6 mesi fa
- Sistema evidenzia giornalisti con dati aggiornati di recente
- Revisione contatti (alcuni cambiati testata/ruolo)
- Rimozione contatti non più rilevanti
- AI suggerisce nuovi giornalisti corrispondenti ai criteri originali
- Salvataggio lista aggiornata
- Nuovo invio a lista refreshed

---

## 23. Metriche di Successo (Suggerite)

### 23.1 Metriche Prodotto

**Adozione:**

- Numero utenti attivi giornalmente/settimanalmente
- Tempo medio sessione
- Frequenza di ritorno

**Utilizzo funzionalità:**

- % invii tramite piattaforma vs export
- Numero medio liste per utente
- Riutilizzo liste esistenti vs creazione nuove
- Adozione modalità AI vs filtri manuali

**Performance:**

- Tempo medio creazione lista
- Tempo medio da creazione lista a invio
- Tasso di completamento workflow completo

**Qualità:**

- Tasso apertura comunicati inviati
- Tasso risposta giornalisti
- Numero articoli risultanti per comunicato

### 23.2 Metriche Business

**Valore per utente:**

- Numero comunicati inviati per mese
- Dimensione media liste
- ROI comunicazione (articoli ottenuti vs effort)

**Soddisfazione:**

- Net Promoter Score
- Retention rate
- Feedback qualitativi

---

## 24. Roadmap Funzionalità Future (Possibili)

### 24.1 Breve Termine

**Già menzionate come "da valutare":**

- Sistema di tag per liste
- Confronto performance tra spedizioni diverse
- Export statistiche (PDF, Excel)
- Libreria media centralizzata
- Autenticazione a due fattori
- Dashboard aggregata con metriche complessive
- Flusso approvazione comunicati
- Interruzione invio in corso

### 24.2 Medio Termine

**Intelligenza Artificiale avanzata:**

- Apprendimento automatico da comportamento utente
- Suggerimenti timing ottimale invio
- Analisi sentiment rassegna stampa
- Generazione automatica comunicati

**Collaborazione:**

- Commenti su liste/comunicati
- Workflow approvazione multi-livello
- Notifiche push mobile
- Chat interna team

**Analytics:**

- Dashboard comparativa
- Report automatici
- Previsioni performance
- Benchmark settoriali

### 24.3 Lungo Termine

**Espansione internazionale:**

- Supporto multilingua (Francia, Spagna)
- Database giornalisti europei completo
- Comunicati multilingua

**Integrazioni:**

- CRM aziendali
- Social media management
- Piattaforme email marketing
- Sistemi di calendar scheduling

**Automazione:**

- Invii automatici trigger-based
- Follow-up automatici
- Segmentazione dinamica liste
- A/B testing comunicati

---

## 25. Glossario Termini

**Comunicato**: Il contenuto del messaggio stampa (testo, immagini, allegati)

**Spedizione/Invio**: L'atto di inviare un comunicato a una lista di destinatari

**Lista**: Insieme di contatti giornalisti selezionati per una spedizione

**Media Kit**: Insieme di allegati (immagini, PDF, documenti) associati a un comunicato

**Progetto**: Contenitore che raggruppa comunicati e rassegna stampa per un cliente/campagna

**Rassegna Stampa**: Collezione di articoli pubblicati in risposta a comunicati

**Word Cloud**: Visualizzazione grafica delle parole più frequenti negli articoli di un giornalista

**Bounce**: Email non consegnata (indirizzo errato, casella piena, ecc.)

**Friendliness**: Indice di reattività di un giornalista ai comunicati ricevuti

**Ospite**: Tipo di utente con accesso limitato (solo visualizzazione progetti)

**To-Do**: Task/attività da completare

**Filtri**: Criteri di selezione per ricerca giornalisti nel database

**MVP**: Minimum Viable Product - versione iniziale con funzionalità core
