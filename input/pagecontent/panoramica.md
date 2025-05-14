<p>Questa pagina fa parte della guida all'implementazione per la profilazione di risorse basata su <a href="http://hl7.org/fhir/R4">FHIR R4</a>. Questa è l'attuale versione rilasciata. </p>

### Scopo

Lo scopo dell'Implementation Guide (IG) di Telemedicina è fornire un quadro normativo e tecnico per garantire l'interoperabilità e lo scambio sicuro di dati sanitari tra diversi sistemi, utilizzando il framework FHIR. Questa guida facilita la standardizzazione dei dati tra la Piattaforma di Telemedicina e i sistemi regionali e nazionali, promuovendo un flusso di informazioni efficace e conforme alle normative sanitarie. L'IG ha l’obiettivo di migliorare l’efficienza, la qualità dei servizi e la sicurezza dei pazienti attraverso l'integrazione dei sistemi sanitari.

<p>I profili raccolti sono stati sviluppati a partire da una serie di
<strong><em>casi d'uso</em></strong> applicati ai vari scenari individuati, atti a garantire l'interoperabilità tra i sistemi IRT e PNT.</p>


### Dettagli

<!-- 
<p>I <strong>Modelli Logici</strong>: che descrivono il contenuto atteso per le diverse classi informative (e.g. Paziente), indipendentemente dalla loro rappresentazione fisica. I modelli sono formalizzati come modelli logici FHIR, ma la loro implementazione potrebbe non essere realizzata necessariamente in FHIR</p>
-->

La piattaforma di telemedicina si basa su un'architettura che fa uso di vari strumenti per garantire l'interoperabilità e l'efficace gestione dei dati sanitari. In questo contesto, vengono definiti diversi concetti fondamentali che permettono di adattare le risorse FHIR alle necessità specifiche del settore sanitario, come la telemedicina. I seguenti concetti sono cruciali per il corretto utilizzo di FHIR:


- <p><strong>Profili</strong>: descrivono come rappresentare sotto forma di risorsa HL7 FHIR le informazioni incluse in un modello logico con determinati vincoli o estensioni. Sono stati costruiti anche i profili relativi alle risorse di tipo Bundle</p>
- <p><strong>Estensioni</strong>: descrivono come rappresentare informazioni aggiuntive non incluse nel corredo informativo base di una risorsa FHIR</p>
- <p><strong>Terminologie</strong>: definizione di sistemi di codifica (<a href="http://hl7.org/fhir/R4/codesystem.html"><em>Code System</em></a>) e liste di valori (<a href="http://hl7.org/fhir/R4/terminologies-valuesets.html"><em>Value Set</em></a>)</p>
- <p><strong>FHIR Paradigms</strong>: modalità con cui accedere alle interfacce definite</p>



### Struttura della guida

La guida alla piattaforma di telemedicina è strutturata in diverse sezioni chiave, ognuna delle quali fornisce informazioni fondamentali per l'implementazione e l'interoperabilità del sistema. Nello specifico le sezioni di maggior rilevanza sono:
- **Specifiche**: Descrivono i tipi di documenti trattati e forniscono schemi UML che rappresentano la struttura dei documenti in formato FHIR.
- **Artefatti**: Contengono profili delle risorse FHIR, esempi di istanze conformi ai profili, e definizioni di codesystem e valueset utilizzati per la standardizzazione dei dati.

Questa struttura consente di garantire un alto livello di interoperabilità e coerenza nelle informazioni scambiate tra i sistemi sanitari.

