Alias: $loinc = http://loinc.org
Alias: $sct = http://snomed.info/sct
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category

Instance: TesserinoDispositivi
InstanceOf: Bundle
Description: "Esempio di Tesserino Dispositivi di Telemonitoraggio"
Usage: #example
* type = #document
* identifier.system = "http://example.com/fhir/identifiers/bundle"
* identifier.value = "bundle-890"
* timestamp = "2024-06-10T08:00:00Z"
* entry[0].fullUrl = "Composition/composition12345"
* entry[=].resource = composition12345
* entry[+].fullUrl = "Device/device12345"
* entry[=].resource = device12345
* entry[+].fullUrl = "Patient/patient1234"
* entry[=].resource = patient1234
* entry[+].fullUrl = "Condition/condition12345"
* entry[=].resource = condition12345
* entry[+].fullUrl = "Organization/organization12345"
* entry[=].resource = organization12345
* entry[+].fullUrl = "DeviceUseStatement/deviceUseStatement12345"
* entry[=].resource = deviceUseStatement12345

Instance: organization12345
InstanceOf: OrganizationTelemedicina
Usage: #inline
* name = "Healthcare Institution"
* address.line = "123 Main St"
* address.city = "Rome"
* address.district = "Central District"
* address.postalCode = "00100"
* address.country = "IT"
* telecom.system = #phone
* telecom.value = "+39 06 1234567"
* telecom.use = #work

Instance: composition12345
InstanceOf: CompositionTesserinoDispositiviTM
Usage: #inline
* status = #final
* date = "2024-06-10T08:00:00Z"
* type = $loinc#104972-5 "Medical device summary information Narrative"
* subject = Reference(patient1234)
* author = Reference(organization12345) "Healthcare Institution"
* attester[legalAuthenticator].mode = #legal
* attester[legalAuthenticator].time = "2023-02-25T12:45:00+01:00"
* attester[legalAuthenticator].party = Reference(practitionerRole123)
* title = "Tesserino Dispositivi"
* section[0].title = "Informazioni Device"
* section[=].code = $loinc#104972-5 "Medical device summary information Narrative"
* section[=].entry = Reference(deviceUseStatement12345)

Instance: device12345
InstanceOf: DeviceTelemedicinaTesserino
Usage: #inline
* extension[0].url = "https://agenas.gov.it/fhir/StructureDefinition/device-connectivity"
* extension[=].valueCode = #bluetooth
* extension[+].url = "https://agenas.gov.it/fhir/StructureDefinition/device-power-source"
* extension[=].valueCode = #battery
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/device-implantStatus"
* extension[=].valueCode = #functional
* manufacturer = "Fabbricante XYZ"
* deviceName.name = "Pacemaker"
* deviceName.type = #user-friendly-name
* modelNumber = "PM-2024"
* type = $sct#414701000000109 "Pacemaker"
* udiCarrier.carrierHRF = "09876543210987654321"
* udiCarrier.deviceIdentifier = "1234567890"
* serialNumber = "PM2024098765"

Instance: patient1234
InstanceOf: PatientTelemedicina
Usage: #inline
* identifier.system = "http://example.com/codice-fiscale"
* identifier.value = "RSSMRA80A01H501Z"
* name.family = "Rossi"
* name.given = "Marco"
* birthDate = "1980-01-01"
* gender = #male
* address.city = "Rome"
* address.district = "Central District"

Instance: condition12345
InstanceOf: ConditionTelemedicina
Usage: #inline
* clinicalStatus = $condition-clinical#active "Active"
* code = $sct#414701000000109 "Heart failure"
* category = $condition-category#problem-list-item "Problem List Item"
* subject = Reference(patient1234)

Instance: deviceUseStatement12345
InstanceOf: DeviceUseStatementTelemedicina
Usage: #inline
* status = #active
* subject = Reference(patient1234)
* device = Reference(device12345)
* timingDateTime = "2024-01-15"
* reasonReference = Reference(condition12345)
