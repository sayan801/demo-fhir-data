// Obsessive Compulsive Personality Disorder
Instance: CarlFredericksonOCPD
InstanceOf: Condition
Usage: #example
Title: "Condition - Obsessive Compulsive Personality Disorder"
Description: "Obsessive Compulsive Personality Disorder for Carl Frederickson"
* subject.reference = "Patient/CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category[1] = http://terminology.hl7.org/CodeSystem/condition-category#behavioral
* category[2].coding.code = #PD
* category[2].coding.display = "Personality Disorder"
* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10-cm"
* code.coding[0].code = #F60.5
* code.coding[0].display = "Obsessive Compulsive Personality Disorder"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #1376001
* code.coding[1].display = "Obsessive Compulsive Personality Disorder" 