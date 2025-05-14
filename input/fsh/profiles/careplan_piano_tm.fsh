Profile: CarePlanPianoDiCuraTelemonitoraggio
Parent: CarePlan
Id: CarePlanPianoDiCuraTelemonitoraggio
Description: "Profilo del CarePlan utilizzato nel contesto del Telemonitoraggio"
* ^url = "https://agenas.gov.it/fhir/StructureDefinition/CarePlanPianoDiCuraTelemonitoraggio"
* ^status = #draft
* identifier ^short = "Codice identificativo del Piano"
* identifier ^definition = "Identificativi aziendali assegnati a questo piano di cura dall'esecutore o da altri sistemi, che rimangono costanti man mano che la risorsa viene aggiornata e propagata da server a server."
* category = csTipologiaPiano#01 "Piano di Telemonitoraggio"
* category ^short = "Tipologia di Piano"
* category ^definition = "Identifica il \"tipo\" di piano per supportare la differenziazione tra più piani coesistenti."
* subject only Reference(PatientTelemedicina)
* subject ^short = "Per chi è destinato il piano di cura"
* subject ^definition = "Identifica il paziente la cui cura prevista è descritta dal piano."
* period ^short = "Durata prevista del piano delle attività"
* period ^definition = "Durata prevista del piano delle attività."
* author only Reference(PractitionerRoleTelemedicina)
* author ^short = "Autore del piano di cura del paziente"
* author ^definition = "Autore del piano di cura del paziente. Quando popolato l'autore è il responsabile del piano di cura."
* activity ^short = "Azione da attuare come parte del piano"
* activity ^definition = "Identifica un'azione pianificata da attuare come parte del piano."
* activity.detail.code ^short = "Tipologia di Attività" 
* activity.detail.code from TipologiaAttivitaPianoDiTelemonitoraggio (example) //TODO add things from excel
//* activity.reference only Reference(ServiceRequestTelemedicina)
* activity.detail.instantiatesCanonical only Canonical(ActivityDefinitionPianoTM)
* activity.detail.performer only Reference(DeviceTelemedicina)
* activity.detail.performer ^short = "Dispositivo per il telemonitoraggio"
* activity.detail.performer ^definition = "Dispositivo per il telemonitoraggio che raccoglie e trasmette dati clinici in tempo reale, supportando il monitoraggio remoto del paziente."