// Fluoxetine Medication
Instance: MedicationFluoxetine
InstanceOf: SensitiveMedicationProfile
Usage: #example
Title: "Medication - Fluoxetine"
Description: "Fluoxetine for treatment of depression"

* identifier[0].system = "http://example.org/fhir/medication-identifier"
* identifier[0].value = "FLUOX-78902"

* code.coding[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* code.coding[0].code = #315952
* code.coding[0].display = "Fluoxetine 20 MG Oral Capsule"
* form.coding.system = "http://snomed.info/sct"
* form.coding.code = #385055001
* form.coding.display = "Capsule dose form"