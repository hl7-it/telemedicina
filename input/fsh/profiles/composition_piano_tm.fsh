Alias: $loinc = http://loinc.org
//Alias: $CarePlan_PianoDiCura_TM = https://agenas.gov.it/fhir/StructureDefinition/CarePlan_PianoDiCura_TM
//Alias: $Observation = https://agenas.gov.it/fhir/StructureDefinition/Observation

Profile: CompositionPianoTM
Parent: CompositionTelemedicina
Id: CompositionPianoTM
Description: "Profilo della Composition utilizzata nel contesto del Telemonitoraggio"
* ^status = #draft
* type ^definition = "Campo che specifica il particolare tipo di Composition."
* subject ^definition = "Il soggetto a cui si riferisce la Composition, ad esempio un paziente sottoposto a monitoraggio remoto"
* author ^definition = "Identifica chi è responsabile delle informazioni nella Composition, non necessariamente chi le ha inserite."
* title = "Piano di Telemonitoraggio" (exactly)
* title ^definition = "Titolo human-readable ufficiale per la Composition."

//Section

// Aggiungere slice Attester, legalAuthenticator

* section
  * ^slicing.discriminator[+].type = #exists
  * ^slicing.discriminator[=].path = "$this.section"
  * ^slicing.discriminator[+].type = #exists
  * ^slicing.discriminator[=].path = "$this.entry"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
* section contains
    pianoDiCura 0..1 and
    diagnosi 0..1
* section[pianoDiCura] ^sliceName = "pianoDiCura"
* section[pianoDiCura].code = $loinc#18776-5 (exactly)
* section[pianoDiCura].entry only Reference(CarePlanPianoDiCuraTelemonitoraggio)
* section[diagnosi] ^sliceName = "diagnosi"
* section[diagnosi].code = $loinc#29548-5 (exactly)
* section[diagnosi].entry only Reference(ObservationPianoTelemonitoraggio)