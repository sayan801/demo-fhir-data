// Fluoxetine Medication
Instance: MedicationFluoxetine
InstanceOf: SensitiveMedicationProfile
Usage: #example
Title: "Medication - Fluoxetine"
Description: "Fluoxetine for treatment of depression"

* identifier[0].system = "http://shift.github.io/demo/medication-identifier"
* identifier[0].value = "FLUOX-78902"

* code.coding[0] = http://www.nlm.nih.gov/research/umls/rxnorm#315952 "fluoxetine 20 MG"
* code.text = "Fluoxetine 20 MG Oral Capsule"
* form.coding = http://snomed.info/sct#385055001 "Tablet"
* form.text = "Tablet dose form"