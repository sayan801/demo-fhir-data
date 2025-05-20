// Buprenorphine Naltrexone Medication
Instance: MedicationBuprenorphineNaltrexone
InstanceOf: SensitiveMedicationProfile
Usage: #example
Title: "Medication - Buprenorphine/Naltrexone"
Description: "Buprenorphine/Naltrexone for treatment of OUD"

* identifier[0].system = "http://shift.github.io/demo/medication-identifier"
* identifier[0].value = "BUPR-NAL-78901"

* code.coding[0] = http://www.nlm.nih.gov/research/umls/rxnorm#352364 "buprenorphine / naloxone"
* code.coding[1] = http://snomed.info/sct#425741009 "Product containing buprenorphine and naloxone (medicinal product)"
* code.text = "Buprenorphine / Naltrexone"
* form.coding = http://snomed.info/sct#385055001 "Tablet"
* form.text = "Tablet dose form"
