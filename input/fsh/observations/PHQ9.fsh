// PHQ-9 Depression Screening
Instance: CarlFredericksonPHQ9
InstanceOf: Observation
Title: "Mapple Screening - PHQ-9 Depression Assessment"
Description: "Patient Health Questionnaire-9 (PHQ-9) assessment for depression screening"
Usage: #example

* status = #final

// Code for PHQ-9 
* code.coding[0].system = "http://snomed.info/sct"
* code.coding[0].code = #720433000
* code.coding[0].display = "Patient Health Questionnaire 9 item (assessment scale)"
* code.text = "Mapple Screening - PHQ-9 depression assessment"

* subject.reference = "urn:uuid:CarlFrederickson"


// CPT code reference 
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/observation-supportingInfo"
* extension[0].valueCodeableConcept.coding.system = "http://www.ama-assn.org/go/cpt"
* extension[0].valueCodeableConcept.coding.code = #96127
* extension[0].valueCodeableConcept.coding.display = "Brief emotional/behavioral assessment"
* extension[0].valueCodeableConcept.text = "CPT 96127 (not billed)" 