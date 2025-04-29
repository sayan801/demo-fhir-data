// Captopril Medication
Instance: MedicationCaptopril
InstanceOf: Medication
Title: "Medication - Captopril"
Description: "Captopril 12.5mg medication"

* identifier[0].system = "http://example.org/fhir/medication-identifier"
* identifier[0].value = "CAPTOPRIL-78903"

* code.coding[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* code.coding[0].code = #315560
* code.coding[0].display = "Captopril 12.5 MG Oral Tablet"
* form.coding.system = "http://snomed.info/sct"
* form.coding.code = #385055001
* form.coding.display = "Tablet dose form"