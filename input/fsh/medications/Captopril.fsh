// Captopril Medication
Instance: MedicationCaptopril
InstanceOf: Medication
Title: "Medication - Captopril"
Description: "Captopril 12.5mg medication"

* identifier[0].system = "http://example.com/demo/medication-identifier"
* identifier[0].value = "CAPTOPRIL-78903"

* code.coding[0] = http://www.nlm.nih.gov/research/umls/rxnorm#315560 "captopril 12.5 MG"
* code.text = "Captopril 12.5 MG Oral Tablet"
* form.coding = http://snomed.info/sct#385055001 "Tablet"
* form.text = "Tablet dose form"