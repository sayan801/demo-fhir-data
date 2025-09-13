// Fluoxetine Medication Request
Instance: CarlFredericksonFluoxetine
InstanceOf: SensitiveMedicationRequestProfile
Usage: #example
Title: "MedicationRequest - Fluoxetine"
Description: "Fluoxetine prescription for Carl Frederickson"

* identifier[0].system = "http://example.com/demo/medicationrequest-identifier"
* identifier[0].value = "RX-FLUOXETINE-45602"

* status = #active
* intent = #order
* subject = Reference(CarlFrederickson)
* medicationCodeableConcept.coding[0] = http://www.nlm.nih.gov/research/umls/rxnorm#315952 "fluoxetine 20 MG"
* medicationCodeableConcept.text = "Fluoxetine 20 MG Oral Capsule"
* dosageInstruction.text = "20mg PO daily"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = http://snomed.info/sct#26643006 "Oral route"
* dosageInstruction.doseAndRate.doseQuantity.value = 20
* dosageInstruction.doseAndRate.doseQuantity.unit = "mg"
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.doseQuantity.code = #mg