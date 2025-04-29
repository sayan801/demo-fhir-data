// Major Depressive Disorder
Instance: CarlFredericksonMDD
InstanceOf: Condition
Usage: #example
Title: "Condition - Major Depressive Disorder"
Description: "Major depressive disorder, recurrent, moderate for Carl Frederickson"
* subject.reference = "urn:uuid:CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category[1] = http://terminology.hl7.org/CodeSystem/condition-category#behavioral

* identifier[0].system = "http://example.org/fhir/condition-identifier"
* identifier[0].value = "MDD-12349"

* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10"
* code.coding[0].code = #F33.1
* code.coding[0].display = "Major depressive disorder, recurrent, moderate"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #310496002
* code.coding[1].display = "Major depressive disorder, recurrent, moderate"