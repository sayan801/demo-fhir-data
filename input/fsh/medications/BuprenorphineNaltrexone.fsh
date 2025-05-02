// Buprenorphine Naltrexone Medication
Instance: MedicationBuprenorphineNaltrexone
InstanceOf: SensitiveMedicationProfile
Usage: #example
Title: "Medication - Buprenorphine/Naltrexone"
Description: "Buprenorphine/Naltrexone for treatment of OUD"

* identifier[0].system = "http://example.org/fhir/medication-identifier"
* identifier[0].value = "BUPR-NAL-78901"

* code.coding[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* code.coding[0].code = #352364
* code.coding[0].display = "Buprenorphine / Naltrexone"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #425741009
* code.coding[1].display = "Buprenorphine + Naltrexone"
* form.coding.system = "http://snomed.info/sct"
* form.coding.code = #385055001
* form.coding.display = "Tablet dose form"
