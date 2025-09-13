// Hypertension
Instance: CarlFredericksonHTN
InstanceOf: Condition
Usage: #example
Title: "Condition - Essential Hypertension"
Description: "Essential hypertension diagnosis for Carl Frederickson"
* subject = Reference(CarlFrederickson)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item

* identifier[0].system = "http://example.com/demo/condition-identifier"
* identifier[0].value = "HTN-12346"

* code.coding[0] = http://hl7.org/fhir/sid/icd-10#I10 "Essential (primary) hypertension"
* code.coding[1] = http://snomed.info/sct#59621000 "Essential hypertension (disorder)"
* code.text = "Essential hypertension"