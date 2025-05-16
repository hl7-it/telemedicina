Alias: $loinc = http://loinc.org
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

//TODO: fix the div of all Resources

Instance: ReportRilevazioneTelemonitoraggio
InstanceOf: Bundle
Description: "Esempio di Report Rilevazione di Telemonitoraggio"
Usage: #example
* type = #document
* identifier.system = "http://example.com/fhir/identifiers/bundle"
* identifier.value = "bundle-8798"
* timestamp = "2024-06-10T08:00:00Z"
* entry[0].fullUrl = "Composition/comp12345"
* entry[=].resource = comp12345
* entry[+].fullUrl = "Patient/patient123"
* entry[=].resource = patient123
* entry[+].fullUrl = "CarePlan/careplan12345"
* entry[=].resource = careplan12345
* entry[+].fullUrl = "Observation/observation12345"
* entry[=].resource = observation12345

Instance: comp12345
InstanceOf: CompositionReportRilevazioneTM
Usage: #inline
* type = $loinc#64296-7 
* subject = Reference(patient123)
* status = #active
* date = "2024-06-10T08:00:00Z"
* author = Reference(practitionerRole123) "Dr. Rossi"
* attester[legalAuthenticator].mode = #legal
* attester[legalAuthenticator].time = "2023-02-25T12:45:00+01:00"
* attester[legalAuthenticator].party = Reference(practitionerRole123)
* title = "Report Rilevazione Telemonitoraggio"
* section.title = "Piano di Cura"
* section.code = $loinc#18776-5
* section.entry = Reference(careplan12345)

Instance: patient123
InstanceOf: PatientTelemedicina
Usage: #inline
* identifier.system = "http://hl7.it/sid/codiceFiscale"
* identifier.value = "RSSMRA80A01H501Z"
* name[0].family = "Rossi"
* name[0].given[0] = "Mario"

Instance: careplan12345
InstanceOf: CarePlanReportRilevazioneTM
Usage: #inline
* identifier.system = "http://example.com/telemonitoraggio"
* identifier.value = "Piano12345"
* subject = Reference(patient123)
* status = #active
* intent = #order
* title = "Piano di Telemonitoraggio per Ipertensione"
* description = "Monitoraggio giornaliero della pressione arteriosa del paziente tramite dispositivi remoti."
* period.start = "2024-06-10T08:00:00Z"
* activity.detail.status = #scheduled
* activity.detail.code = $loinc#85354-9 "Blood Pressure Panel"
* activity.outcomeReference = Reference(observation12345)


Instance: observation12345
InstanceOf: ObservationTelemedicina
Usage: #inline
* identifier.system = "http://example.com/telemonitoraggio"
* identifier.value = "Obs12345"
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code = $loinc#85354-9 "Blood Pressure Panel"
* subject = Reference(patient123)
* effectiveDateTime = "2024-06-10T08:00:00Z"
* component[0].code = $loinc#8480-6 "Systolic Blood Pressure"
* component[=].valueQuantity = 120 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic Blood Pressure"
* component[=].valueQuantity = 80 'mm[Hg]' "mmHg"

Instance: practitionerRole123
InstanceOf: PractitionerRoleTelemedicina
Title: "Ruolo Dr. Rossi - Telemonitoraggio"
Description: "Ruolo del practitioner Dr. Rossi per attività di telemonitoraggio"
Usage: #inline
* practitioner = Reference(practitioner456)
* code[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/practitioner-role"
* code[0].coding[0].code = #doctor
* code[0].coding[0].display = "Doctor"
* specialty[0].coding[0].system = "https://agenas.gov.it/fhir/CodeSystem/csspecialityPractitionerRole"
* specialty[0].coding[0].code = #07
* specialty[0].coding[0].display = "Cardiochirurgia"
* telecom[0].system = #email
* telecom[0].value = "telemonitoraggio@ospedale.it"
* telecom[0].use = #work
* active = true

Instance: practitioner456
InstanceOf: PractitionerTelemedicina
Title: "Medico di Telemonitoraggio - Dr. Rossi"
Description: "Esempio di risorsa Practitioner in un contesto di telemonitoraggio"
Usage: #inline
* identifier[0].system = "http://example.com/practitioner-id"
* identifier[0].value = "dr-rossi-456"
* name[0].family = "Rossi"
* name[0].given[0] = "Mario"
* telecom[0].system = #phone
* telecom[0].value = "+390612345678"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "mario.rossi@ospedale.it"
* telecom[1].use = #work
* address[0].line[0] = "Via della Salute, 10"
* address[0].city = "Roma"
* address[0].postalCode = "00100"
* address[0].country = "IT"
* gender = #male
* birthDate = "1970-05-20"
