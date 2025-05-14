Alias: $loinc = http://loinc.org
Alias: $sct = http://snomed.info/sct
Alias: $icd-9-cm = http://hl7.org/fhir/sid/icd-9-cm

Instance: PianoTelemonitoraggio
InstanceOf: BundlePianoTM
Description: "Esempio di Piano di Telemonitoraggio"
Usage: #example
* type = #document
* identifier.system = "http://example.com/fhir/identifiers/bundle"
* identifier.value = "bundle-12345"
* timestamp = "2024-06-10T08:00:00Z"
* entry[0].fullUrl = "Composition/composition123456"
* entry[=].resource = composition123456
* entry[+].fullUrl = "PractitionerRole/practitionerrole12345"
* entry[=].resource = practitionerrole12345
* entry[+].fullUrl = "Organization/organization123456"
* entry[=].resource = organization123456
* entry[+].fullUrl = "CarePlan/careplan123456"
* entry[=].resource = careplan123456
* entry[+].fullUrl = "Patient/patient12345"
* entry[=].resource = patient12345
* entry[+].fullUrl = "Practitioner/practitioner12345"
* entry[=].resource = practitioner12345
* entry[+].fullUrl = "ActivityDefinition/activitydefinition12345"
* entry[=].resource = activitydefinition12345
* entry[+].fullUrl = "ObservationDefinition/observationdefinition12345"
* entry[=].resource = observationdefinition12345
* entry[+].fullUrl = "Device/device123456"
* entry[=].resource = device123456
* entry[+].fullUrl = "Observation/observation123456"
* entry[=].resource = observation123456

Instance: composition123456
InstanceOf: CompositionPianoTM
Usage: #inline
* status = #final
* type = $loinc#18776-5 "Plan of care note"
* date = "2024-06-10T08:00:00Z"
* title = "Piano di Telemonitoraggio"
* author = Reference(practitionerrole12345)
* attester[legalAuthenticator].mode = #legal
* attester[legalAuthenticator].time = "2023-02-25T12:45:00+01:00"
* attester[legalAuthenticator].party = Reference(practitionerrole12345)
* section[0].title = "diagnosi"
* section[=].entry = Reference(observation123456)
* section[+].title = "pianoDiCura"
* section[=].entry = Reference(careplan123456)
* subject = Reference(patient12345)

Instance: practitionerrole12345
InstanceOf: PractitionerRoleTelemedicina
Usage: #inline
* organization = Reference(organization123456)
* practitioner = Reference(practitioner12345)
* specialty = https://agenas.gov.it/fhir/CodeSystem/csspecialityPractitionerRole#01 "Allergologia"

Instance: organization123456
InstanceOf: OrganizationTelemedicina
Usage: #inline
* name = "FantasticaAzienda"

Instance: careplan123456
InstanceOf: CarePlanPianoDiCuraTelemonitoraggio
Usage: #inline
* status = #active
* intent = #proposal
* subject = Reference(patient12345)
* author = Reference(practitionerrole12345)
* activity.detail.status = #scheduled
* activity.detail.instantiatesCanonical = "ActivityDefinition/activitydefinition12345"
* activity.detail.performer = Reference(device123456)

Instance: patient12345
InstanceOf: PatientTelemedicina
Usage: #inline
* identifier.system = "http://hl7.it/sid/codiceFiscale"
* identifier.value = "RSSMRA80A01H501Z"
* name[0].family = "Rossi"
* name[0].given[0] = "Mario"

Instance: practitioner12345
InstanceOf: PractitionerTelemedicina
Usage: #inline
* name.given = "John"
* name.family = "Doe"

Instance: activitydefinition12345
InstanceOf: ActivityDefinitionPianoTM
Usage: #inline
* name = "Monitoraggio della pressione sanguigna"
* status = #active
* description = "Monitoraggio della pressione sanguigna"

Instance: observationdefinition12345
InstanceOf: ObservationDefinitionPianoTM
Usage: #inline
* code = $loinc#8867-4 "Blood Pressure"

Instance: device123456
InstanceOf: DeviceTelemedicina
Usage: #inline
* manufacturer = "Fabbricante XYZ"

Instance: observation123456
InstanceOf: ObservationTelemedicina
Usage: #inline
* status = #final
* code = $icd-9-cm#402 "Cardiopatia ipertensiva"