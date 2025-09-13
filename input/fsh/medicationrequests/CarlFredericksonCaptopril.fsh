// Captopril MedicationRequest
Instance: CarlFredericksonCaptopril
InstanceOf: MedicationRequest
Title: "MedicationRequest - Captopril"
Description: "Captopril 12.5mg PO BID prescription for Carl Frederickson"

* identifier[0].system = "http://example.com/demo/medicationrequest-identifier"
* identifier[0].value = "RX-CAPTOPRIL-45603"

* status = #active
* intent = #order
* subject = Reference(CarlFrederickson)
* medicationCodeableConcept.coding[0] = http://www.nlm.nih.gov/research/umls/rxnorm#315560 "captopril 12.5 MG"
* medicationCodeableConcept.text = "Captopril 12.5 MG Oral Tablet"
* dosageInstruction.text = "12.5mg PO BID"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = http://snomed.info/sct#26643006 "Oral route"
* dosageInstruction.doseAndRate.doseQuantity.value = 12.5
* dosageInstruction.doseAndRate.doseQuantity.unit = "mg"
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.doseQuantity.code = #mg