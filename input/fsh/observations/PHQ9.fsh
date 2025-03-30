// PHQ-9 Depression Screening
Instance: CarlFredericksonPHQ9
InstanceOf: Observation
Title: "Mapple Screening - PHQ-9 Depression Assessment"
Description: "Patient Health Questionnaire-9 (PHQ-9) assessment for depression screening"
Usage: #example

* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#survey "Survey"
* category[1] = http://terminology.hl7.org/CodeSystem/observation-category#mental-health "Mental Health"
* code = http://snomed.info/sct#720433000 "Patient Health Questionnaire 9 item (assessment scale)"
* code.text = "Mapple Screening - PHQ-9 depression assessment"
* subject.reference = "Patient/CarlFrederickson"
* effectiveDateTime = "2023-07-20T10:30:00Z"
* performer.display = "Dr. Sarah Johnson, Psychiatrist"
* valueInteger = 15
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H "High"
* note.text = "Score indicates moderate to severe depression. Follow-up appointment scheduled with psychiatrist for medication review."


// Add reference to CPT code for billing purposes
* extension[0].url = "http://example.org/fhir/StructureDefinition/cptCode"
* extension[0].valueCodeableConcept.coding.system = "http://www.ama-assn.org/go/cpt"
* extension[0].valueCodeableConcept.coding.code = #96127
* extension[0].valueCodeableConcept.coding.display = "Brief emotional/behavioral assessment"
* extension[0].valueCodeableConcept.text = "CPT 96127 (not billed)" 