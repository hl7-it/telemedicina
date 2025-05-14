Profile: BundleRelazioneFinaleTM
Parent: Bundle
Id: BundleRelazioneFinaleTM
Description: "Profilo del Bundle utilizzato nel contesto della Relazione Finale di Telemonitoraggio"
* ^status = #draft
* type = #document (exactly)
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #open

* entry contains
    composition 1..1 and
    patient 1..1 and
    carePlan 0..* and
    practitionerRole 0..* and
    practitioner 0..* and
    organization 0..* and
    medicationRequest 0..* and
    encounter 0..* and
    observation 0..* and
    allergyIntolerance 0..* and
    procedure 0..* and
    device 0..* and
    location 0..* and
    specimen 0..*

* entry[composition].resource only CompositionRelazioneFinaleTelemonitoraggio
* entry[patient].resource only PatientTelemedicina
* entry[patient].resource.address 1..

* entry[carePlan].resource only CarePlanPianoDiCuraTelemonitoraggio
* entry[practitionerRole].resource only PractitionerRoleTelemedicina
* entry[practitioner].resource only PractitionerTelemedicina
* entry[practitioner].resource.identifier ^slicing.discriminator.type = #pattern
* entry[practitioner].resource.identifier ^slicing.discriminator.path = "$this"
* entry[practitioner].resource.identifier ^slicing.description = "Slice based on the identifier pattern"
* entry[practitioner].resource.identifier ^slicing.rules = #open

* entry[organization].resource only OrganizationTelemedicina
* entry[medicationRequest].resource only MedicationRequest
* entry[encounter].resource only Encounter
* entry[observation].resource only ObservationTelemedicina
* entry[allergyIntolerance].resource only AllergyIntoleranceTelemedicina
* entry[procedure].resource only ProcedureTelemedicina
* entry[device].resource only DeviceTelemedicina
* entry[location].resource only Location
* entry[specimen].resource only Specimen
