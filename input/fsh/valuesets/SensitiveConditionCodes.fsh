// Sensitive Condition Codes ValueSet
ValueSet: ExampleSensitiveConditionCodes
Title: "ValueSet - Example Sensitive Condition Codes"
Description: "Example set of codes representing sensitive conditions requiring special privacy protections"
* ^experimental = false
* codes from valueset ExampleSubstanceUseConditionCodes
* codes from valueset ExampleBehavioralHealthConditionCodes
* codes from valueset ExampleSexualityAndReproductiveHealthConditionCodes

//------------------------------------------------------------------------------
// SUBSTANCE USE DISORDER (SUD) CODES
//------------------------------------------------------------------------------
ValueSet: ExampleSubstanceUseConditionCodes
Title: "ValueSet - Example Substance Use Condition Codes"
Description: "Example set of codes representing substance use conditions requiring special privacy protections"
* ^experimental = false
* http://hl7.org/fhir/sid/icd-10-cm#F11.11  "Opioid abuse, in remission"
* http://snomed.info/sct#5602001  "Opioid abuse"
* http://snomed.info/sct#425741009  "Buprenorphine/naloxone"
* http://snomed.info/sct#444175001  "Cognitive behavioral therapy record"
* http://www.nlm.nih.gov/research/umls/rxnorm#352364  "Buprenorphine 8 MG / Naloxone 2 MG Sublingual Tablet"

//------------------------------------------------------------------------------
// BEHAVIORAL HEALTH (BH) CODES
//------------------------------------------------------------------------------
ValueSet: ExampleBehavioralHealthConditionCodes
Title: "ValueSet - Example Behavioral Health Condition Codes"
Description: "Example set of codes representing behavioral health conditions requiring special privacy protections"
* ^experimental = false
* http://hl7.org/fhir/sid/icd-10-cm#F33.1  "Major depressive disorder, recurrent, moderate"
* http://hl7.org/fhir/sid/icd-10-cm#F60.5  "Obsessive-compulsive personality disorder"
* http://hl7.org/fhir/sid/icd-10-cm#F11.11  "Opioid abuse, in remission"
* http://snomed.info/sct#310496002  "Major depressive disorder, recurrent, moderate"
* http://snomed.info/sct#1376001  "Obsessive-compulsive personality disorder"
* http://snomed.info/sct#720433000  "PHQ-9 depression screening instrument"
* http://snomed.info/sct#5602001  "Opioid abuse"
* http://www.nlm.nih.gov/research/umls/rxnorm#315952  "Fluoxetine 20 MG Oral Capsule"
* http://www.nlm.nih.gov/research/umls/rxnorm#352364  "Buprenorphine 8 MG / Naloxone 2 MG Sublingual Tablet"
* http://www.ama-assn.org/go/cpt#96127  "Brief emotional/behavioral assessment"

//------------------------------------------------------------------------------
// SEXUALITY & REPRODUCTIVE HEALTH (SEX) CODES
//------------------------------------------------------------------------------
ValueSet: ExampleSexualityAndReproductiveHealthConditionCodes
Title: "ValueSet - Example Sexuality and Reproductive Health Condition Codes"
Description: "Example set of codes representing sexuality and reproductive health conditions requiring special privacy protections"
* ^experimental = false

