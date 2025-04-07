// OUD Thought Record (CBT tool)
Instance: CarlFredericksonOUDThoughtRecord
InstanceOf: Observation
Title: "Mapple CBT Tool - OUD Thought Record"
Description: "Cognitive Behavioral Therapy thought record for Opiate Use Disorder"
Usage: #example

* status = #final

// Observation Categories
* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding[0].code = #survey
* category[0].coding[0].display = "Survey"

* category[1].coding[0].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[1].coding[0].code = #mental-health
* category[1].coding[0].display = "Mental Health"

// Data Type
// Substance Use Disorder sensitivity category
* category[2].coding.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* category[2].coding.code = #SUD
* category[2].coding.display = "Substance Use Disorder"

// Behavioral Health sensitivity category
* category[3].coding.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* category[3].coding.code = #BH
* category[3].coding.display = "Behavioral Health"

// CBT code
* code.coding[0].system = "http://snomed.info/sct"
* code.coding[0].code = #444175001
* code.coding[0].display = "Cognitive behavioral therapy intervention (procedure)"
* code.text = "Mapple CBT Tool - OUD self-help thought record"

* subject.reference = "Patient/CarlFrederickson"
* effectiveDateTime = "2023-08-05T14:45:00Z"
* performer.reference = "Patient/CarlFrederickson"