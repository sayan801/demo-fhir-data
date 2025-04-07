// Blood Pressure Observation
Instance: CarlFredericksonBloodPressure
InstanceOf: Observation
Title: "Mapple Vitals - Blood Pressure Measurement"
Description: "Mapple vitals blood pressure reading for Carl Frederickson"
Usage: #example

// This uses the standard FHIR profile for blood pressure observations
* meta.profile = "http://hl7.org/fhir/StructureDefinition/bp"
* status = #final

// Category "Vital Signs"
* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding[0].code = #vital-signs
* category[0].coding[0].display = "Vital Signs"

// Blood Pressure code
* code.coding[0].system = "http://snomed.info/sct"
* code.coding[0].code = #75367002
* code.coding[0].display = "Blood pressure (observable entity)"
* code.text = "Mapple Vitals - Blood pressure"
* subject.reference = "Patient/CarlFrederickson"
* effectiveDateTime = "2023-08-15T09:30:00Z"