Logical: PianoTelemonitoraggioTeleriabilitazioneTeleassistenza
Id: PianoTelemonitoraggioTeleriabilitazioneTeleassistenza
Title: "Piano di Telemonitoraggio/Teleriabilitazione e Teleassistenza"
Description: "Modello logico per la raccolta dei dati relativi a un piano di telemonitoraggio/teleriabilitazione e teleassistenza"
* ^status = #active
* ^kind = #logical
* ^abstract = false
* ^type = "http://example.org/fhir/StructureDefinition/PianoTelemonitoraggioTeleriabilitazioneTeleassistenza"

* header 1..1 BackboneElement "Intestazione del Documento"
  * assistito 1..1 BackboneElement "Dati anagrafici dell’assistito"
    * codiceAssistito 1..1 string "Codice identificativo dell’assistito"
    * sessoAssistito 1..1 code "Sesso dell’assistito"
    * nomeAssistito 1..1 string "Nome assistito"
    * cognomeAssistito 1..1 string "Cognome assistito"
    * dataNascitaAssistito 1..1 date "Data di nascita dell’assistito"
    * aziendaSanitariaResidenza 0..1 string "Azienda sanitaria di residenza del paziente"
    * aziendaSanitariaAssistenza 0..1 string "Azienda sanitaria di assistenza del paziente"
    * codiceComuneResidenzaAssistito 0..1 string "Codice comune di residenza assistito"
    * provinciaResidenzaAssistito 0..1 string "Provincia di residenza assistito"
    * regioneResidenzaAssistito 0..1 string "Regione di residenza assistito"
    * medicoCurante 0..1 BackboneElement "Medico Curante"
      * nome 1..1 string "Nome del medico curante"
      * cognome 1..1 string "Cognome del medico curante"
      * codiceFiscale 1..1 string "Codice fiscale del medico curante"    
  * attester 1..1 BackboneElement "Informazioni sul medico firmatario"
    * medicoFirmatario 0..1 BackboneElement "Medico firmatario"
      * nome 1..1 string "Nome del medico firmatario"
      * cognome 1..1 string "Cognome del medico firmatario"
      * codiceFiscale 1..1 string "Codice fiscale medico firmatario"
      * branca 0..1 string "Branca specialistica ambulatoriale"
    * strutturaMedicoFirmatario 0..1 BackboneElement "Struttura medico firmatario"
      * codiceDescrizione 1..1 string "Codice e descrizione struttura medico firmatario"
      * tipoStruttura 1..1 string "Tipologia struttura medico firmatario (ASL/AO ecc.)"
      * presidio 0..1 string "Presidio di appartenenza del medico firmatario"
    * dataFirma 1..1 dateTime "Data di firma del documento"
