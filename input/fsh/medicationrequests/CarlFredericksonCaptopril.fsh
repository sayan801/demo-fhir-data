// Captopril MedicationRequest
Instance: CarlFredericksonCaptopril
InstanceOf: MedicationRequest
Title: "MedicationRequest - Captopril"
Description: "Captopril 12.5mg PO BID prescription for Carl Frederickson"

* identifier[0].system = "http://example.org/fhir/medicationrequest-identifier"
* identifier[0].value = "RX-CAPTOPRIL-45603"

* status = #active
* intent = #order
* subject.reference = "urn:uuid:CarlFrederickson"
* medicationReference.reference = "urn:uuid:MedicationCaptopril"
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