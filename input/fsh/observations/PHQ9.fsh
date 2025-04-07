// PHQ-9 Depression Screening
Instance: CarlFredericksonPHQ9
InstanceOf: Observation
Title: "Mapple Screening - PHQ-9 Depression Assessment"
Description: "Patient Health Questionnaire-9 (PHQ-9) assessment for depression screening"
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
// Behavioral Health sensitivity category
* category[2].coding.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* category[2].coding.code = #BH
* category[2].coding.display = "Behavioral Health"

// Code for PHQ-9 
* code.coding[0].system = "http://snomed.info/sct"
* code.coding[0].code = #720433000
* code.coding[0].display = "Patient Health Questionnaire 9 item (assessment scale)"
* code.text = "Mapple Screening - PHQ-9 depression assessment"

* subject.reference = "Patient/CarlFrederickson"


// CPT code reference 
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/observation-supportingInfo"
* extension[0].valueCodeableConcept.coding.system = "http://www.ama-assn.org/go/cpt"
* extension[0].valueCodeableConcept.coding.code = #96127
* extension[0].valueCodeableConcept.coding.display = "Brief emotional/behavioral assessment"
* extension[0].valueCodeableConcept.text = "CPT 96127 (not billed)" 