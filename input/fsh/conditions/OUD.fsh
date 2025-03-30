// Opiate Use Disorder
Instance: CarlFredericksonOUD
InstanceOf: Condition
Usage: #example
Title: "Condition - Opiate Use Disorder"
Description: "Opiate Use Disorder for Carl Frederickson"
* subject.reference = "Patient/CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category[1] = http://terminology.hl7.org/CodeSystem/condition-category#behavioral
* category[2].coding.code = #SUD
* category[2].coding.display = "Substance Use Disorder"
* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10-cm"
* code.coding[0].code = #F11.11
* code.coding[0].display = "Opiate Use Disorder"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #5602001
* code.coding[1].display = "Opiate Use Disorder"
* recordedDate = "2025-03-12" // Using today's date as a placeholder for when this was recorded
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActCode#42CFRPart2 "42 CFR Part 2 restrictions apply" 