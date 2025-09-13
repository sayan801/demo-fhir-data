// Buprenorphine/Naltrexone Medication Request
Instance: CarlFredericksonBuprenorphineNaltrexone
InstanceOf: SensitiveMedicationRequestProfile
Usage: #example
Title: "MedicationRequest - Buprenorphine/Naltrexone"
Description: "Buprenorphine/Naltrexone prescription for Carl Frederickson"

* identifier[0].system = "http://example.com/demo/medicationrequest-identifier"
* identifier[0].value = "RX-BUPNALTREX-45601"

* status = #active
* intent = #order
* subject = Reference(CarlFrederickson)
* medicationCodeableConcept.coding[0] = http://www.nlm.nih.gov/research/umls/rxnorm#352364 "buprenorphine / naloxone"
* medicationCodeableConcept.coding[1] = http://snomed.info/sct#425741009 "Product containing buprenorphine and naloxone (medicinal product)"
* medicationCodeableConcept.text = "Buprenorphine / Naltrexone"
* dosageInstruction.text = "8mg/2mg SL daily"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = http://snomed.info/sct#37839007 "Sublingual route"
* dosageInstruction.doseAndRate.doseQuantity.value = 1
* dosageInstruction.doseAndRate.doseQuantity.unit = "tablet/day"
* dosageInstruction.doseAndRate.doseQuantity.system = "http://snomed.info/sct"
* dosageInstruction.doseAndRate.doseQuantity.code = #428673006