// OUD Thought Record (CBT tool)
Instance: CarlFredericksonOUDThoughtRecord
InstanceOf: Observation
Title: "Mapple CBT Tool - OUD Thought Record"
Description: "Cognitive Behavioral Therapy thought record for Opiate Use Disorder"
Usage: #example

* status = #final

* identifier[0].system = "http://example.org/fhir/observation-identifier"
* identifier[0].value = "OUDTR-56782"

// CBT code
* code.coding[0].system = "http://snomed.info/sct"
* code.coding[0].code = #444175001
* code.coding[0].display = "Cognitive behavioral therapy intervention (procedure)"
* code.text = "Mapple CBT Tool - OUD self-help thought record"

* subject.reference = "urn:uuid:CarlFrederickson"
* effectiveDateTime = "2023-08-05T14:45:00Z"
* performer.reference = "urn:uuid:CarlFrederickson"