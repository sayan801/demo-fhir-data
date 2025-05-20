// PHQ-9 Depression Screening
Instance: CarlFredericksonPHQ9
InstanceOf: SensitiveObservationProfile
Usage: #example
Title: "Observation - PHQ-9 Depression Screening"
Description: "PHQ-9 Depression screening questionnaire for Carl Frederickson"

* status = #final

* identifier[0].system = "http://shift.github.io/demo/observation-identifier"
* identifier[0].value = "PHQ9-56781"

// Code for PHQ-9 
* code.coding[0] = http://snomed.info/sct#720433000 "Patient Health Questionnaire Nine Item score (observable entity)"
* code.text = "Mapple Screening - PHQ-9 depression assessment"

* subject.reference = "urn:uuid:CarlFrederickson"
* performer[0].display = "Lucy van Pelt"
* effectiveDateTime = "2023-08-12T14:30:00Z"

// CPT code reference 
* extension[0].url = "http://shift.github.io/demo/StructureDefinition/observation-supportingInfo"
* extension[0].valueCodeableConcept.coding = http://www.ama-assn.org/go/cpt#96127 "Brief emotional/behavioral assessment (eg, depression inventory, attention-deficit/hyperactivity disorder [ADHD] scale), with scoring and documentation, per standardized instrument"
* extension[0].valueCodeableConcept.text = "Brief emotional/behavioral assessment - CPT 96127 (not billed)"

// Add missing value to PHQ9 score
* valueInteger = 15