* body 1..1 BackboneElement "Corpo del Documento"
  * pianoDiCura 1..1 BackboneElement "Informazioni riguardo il piano di cura di telemonitoraggio"
    * tipoPiano 1..1 string "Tipologia di piano (telemonitoraggio, teleriabilitazione, teleassistenza, ecc.)"
    * codicePiano 1..1 string "Codice identificativo del piano"
    * medicoPrescrittore 0..1 BackboneElement "Medico prescrittore"
      * nome 1..1 string "Nome del medico prescrittore"
      * cognome 1..1 string "Cognome del medico prescrittore"
      * codiceFiscale 1..1 string "Codice fiscale del medico prescrittore"
    * strutturaMedicoPrescrittore 0..1 BackboneElement "Struttura medico prescrittore"
      * codiceDescrizione 1..1 string "Codice e descrizione Struttura medico prescrittore"
      * tipoStruttura 1..1 string "Tipo struttura medico prescrittore (ASL/AO ecc.)"
    * pianoAttivita 0..* BackboneElement "Descrizione delle attività da svolgere nel Piano di Telemonitoraggio"
      * tipologiaAttivita 1..1 string "Tipologia di attività (teleassistenza, teleriabilitazione neurologica, telemonitoraggio cardiologico ecc.)"
      * codiceAttivita 1..1 string "Codice attività"
      * descrizioneAttivita 1..1 string "Descrizione attività"
      * numeroCicli 1..1 integer "Numero di cicli di attività previsti"
      * durataCiclo 1..1 string "Durata del singolo ciclo"
      * numeroAttivitaPerCiclo 1..1 integer "Numero di attività per ciclo"
      * frequenza 1..1 string "Frequenza (es. 1 ril/die, 2 ril/die, 2 ril/sett, 'incontinuo' se telemonitoraggio continuo)"
      * orario 1..1 string "Fascia oraria di svolgimento dell’attività"
      * durataPianoAttivita 1..1 string "Durata prevista del piano delle attività (max 1 anno)"
      * parametri 0..* BackboneElement "Elenco dei parametri rilevati durante il monitoraggio"
        * tipoRilevazione 0..1 string "Tipo di rilevazione (intermediato, ciclo chiuso)"
        * sogliaAllarme 0..1 string "Soglia di allarme configurata sullo strumento"
        * regole 0..1 string "Testo descrittivo delle regole di comportamento in violazione delle soglie"
        * codiceUDI 0..1 string "Codice UDI del Device utilizzato per la rilevazione dei parametri"
    * primaProgrammazione 1..1 boolean "Indica se si tratta della prima stesura del piano"
    * riprogrammazione 1..1 boolean "Indica se si tratta di una riprogrammazione"
  * diagnosi 1..1 BackboneElement "Codice/i e descrizione/i delle diagnosi (Codifica ICD9-CM)"
    * codiceDiagnosi 0..1 code "Codice della diagnosi"
    * descrizioneDiagnosi 0..1 code "Descrizione della diagnosi"

Mapping: PianoTM2Fhir				
Id: fhir				
Title: "Modello Logico Piano di Telemonitoraggio - FHIR R4 Map"				
Source: PianoTelemonitoraggioTeleriabilitazioneTeleassistenza				
Target: "hl7.org/fhir/r4"
* -> "Bundle.conformsTo('https://agenas.gov.it/fhir/StructureDefinition/BundlePianoTM')"
* header -> "Composition.conformsTo('https://agenas.gov.it/fhir/StructureDefinition/CompositionPianoTM')"

* header.assistito.codiceAssistito -> "Composition.subject.identifier.value"
* header.assistito.nomeAssistito -> "Composition.subject.resolve().name.given[0]"
* header.assistito.cognomeAssistito -> "Composition.subject.resolve().name.family"
* header.assistito.dataNascitaAssistito -> "Composition.subject.resolve().birthDate"
* header.assistito.sessoAssistito -> "Composition.subject.resolve().gender"
* header.assistito.aziendaSanitariaResidenza -> "Composition.subject.resolve().extension('http://example.org/fhir/StructureDefinition/aziendaSanitariaResidenza')"
* header.assistito.aziendaSanitariaAssistenza -> "Composition.subject.resolve().extension('http://example.org/fhir/StructureDefinition/aziendaSanitariaAssistenza')"
* header.assistito.codiceComuneResidenzaAssistito -> "Composition.subject.resolve().address.extension('http://example.org/fhir/StructureDefinition/comuneResidenza').value"
* header.assistito.provinciaResidenzaAssistito -> "Composition.subject.resolve().address.extension('http://example.org/fhir/StructureDefinition/provinciaResidenza').value"
* header.assistito.regioneResidenzaAssistito -> "Composition.subject.resolve().address.extension('http://example.org/fhir/StructureDefinition/regioneResidenza').value"

* header.assistito.medicoCurante.nome -> "Practitioner.name.given[0]"
* header.assistito.medicoCurante.cognome -> "Practitioner.name.family"
* header.assistito.medicoCurante.codiceFiscale -> "Practitioner.identifier.where(system='http://hl7.it/sid/codiceFiscale').value"

