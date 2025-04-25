// Hypertension
Instance: CarlFredericksonHTN
InstanceOf: Condition
Usage: #example
Title: "Condition - Essential Hypertension"
Description: "Essential hypertension diagnosis for Carl Frederickson"
* subject.reference = "urn:uuid:CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10"
* code.coding[0].code = #I10
* code.coding[0].display = "Essential hypertension"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #59621000
* code.coding[1].display = "Essential hypertension" 