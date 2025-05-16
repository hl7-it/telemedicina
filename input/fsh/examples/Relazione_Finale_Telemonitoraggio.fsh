Alias: $loinc = http://loinc.org

Instance: RelazioneFinaleTelemonitoraggio
InstanceOf: Bundle
Description: "Esempio di Relazione Finale di Telemonitoraggio"
Usage: #example
* type = #document
* entry[0].resource = composition678
* entry[+].resource = careplan123
* entry[+].resource = medrequest123
* entry[+].resource = encounter123
* entry[+].resource = observation123
* entry[+].resource = allergy123
* entry[+].resource = procedure123
* entry[+].resource = patient1234567

Instance: composition678
InstanceOf: CompositionRelazioneFinaleTelemonitoraggio
Usage: #inline
* status = #final
* type = $loinc#53576-5 
* title = "Relazione Finale di Telemonitoraggio"
* date = "2024-06-10T08:00:00Z"
* author = Reference(Practitioner/practitioner123)
* attester[legalAuthenticator].mode = #legal
* attester[legalAuthenticator].time = "2023-02-25T12:45:00+01:00"
* attester[legalAuthenticator].party = Reference(practitionerRole1234)
* attester.mode = #legal
* attester.time = "2024-06-10T08:00:00Z"
* attester.party = Reference(practitionerRole1234)
* subject = Reference(patient1234567)
* section[pianoDiCura].title = "pianoDiCura"
* section[pianoDiCura].entry[0] = Reference(careplan123)
* section[terapiaFarmacologica].title = "terapiaFarmacologica"
* section[terapiaFarmacologica].entry[0] = Reference(medrequest123)
* section[questitoDiagnostico].title = "questitoDiagnostico"
* section[questitoDiagnostico].entry[0] = Reference(observation123)
* section[allergie].title = "allergie"
* section[allergie].entry[0] = Reference(allergy123)
* section[precedentiEsamiEseguiti].title = "precedentiEsamiEseguiti"
* section[precedentiEsamiEseguiti].entry[0] = Reference(Observation/observation124)
* section[prestazioni].title = "prestazioni"
* section[prestazioni].entry[0] = Reference(Encounter/encounter124)
* section[confrontoPrecedentiEsamiEseguiti].title = "confrontoPrecedentiEsamiEseguiti"
* section[confrontoPrecedentiEsamiEseguiti].entry[0] = Reference(Observation/observation125)
* section[referto].title = "referto"
* section[referto].entry[0] = Reference(Observation/observation126)
* section[diagnosi].title = "diagnosi"
* section[diagnosi].entry[0] = Reference(Observation/observation127)
* section[suggerimentiPerMedicoPrescrittore].title = "suggerimentiPerMedicoPrescrittore"
* section[suggerimentiPerMedicoPrescrittore].entry[0] = Reference(Observation/observation128)
* section[accertamentiControlliConsigliati].title = "accertamentiControlliConsigliati"
* section[accertamentiControlliConsigliati].entry[0] = Reference(Observation/observation129)


Instance: careplan123
InstanceOf: CarePlanPianoDiCuraTelemonitoraggio
Usage: #inline
* status = #active
* intent = #order
* subject = Reference(patient1234567)

Instance: medrequest123
InstanceOf: MedicationRequestTelemedicina
Usage: #inline
* status = #active
* intent = #proposal
* medicationCodeableConcept.text = "Medication Name"
* subject = Reference(patient1234567)
* requester = Reference(practitioner4567)

Instance: encounter123
InstanceOf: EncounterTelemedicina
Usage: #inline
* status = #finished
* class.code = #ambulatory
* subject = Reference(patient1234567)

Instance: observation123
InstanceOf: ObservationTelemedicina
Usage: #inline
* status = #final
* code = #8867-4 "Heart rate"
* subject = Reference(patient1234567)

Instance: allergy123
InstanceOf: AllergyIntoleranceTelemedicina
Usage: #inline
* clinicalStatus.coding.code = #active
* code.text = "Allergy Type"
* patient = Reference(patient1234567)

Instance: procedure123
InstanceOf: ProcedureTelemedicina
Usage: #inline
* status = #completed
* code.text = "Procedure performed"
* subject = Reference(patient1234567)

Instance: patient1234567
InstanceOf: PatientTelemedicina
Usage: #inline
* identifier.system = "http://hl7.it/sid/codiceFiscale"
* identifier.value = "RSSMRA80A01H501Z"
* name.family = "Rossi"
* name.given = "Mario"
* gender = #male
* birthDate = "1970-01-01"
* address.city = "Roma"
* address.country = "IT"


Instance: practitionerRole1234
InstanceOf: PractitionerRoleTelemedicina
Title: "Ruolo Dr. Rossi - Telemonitoraggio"
Description: "Ruolo del practitioner Dr. Rossi per attività di telemonitoraggio"
Usage: #inline
* practitioner = Reference(practitioner4567)
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

Instance: practitioner4567
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