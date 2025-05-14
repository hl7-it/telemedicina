Profile: BundleRefertodiTelevisita
Parent: Bundle
Id: BundleRefertodiTelevisita
Title: "Bundle Referto di televisita"
Description: "Bundle FHIR document contenente il referto di televisita e tutte le risorse correlate"
* ^status = #draft
* type = #document (exactly)

* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #open

* entry contains
    composition 1..1 and
    patient 1..1 and
    serviceRequest 1..1 and
    appointment 1..1 and
    practitionerRole 0..* and
    practitioner 0..* and
    organization 0..* and
    observation 0..* and
    condition 0..* and
    medicationRequest 0..* and
    medicationStatement 0..* and
    allergyIntolerance 0..* and
    familyMemberHistory 0..* and
    encounter 0..* and
    procedure 0..* and
    device 0..*
* entry[composition].resource only CompositionRefertoTelevisita
* entry[patient].resource only PatientTelemedicina
* entry[serviceRequest].resource only ServiceRequestTV
* entry[appointment].resource only Appointment
* entry[practitionerRole].resource only PractitionerRoleTelemedicina
* entry[practitioner].resource only PractitionerTelemedicina
* entry[organization].resource only OrganizationTelemedicina
* entry[observation].resource only ObservationTelemedicina
* entry[condition].resource only Condition
* entry[medicationRequest].resource only MedicationRequestTelemedicina
* entry[medicationStatement].resource only MedicationStatement
* entry[allergyIntolerance].resource only AllergyIntoleranceTelemedicina
* entry[familyMemberHistory].resource only FamilyMemberHistory
* entry[encounter].resource only EncounterTelemedicina
* entry[procedure].resource only ProcedureTelemedicina
* entry[device].resource only DeviceTelemedicina
