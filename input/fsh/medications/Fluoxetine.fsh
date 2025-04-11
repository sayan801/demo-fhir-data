// Fluoxetine Medication and MedicationRequest
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