* header.attester.medicoFirmatario.nome -> "Composition.attester[legalAuthenticator].party.resolve().name.given[0]"
* header.attester.medicoFirmatario.cognome -> "Composition.attester[legalAuthenticator].party.resolve().name.family"
* header.attester.medicoFirmatario.codiceFiscale -> "Composition.attester[legalAuthenticator].party.resolve().identifier.where(system='cf').value"
* header.attester.medicoFirmatario.branca -> "Composition.attester[legalAuthenticator].party.resolve().extension('http://example.org/fhir/StructureDefinition/brancaSpecialistica').valueCodeableConcept"

* header.attester.strutturaMedicoFirmatario.codiceDescrizione -> "Organization.name"
* header.attester.strutturaMedicoFirmatario.tipoStruttura -> "Organization.type.coding[0].code"
* header.attester.strutturaMedicoFirmatario.presidio -> "Organization.partOf.display"
* header.attester.dataFirma -> "Composition.attester.time"

* body.pianoDiCura.tipoPiano -> "Composition.section[pianoDiCura].entry.resolve().category"
* body.pianoDiCura.codicePiano -> "Composition.section[pianoDiCura].entry.resolve().identifier.value"

* body.pianoDiCura.medicoPrescrittore.nome -> "CarePlan.author.resolve().name.given[0]"
* body.pianoDiCura.medicoPrescrittore.cognome -> "CarePlan.author.resolve()..name.family"
* body.pianoDiCura.medicoPrescrittore.codiceFiscale -> "CarePlan.author.resolve().identifier.where(system='http://hl7.it/sid/codiceFiscale').value"

* body.pianoDiCura.strutturaMedicoPrescrittore.codiceDescrizione -> "Organization.name"
* body.pianoDiCura.strutturaMedicoPrescrittore.tipoStruttura -> "Organization.type.coding[0].code"

* body.pianoDiCura.pianoAttivita -> "CarePlan.activity.detail"
* body.pianoDiCura.pianoAttivita.tipologiaAttivita -> "CarePlan.activity.detail.code"
* body.pianoDiCura.pianoAttivita.codiceAttivita -> "CarePlan.activity.detail.instantiatesCanonical.resolve().code"
* body.pianoDiCura.pianoAttivita.descrizioneAttivita -> "CarePlan.activity.detail.instantiatesCanonical.resolve().description"
* body.pianoDiCura.pianoAttivita.numeroCicli -> "CarePlan.activity.detail.instantiatesCanonical.resolve().timing.count"
* body.pianoDiCura.pianoAttivita.durataCiclo -> "CarePlan.activity.detail.instantiatesCanonical.resolve().timing.duration"
* body.pianoDiCura.pianoAttivita.numeroAttivitaPerCiclo -> "CarePlan.activity.detail.instantiatesCanonical.resolve().timing.frequency"
* body.pianoDiCura.pianoAttivita.frequenza -> "CarePlan.activity.detail.scheduledTiming.repeat.frequency"
* body.pianoDiCura.pianoAttivita.orario -> "CarePlan.activity.detail.instantiatesCanonical.resolve().timing.timeOfDay"
* body.pianoDiCura.pianoAttivita.durataPianoAttivita -> "CarePlan.period.duration"

* body.pianoDiCura.pianoAttivita.parametri.tipoRilevazione -> "ActivityDefinition.observationRequirement.resolve().category"
* body.pianoDiCura.pianoAttivita.parametri.sogliaAllarme -> "ActivityDefinition.observationRequirement.resolve().qualifiedInterval.range"
* body.pianoDiCura.pianoAttivita.parametri.regole -> "ActivityDefinition.observationRequirement.resolve().qualifiedInterval.condition"
* body.pianoDiCura.pianoAttivita.parametri.codiceUDI -> "CarePlan.activity.detail.performer.resolve().udiCarrier.deviceIdentifier"

* body.pianoDiCura.primaProgrammazione -> "CarePlan.note"
* body.pianoDiCura.riprogrammazione -> "CarePlan.note"

* body.diagnosi -> "Composition.section[diagnosi].entry.resolve().code"
* body.diagnosi.codiceDiagnosi -> "Composition.section[diagnosi].entry.resolve().code"
* body.diagnosi.descrizioneDiagnosi -> "Composition.section[diagnosi].entry.resolve().description"
