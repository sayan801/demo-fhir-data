// Buprenorphine/Naltrexone Medication Request
Instance: CarlFredericksonBuprenorphineNaltrexone
InstanceOf: SensitiveMedicationRequestProfile
Usage: #example
Title: "MedicationRequest - Buprenorphine/Naltrexone"
Description: "Buprenorphine/Naltrexone prescription for Carl Frederickson"

* identifier[0].system = "http://example.org/fhir/medicationrequest-identifier"
* identifier[0].value = "RX-BUPNALTREX-45601"

* status = #active
* intent = #order
* subject.reference = "urn:uuid:CarlFrederickson"
* medicationReference.reference = "urn:uuid:MedicationBuprenorphineNaltrexone"
* dosageInstruction.text = "8mg/2mg SL daily"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.code = #37839007
* dosageInstruction.route.coding.display = "Sublingual route"
* dosageInstruction.doseAndRate.doseQuantity.value = 1
* dosageInstruction.doseAndRate.doseQuantity.unit = "tablet"
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.doseQuantity.code = #{tablet}