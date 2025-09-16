// Sensitive Medication Codes ValueSet
ValueSet: ExampleSensitiveMedicationCodes
Title: "ValueSet - Example Sensitive Medication Codes"
Description: "Example set of codes representing sensitive medications requiring special privacy protections"
* ^experimental = false
* codes from valueset ExampleSubstanceUseMedicationCodes
* codes from valueset ExampleBehavioralHealthMedicationCodes
* codes from valueset ExampleSexualityAndReproductiveHealthMedicationCodes


//------------------------------------------------------------------------------
// SUBSTANCE USE DISORDER (SUD) MEDICATION CODES
//------------------------------------------------------------------------------
ValueSet: ExampleSubstanceUseMedicationCodes
Title: "ValueSet - Example Substance Use Medication Codes"
Description: "Example set of codes representing substance use medications requiring special privacy protections"
* ^experimental = false
* http://www.nlm.nih.gov/research/umls/rxnorm#352364  "Buprenorphine 8 MG / Naloxone 2 MG Sublingual Tablet"
* http://snomed.info/sct#425741009  "Buprenorphine/naloxone"


//------------------------------------------------------------------------------
// BEHAVIORAL HEALTH (BH) MEDICATION CODES
//------------------------------------------------------------------------------
ValueSet: ExampleBehavioralHealthMedicationCodes
Title: "ValueSet - Example Behavioral Health Medication Codes"
Description: "Example set of codes representing behavioral health medications requiring special privacy protections"
* ^experimental = false
* http://www.nlm.nih.gov/research/umls/rxnorm#315952  "Fluoxetine 20 MG Oral Capsule"
* http://snomed.info/sct#372767007  "Fluoxetine (substance)"
* http://snomed.info/sct#373265006  "Fluoxetine (product)"

//------------------------------------------------------------------------------
// SEXUALITY & REPRODUCTIVE HEALTH (SEX) CODES
//------------------------------------------------------------------------------
ValueSet: ExampleSexualityAndReproductiveHealthMedicationCodes
Title: "ValueSet - Example Sexuality and Reproductive Health Medication Codes"
Description: "Example set of codes representing sexuality and reproductive health medications requiring special privacy protections"
* ^experimental = false

