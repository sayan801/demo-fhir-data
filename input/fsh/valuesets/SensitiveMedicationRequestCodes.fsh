// Sensitive MedicationRequest Codes ValueSet
ValueSet: ExampleSensitiveMedicationRequestCodes
Title: "ValueSet - Example Sensitive MedicationRequest Codes"
Description: "Example set of codes representing sensitive medication requests requiring special privacy protections"
* ^experimental = false
* codes from valueset ExampleSubstanceUseMedicationRequestCodes
* codes from valueset ExampleBehavioralHealthMedicationRequestCodes
* codes from valueset ExampleSexualityAndReproductiveHealthMedicationRequestCodes

//------------------------------------------------------------------------------
// SUBSTANCE USE DISORDER (SUD) MEDICATION REQUEST CODES
//------------------------------------------------------------------------------
ValueSet: ExampleSubstanceUseMedicationRequestCodes
Title: "ValueSet - Example Substance Use MedicationRequest Codes"
Description: "Example set of codes representing substance use medication requests requiring special privacy protections"
* ^experimental = false
* http://www.nlm.nih.gov/research/umls/rxnorm#352364  "Buprenorphine 8 MG / Naloxone 2 MG Sublingual Tablet"
* http://snomed.info/sct#425741009  "Buprenorphine/naloxone"

//------------------------------------------------------------------------------
// BEHAVIORAL HEALTH (BH) MEDICATION REQUEST CODES
//------------------------------------------------------------------------------
ValueSet: ExampleBehavioralHealthMedicationRequestCodes
Title: "ValueSet - Example Behavioral Health MedicationRequest Codes"
Description: "Example set of codes representing behavioral health medication requests requiring special privacy protections"
* ^experimental = false
* http://www.nlm.nih.gov/research/umls/rxnorm#315952  "Fluoxetine 20 MG Oral Capsule"
* http://snomed.info/sct#372767007  "Fluoxetine (substance)"
* http://snomed.info/sct#373265006  "Fluoxetine (product)"

//------------------------------------------------------------------------------
// SEXUALITY & REPRODUCTIVE HEALTH (SEX) CODES
//------------------------------------------------------------------------------
ValueSet: ExampleSexualityAndReproductiveHealthMedicationRequestCodes
Title: "ValueSet - Example Sexuality and Reproductive Health MedicationRequest Codes"
Description: "Example set of codes representing sexuality and reproductive health medication requests requiring special privacy protections"
* ^experimental = false
