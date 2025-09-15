// Blood Pressure Observation
Instance: CarlFredericksonBloodPressure
InstanceOf: Observation
Title: "Mapple Vitals - Blood Pressure Measurement"
Description: "Mapple vitals blood pressure reading for Carl Frederickson"
Usage: #example

* status = #final

* identifier[0].system = "http://example.com/demo/observation-identifier"
* identifier[0].value = "BP-56783"

// Category "Vital Signs"
* category[0].coding[0] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"

// Blood Pressure code - adding the required magic LOINC code 85354-9
* code.coding[0] = http://snomed.info/sct#75367002 "Blood pressure (observable entity)"
* code.coding[1] = http://loinc.org#85354-9 "Blood pressure panel with all children optional"
* code.text = "Mapple Vitals - Blood pressure"

* subject = Reference(CarlFrederickson)
* effectiveDateTime = "2023-08-15T09:30:00Z"
* performer[0] = Reference(CarlFredericksonCareTeam)

// Add required systolic and diastolic components
* component[0].code.coding[0] = http://loinc.org#8480-6 "Systolic blood pressure"
* component[0].valueQuantity.value = 132
* component[0].valueQuantity.unit = "mm[Hg]"
* component[0].valueQuantity.system = "http://unitsofmeasure.org"
* component[0].valueQuantity.code = #mm[Hg]

* component[1].code.coding[0] = http://loinc.org#8462-4 "Diastolic blood pressure"
* component[1].valueQuantity.value = 86
* component[1].valueQuantity.unit = "mm[Hg]"
* component[1].valueQuantity.system = "http://unitsofmeasure.org"
* component[1].valueQuantity.code = #mm[Hg]