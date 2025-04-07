// Major Depressive Disorder
Instance: CarlFredericksonMDD
InstanceOf: Condition
Usage: #example
Title: "Condition - Major Depressive Disorder"
Description: "Major depressive disorder, recurrent, moderate for Carl Frederickson"
* subject.reference = "Patient/CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category[1] = http://terminology.hl7.org/CodeSystem/condition-category#behavioral
* category[2].coding.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* category[2].coding.code = #BH
* category[2].coding.display = "Behavioral Health"
* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10"
* code.coding[0].code = #F33.1
* code.coding[0].display = "Major depressive disorder, recurrent, moderate"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #310496002
* code.coding[1].display = "Major depressive disorder, recurrent, moderate" 