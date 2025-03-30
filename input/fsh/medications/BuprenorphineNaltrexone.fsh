// Buprenorphine/Naltrexone Medication
Instance: MedicationBuprenorphineNaltrexone
InstanceOf: Medication
Title: "Medication - Buprenorphine/Naltrexone"
Description: "Buprenorphine/Naltrexone 8mg/2mg SL tablet"
* code.coding[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* code.coding[0].code = #352364
* code.coding[0].display = "Buprenorphine / Naltrexone"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #425741009
* code.coding[1].display = "Buprenorphine + Naltrexone"
* form.coding.system = "http://snomed.info/sct"
* form.coding.code = #385055001
* form.coding.display = "Tablet dose form"

// Buprenorphine/Naltrexone MedicationRequest
Instance: CarlFredericksonBuprenorphineNaltrexone
InstanceOf: MedicationRequest
Title: "MedicationRequest - Buprenorphine/Naltrexone"
Description: "Buprenorphine/Naltrexone 16mg/4mg (2x 8mg/2mg SL tablets) SL daily prescription for Carl Frederickson"
* status = #active
* intent = #order
* subject.reference = "Patient/CarlFrederickson"
* medicationReference.reference = "Medication/MedicationBuprenorphineNaltrexone"
* dosageInstruction.text = "16mg/4mg (2x 8mg/2mg SL tablets) SL daily"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.code = #37839007
* dosageInstruction.route.coding.display = "Sublingual route"
* dosageInstruction.doseAndRate.doseQuantity.value = 2
* dosageInstruction.doseAndRate.doseQuantity.unit = "tablet"
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.doseQuantity.code = #tablet
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "Community"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActCode#42CFRPart2 "42 CFR Part 2 restrictions apply" 