// PHQ-9 Depression Screening
Instance: CarlFredericksonPHQ9
InstanceOf: SensitiveObservationProfile
Usage: #example
Title: "Observation - PHQ-9 Depression Screening"
Description: "PHQ-9 Depression screening questionnaire for Carl Frederickson"

* status = #final

* identifier[0].system = "http://example.org/fhir/observation-identifier"
* identifier[0].value = "PHQ9-56781"

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