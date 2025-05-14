Alias: $ServiceRequest = https://agenas.gov.it/fhir/StructureDefinition/ServiceRequestTelemedicina
Alias: $extension_serviceRequest_codeCodingType = https://agenas.gov.it/fhir/StructureDefinition/extension_serviceRequest_codeCodingType
Alias: $catalogoNazionalePrestazioni = https://terminology.agenas.gov.it/ValueSet/catalogoNazionalePrestazioni
Alias: $catalogoRegionalePrestazioni = https://terminology.agenas.gov.it/ValueSet/catalogoRegionalePrestazioni

Profile: ServiceRequestTV
Parent: ServiceRequest
Id: ServiceRequestTV
Description: "Profilo  della ServiceRequest utilizzata per il referto di Televisita"
* ^status = #draft
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "extension.value"
* code.coding ^slicing.rules = #open
* code.coding contains
    codiceNomenclatoreTariffario 0..1 and
    codiceCatalogoRegionalePrestazione 0..1
* code.coding[codiceNomenclatoreTariffario] from $catalogoNazionalePrestazioni (preferred)
* code.coding[codiceNomenclatoreTariffario].extension 1..
* code.coding[codiceNomenclatoreTariffario].extension contains $extension_serviceRequest_codeCodingType named tipologiaCodificaServizio 1..1
* code.coding[codiceNomenclatoreTariffario].extension[tipologiaCodificaServizio] ^isModifier = false
* code.coding[codiceNomenclatoreTariffario].extension[tipologiaCodificaServizio].value[x] = "codiceNomenclatoreTariffario" (exactly)
* code.coding[codiceNomenclatoreTariffario].system ^short = "Identifica il sistema di terminologia"
* code.coding[codiceNomenclatoreTariffario].system ^definition = "Identificazione del sistema terminologico che definisce il significato del codice. https://terminology.agenas.gov.it/CodeSystem/catalogoNazionalePrestazioni"
* code.coding[codiceNomenclatoreTariffario].code ^short = "Codice valido per il sistema terminologico di riferimento"
* code.coding[codiceNomenclatoreTariffario].code ^definition = "Un codice valido per il sistema terminologico di riferimento, i cui valori sono definiti nel CodeSystem dedicato"
* code.coding[codiceCatalogoRegionalePrestazione] from $catalogoRegionalePrestazioni (preferred)
* code.coding[codiceCatalogoRegionalePrestazione].extension 1..
* code.coding[codiceCatalogoRegionalePrestazione].extension contains $extension_serviceRequest_codeCodingType named tipologiaCodificaServizio 1..1
* code.coding[codiceCatalogoRegionalePrestazione].extension[tipologiaCodificaServizio] ^isModifier = false
* code.coding[codiceCatalogoRegionalePrestazione].extension[tipologiaCodificaServizio].value[x] = "codiceCatalogoRegionalePrestazione" (exactly)
* code.coding[codiceCatalogoRegionalePrestazione].system ^short = "Identifica il sistema di terminologia"
* code.coding[codiceCatalogoRegionalePrestazione].system ^definition = "Identificazione del sistema terminologico che definisce il significato del codice. https://terminology.agenas.gov.it/CodeSystem/catalogoRegionalePrestazioni"
* code.coding[codiceCatalogoRegionalePrestazione].code ^short = "Codice valido per il sistema terminologico di riferimento"
* code.coding[codiceCatalogoRegionalePrestazione].code ^definition = "Un codice valido per il sistema terminologico di riferimento, i cui valori sono definiti nel CodeSystem dedicato"