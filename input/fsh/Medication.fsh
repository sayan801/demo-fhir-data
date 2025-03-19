// Medication and MedicationRequest Resources for Carl Frederickson

// Captopril Medication
Instance: MedicationCaptopril
InstanceOf: Medication
Title: "Medication - Captopril"
Description: "Captopril 12.5mg medication"
* code.coding[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* code.coding[0].code = #315560
* code.coding[0].display = "Captopril 12.5 MG Oral Tablet"
* form.coding.system = "http://snomed.info/sct"
* form.coding.code = #385055001
* form.coding.display = "Tablet dose form"

// Captopril MedicationRequest
Instance: CarlFredericksonCaptopril
InstanceOf: MedicationRequest
Title: "MedicationRequest - Captopril"
Description: "Captopril 12.5mg PO BID prescription for Carl Frederickson"
* status = #active
* intent = #order
* subject.reference = "Patient/CarlFrederickson"
* medicationReference.reference = "Medication/MedicationCaptopril"
* dosageInstruction.text = "12.5mg PO BID"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.code = #26643006
* dosageInstruction.route.coding.display = "Oral route"
* dosageInstruction.doseAndRate.doseQuantity.value = 12.5
* dosageInstruction.doseAndRate.doseQuantity.unit = "mg"
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.doseQuantity.code = #mg
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "Community"

// Fluoxetine Medication
Instance: MedicationFluoxetine
InstanceOf: Medication
Title: "Medication - Fluoxetine"
Description: "Fluoxetine 20mg medication"
* code.coding[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* code.coding[0].code = #315952
* code.coding[0].display = "Fluoxetine 20 MG Oral Capsule"
* form.coding.system = "http://snomed.info/sct"
* form.coding.code = #385055001
* form.coding.display = "Capsule dose form"

// Fluoxetine MedicationRequest
Instance: CarlFredericksonFluoxetine
InstanceOf: MedicationRequest
Title: "MedicationRequest - Fluoxetine"
Description: "Fluoxetine 20mg daily prescription for Carl Frederickson"
* status = #active
* intent = #order
* subject.reference = "Patient/CarlFrederickson"
* medicationReference.reference = "Medication/MedicationFluoxetine"
* dosageInstruction.text = "20mg daily"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.code = #26643006
* dosageInstruction.route.coding.display = "Oral route"
* dosageInstruction.doseAndRate.doseQuantity.value = 20
* dosageInstruction.doseAndRate.doseQuantity.unit = "mg"
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.doseQuantity.code = #mg
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "Community"

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