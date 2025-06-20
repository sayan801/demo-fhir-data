// Bunions
Instance: CarlFredericksonBunions
InstanceOf: Condition
Usage: #example
Title: "Condition - Bilateral Bunions"
Description: "Bilateral bunions diagnosis for Carl Frederickson"
* subject.reference = "urn:uuid:CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item

* identifier[0].system = "http://shift.github.io/demo/condition-identifier"
* identifier[0].value = "BUNIONS-12347"

* code.coding[0] = http://hl7.org/fhir/sid/icd-10-cm#M20.10 "Hallux valgus (acquired), unspecified foot"
* code.coding[1] = http://snomed.info/sct#415692008 "Swelling of first metatarsophalangeal joint of hallux (disorder)"
* code.text = "Bunions, bilateral"