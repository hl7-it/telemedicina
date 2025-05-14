Profile: BundlePianoTM
Parent: Bundle
Id: BundlePianoTM
Description: "Profilo del Bundle utilizzato nel contesto del Piano di Telemonitoraggio"
* ^url = "https://agenas.gov.it/fhir/StructureDefinition/BundlePianoTM"
* ^status = #draft
* type = #document (exactly)
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #open
* entry contains
    composition 1..1 and
    carePlan 0..* and
    patient 1..1 and
    practitionerRole 0..* and
    organization 0..* and
    practitioner 0..* and
    device 0..* and
    activityDefinition 0..* and
    observationDefinition 0..*
* entry[composition].resource only CompositionPianoTM
* entry[carePlan].resource only CarePlanPianoDiCuraTelemonitoraggio
* entry[patient].resource only PatientTelemedicina
* entry[patient].resource.address 1..
* entry[patient].resource.address ^slicing.discriminator.type = #value
* entry[patient].resource.address ^slicing.discriminator.path = "use"
* entry[patient].resource.address ^slicing.rules = #open
* entry[practitionerRole].resource only PractitionerRoleTelemedicina
* entry[organization].resource only OrganizationTelemedicina
* entry[practitioner].resource only PractitionerTelemedicina
* entry[practitioner].resource.identifier ^slicing.discriminator.type = #pattern
* entry[practitioner].resource.identifier ^slicing.discriminator.path = "$this"
* entry[practitioner].resource.identifier ^slicing.description = "Slice based on the identifier pattern"
* entry[practitioner].resource.identifier ^slicing.rules = #open
* entry[device].resource only DeviceTelemedicina
* entry[activityDefinition].resource only ActivityDefinitionPianoTM
* entry[observationDefinition].resource only ObservationDefinitionPianoTM