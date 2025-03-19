// FHIR Observations for Carl Frederickson
// This file contains all Observation resources including:
// - Mapple Vital Signs (BP measurements)
// - Behavioral Health Assessments (PHQ-9, CBT thought records)

//----------------
// VITAL SIGNS
//----------------

// Blood Pressure Observation
Instance: CarlFredericksonBloodPressure
InstanceOf: Observation
Title: "Mapple Vitals - Blood Pressure Measurement"
Description: "Mapple vitals blood pressure reading for Carl Frederickson"
Usage: #example

// This uses the standard FHIR profile for blood pressure observations
* meta.profile = "http://hl7.org/fhir/StructureDefinition/bp"
* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://snomed.info/sct#75367002 "Blood pressure (observable entity)"
* code.text = "Mapple Vitals - Blood pressure"
* subject.reference = "Patient/CarlFrederickson"
* effectiveDateTime = "2023-08-15T09:30:00Z"
* performer.display = "Dr. Jane Wilson"
* device.display = "Mapple vitals monitoring system"

// Systolic component
* component[0].code = http://loinc.org#8480-6 "Systolic blood pressure"
* component[0].code.text = "Systolic blood pressure"
* component[0].valueQuantity = 138 'mm[Hg]' "mmHg"

// Diastolic component
* component[1].code = http://loinc.org#8462-4 "Diastolic blood pressure"
* component[1].code.text = "Diastolic blood pressure"
* component[1].valueQuantity = 88 'mm[Hg]' "mmHg"

//------------------------
// BEHAVIORAL HEALTH
//------------------------

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
* performer.reference = "Practitioner/ex-author"
* valueInteger = 15
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H "High"
* note.text = "Score indicates moderate to severe depression. Follow-up appointment scheduled with psychiatrist for medication review."


// Add reference to CPT code for billing purposes
* extension[0].url = "http://example.org/fhir/StructureDefinition/cptCode"
* extension[0].valueCodeableConcept.coding.system = "http://www.ama-assn.org/go/cpt"
* extension[0].valueCodeableConcept.coding.code = #96127
* extension[0].valueCodeableConcept.coding.display = "Brief emotional/behavioral assessment"
* extension[0].valueCodeableConcept.text = "CPT 96127 (not billed)"

// OUD Thought Record (CBT tool)
Instance: CarlFredericksonOUDThoughtRecord
InstanceOf: Observation
Title: "Mapple CBT Tool - OUD Thought Record"
Description: "Cognitive Behavioral Therapy thought record for Opiate Use Disorder"
Usage: #example

* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#survey "Survey"
* category[1] = http://terminology.hl7.org/CodeSystem/observation-category#mental-health "Mental Health"
* code = http://snomed.info/sct#444175001 "Cognitive behavioral therapy intervention (procedure)"
* code.text = "Mapple CBT Tool - OUD self-help thought record"
* subject.reference = "Patient/CarlFrederickson"
* effectiveDateTime = "2023-08-05T14:45:00Z"
* performer.reference = "Patient/CarlFrederickson"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActCode#42CFRPart2 "42 CFR Part 2 restrictions apply"

// Use valueString to capture the thought record content
* valueString = "Situation: Felt strong urge to use when passing by old neighborhood. Automatic thought: 'I can't handle this stress without using.' Emotions: Anxiety (80%), hopelessness (70%). Alternative thought: 'I have managed stress before without using and have resources to help me now.' Outcome: Used deep breathing techniques, called sponsor, urge decreased to manageable level."

// Structured data for the thought record components
* component[0].code.text = "Situation"
* component[0].valueString = "Felt strong urge to use when passing by old neighborhood"

* component[1].code.text = "Automatic Thoughts"
* component[1].valueString = "I can't handle this stress without using"

* component[2].code.text = "Emotions"
* component[2].valueString = "Anxiety (80%), hopelessness (70%)"

* component[3].code.text = "Alternative Thoughts"
* component[3].valueString = "I have managed stress before without using and have resources to help me now"

* component[4].code.text = "Outcome"
* component[4].valueString = "Used deep breathing techniques, called sponsor, urge decreased to manageable level"

* note.text = "Patient completed this thought record as part of self-help CBT exercises. Discussed in follow-up session with counselor and identified additional coping strategies."