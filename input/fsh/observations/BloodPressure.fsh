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