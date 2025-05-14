Logical: ReportRilevazioniTelemonitoraggio
Id: ReportRilevazioniTelemonitoraggio
Title: "Report Rilevazioni Telemonitoraggio"
Description: "Modello logico per la registrazione delle rilevazioni effettuate secondo un piano di telemonitoraggio"
* ^status = #active
* ^kind = #logical
* ^abstract = false
* ^type = "http://example.org/fhir/StructureDefinition/ReportRilevazioniTelemonitoraggio"

* header 1..1 BackboneElement "Intestazione del Documento"
  * assistito 1..1 BackboneElement "Dati anagrafici dell’assistito"
    * codiceAssistito 1..1 string "Codice identificativo dell’assistito"
* body 1..1 BackboneElement "Corpo del Documento"
  * pianoDiCura 1..1 BackboneElement "Informazioni riguardo il piano di cura di telemonitoraggio"
    * tipoPiano 1..1 string "Tipologia di piano (telemonitoraggio, teleriabilitazione, teleassistenza, ecc.)"
    * codicePiano 1..1 string "Codice identificativo del piano"
    * pianoAttivita 0..* BackboneElement "Descrizione delle attività da svolgere nel Piano di Telemonitoraggio"
      * tipologiaAttivita 1..1 string "Tipologia di attività (teleassistenza, teleriabilitazione neurologica, telemonitoraggio cardiologico ecc.)"
      * rilevazioni 0..* BackboneElement "Elenco dei parametri rilevati durante il monitoraggio"
        * codiceParametro 1..1 code "Codice del parametro rilevato"
        * valoreParametro 1..1 string "Valore del parametro rilevato"
        * dataRilevazione 1..1 date "Data della prima rilevazione del parametro"

Mapping: ReportRilevazioniTM2Fhir				
Id: fhir				
Title: "Modello Logico Report Rilevazione di Telemonitoraggio - FHIR R4 Map"				
Source: ReportRilevazioniTelemonitoraggio				
Target: "hl7.org/fhir/r4"
* -> "Bundle.conformsTo('https://agenas.gov.it/fhir/StructureDefinition/BundleReportRilevazioniTM')"
* header -> "Composition.conformsTo('https://agenas.gov.it/fhir/StructureDefinition/CompositionReportRilevazioneTM')"

* header.assistito.codiceAssistito -> "Composition.subject.identifier.value"

// * header.attester.medicoFirmatario.nome -> "Composition.attester[legalAuthenticator].party.resolve().name.given[0]"
// * header.attester.medicoFirmatario.cognome -> "Composition.attester[legalAuthenticator].party.resolve().name.family"
// * header.attester.medicoFirmatario.codiceFiscale -> "Composition.attester[legalAuthenticator].party.resolve().identifier.where(system='cf').value"
// * header.attester.medicoFirmatario.branca -> "Composition.attester[legalAuthenticator].party.resolve().extension('http://example.org/fhir/StructureDefinition/brancaSpecialistica').valueCodeableConcept"

// * header.attester.strutturaMedicoFirmatario.codiceDescrizione -> "Organization.name"
// * header.attester.strutturaMedicoFirmatario.tipoStruttura -> "Organization.type.coding[0].code"
// * header.attester.strutturaMedicoFirmatario.presidio -> "Organization.partOf.display"
// * header.attester.strutturaMedicoFirmatario.dataFirma -> "Composition.attester.time"

* body.pianoDiCura.tipoPiano -> "Composition.section[pianoDiCura].entry.resolve().category"
* body.pianoDiCura.codicePiano -> "Composition.section[pianoDiCura].entry.resolve().identifier.value"

* body.pianoDiCura.pianoAttivita -> "CarePlan.activity.detail"
* body.pianoDiCura.pianoAttivita.tipologiaAttivita -> "CarePlan.activity.detail.code"
* body.pianoDiCura.pianoAttivita.rilevazioni -> "Careplan.activity.outcomeReference.resolve()"
* body.pianoDiCura.pianoAttivita.rilevazioni.codiceParametro -> "Careplan.activity.outcomeReference.resolve().code"
* body.pianoDiCura.pianoAttivita.rilevazioni.valoreParametro -> "Careplan.activity.outcomeReference.resolve().value[x]"
* body.pianoDiCura.pianoAttivita.rilevazioni.dataRilevazione -> "Careplan.activity.outcomeReference.resolve().effective[x]"
