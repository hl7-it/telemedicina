Alias: $loinc = http://loinc.org

Profile: CompositionRelazioneFinaleTelemonitoraggio
Parent: CompositionTelemedicina
Id: CompositionRelazioneFinaleTelemonitoraggio
Description: "Profilo della Composition utilizzata nel contesto della Relazione Finale di Telemonitoraggio"
* ^status = #draft
* title = "Relazione Finale di Telemonitoraggio" (exactly)
* type = $loinc#53576-5 (exactly)
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section contains
    pianoDiCura 1..1 and
    terapiaFarmacologica 0..1 and
    questitoDiagnostico 0..1 and
    allergie 0..1 and
    terapiaFarmacologicaConsigliata 0..1 and
    precedentiEsamiEseguiti 0..1 and
    prestazioni 0..1 and
    confrontoPrecedentiEsamiEseguiti 0..1 and
    diagnosi 0..1 and
    suggerimentiPerMedicoPrescrittore 0..1 and
    accertamentiControlliConsigliati 0..1 and
    referto 0..1
* section[pianoDiCura] ^sliceName = "pianoDiCura"
* section[pianoDiCura].code = $loinc#18776-5 (exactly)
* section[pianoDiCura].entry only Reference(CarePlanRelazioneFinaleTM)
* section[terapiaFarmacologica] ^sliceName = "terapiaFarmacologica"
* section[terapiaFarmacologica].code = $loinc#10160-0 (exactly)
* section[terapiaFarmacologica].entry only Reference(MedicationRequestTelemedicina)
* section[questitoDiagnostico] ^sliceName = "questitoDiagnostico"
* section[questitoDiagnostico].code = $loinc#29299-5 (exactly)
* section[questitoDiagnostico].entry only Reference(ObservationTelemedicina)
* section[allergie] ^sliceName = "allergie" 
* section[allergie].code = $loinc#48765-2 (exactly)
* section[allergie].entry only Reference(AllergyIntoleranceTelemedicina)
* section[terapiaFarmacologicaConsigliata] ^sliceName = "terapiaFarmacologicaConsigliata"
* section[terapiaFarmacologicaConsigliata].code = $loinc#93341-6 (exactly)
* section[terapiaFarmacologicaConsigliata].entry only Reference(MedicationRequestTelemedicina)
* section[precedentiEsamiEseguiti] ^sliceName = "precedentiEsamiEseguiti"
* section[precedentiEsamiEseguiti].code = $loinc#30954-2 (exactly)
* section[precedentiEsamiEseguiti].entry only Reference(ObservationTelemedicina)
* section[prestazioni] ^sliceName = "prestazioni"
* section[prestazioni].code = $loinc#62387-6 (exactly)
* section[prestazioni].entry only Reference(EncounterTelemedicina)
* section[confrontoPrecedentiEsamiEseguiti] ^sliceName = "confrontoPrecedentiEsamiEseguiti"
* section[confrontoPrecedentiEsamiEseguiti].code = $loinc#93126-1 (exactly)
* section[confrontoPrecedentiEsamiEseguiti].entry only Reference(ObservationTelemedicina)
* section[diagnosi] ^sliceName = "diagnosi"
* section[diagnosi].code = $loinc#29548-5 (exactly)
* section[diagnosi].entry only Reference(ObservationTelemedicina)
* section[suggerimentiPerMedicoPrescrittore] ^sliceName = "suggerimentiPerMedicoPrescrittore"
* section[suggerimentiPerMedicoPrescrittore].code = $loinc#62385-0 (exactly)
* section[suggerimentiPerMedicoPrescrittore].entry only Reference(ObservationTelemedicina)
* section[accertamentiControlliConsigliati] ^sliceName = "accertamentiControlliConsigliati"
* section[accertamentiControlliConsigliati].code = $loinc#80615-8 (exactly)
* section[accertamentiControlliConsigliati].entry only Reference(ObservationTelemedicina)
* section[referto] ^sliceName = "referto"
* section[referto].code = $loinc#47045-0 (exactly)
* section[referto].entry only Reference(ObservationTelemedicina)