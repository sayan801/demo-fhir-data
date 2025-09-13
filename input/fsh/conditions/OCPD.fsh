// Obsessive-Compulsive Personality Disorder
Instance: CarlFredericksonOCPD
InstanceOf: SensitiveConditionProfile
Usage: #example
Title: "Condition - Obsessive-Compulsive Personality Disorder"
Description: "Obsessive-compulsive personality disorder for Carl Frederickson"
* subject = Reference(CarlFrederickson)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category[1] = http://terminology.hl7.org/CodeSystem/condition-category#encounter-diagnosis

* identifier[0].system = "http://example.com/demo/condition-identifier"
* identifier[0].value = "OCPD-12348"

* code.coding[0] = http://hl7.org/fhir/sid/icd-10-cm#F60.5 "Obsessive-compulsive personality disorder"
* code.coding[1] = http://snomed.info/sct#1376001 "Obsessive compulsive personality disorder"
* code.text = "Obsessive-compulsive personality disorder"