// Fluoxetine Medication Request
Instance: CarlFredericksonFluoxetine
InstanceOf: SensitiveMedicationRequestProfile
Usage: #example
Title: "MedicationRequest - Fluoxetine"
Description: "Fluoxetine prescription for Carl Frederickson"

* identifier[0].system = "http://example.org/fhir/medicationrequest-identifier"
* identifier[0].value = "RX-FLUOXETINE-45602"

* status = #active
* intent = #order
* subject.reference = "urn:uuid:CarlFrederickson"
* medicationReference.reference = "urn:uuid:MedicationFluoxetine"
* dosageInstruction.text = "20mg PO daily"
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