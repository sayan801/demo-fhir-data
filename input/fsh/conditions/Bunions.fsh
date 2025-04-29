// Bunions
Instance: CarlFredericksonBunions
InstanceOf: Condition
Usage: #example
Title: "Condition - Bilateral Bunions"
Description: "Bilateral bunions diagnosis for Carl Frederickson"
* subject.reference = "urn:uuid:CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item

* identifier[0].system = "http://example.org/fhir/condition-identifier"
* identifier[0].value = "BUNIONS-12347"

* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10"
* code.coding[0].code = #M21.611
* code.coding[0].display = "Bunions, bilateral"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #415692008
* code.coding[1].display = "Bunions, bilateral"