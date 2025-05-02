// Opiate Use Disorder
Instance: CarlFredericksonOUD
InstanceOf: SensitiveConditionProfile
Usage: #example
Title: "Condition - Opiate Use Disorder"
Description: "Opiate Use Disorder for Carl Frederickson"
* subject.reference = "urn:uuid:CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category[1] = http://terminology.hl7.org/CodeSystem/condition-category#behavioral

* identifier[0].system = "http://example.org/fhir/condition-identifier"
* identifier[0].value = "OUD-12345"

* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10"
* code.coding[0].code = #F11.11
* code.coding[0].display = "Opioid abuse, in remission"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #5602001
* code.coding[1].display = "Opioid abuse"
* recordedDate = "2025-04-06" // Using today's date as a placeholder for when this was recorded