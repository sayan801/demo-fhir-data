// Sensitive Condition Codes ValueSet
Instance: SensitiveConditionCodes
InstanceOf: ValueSet
Usage: #definition
Title: "ValueSet - Sensitive Condition Codes"
Description: "Codes representing sensitive conditions requiring special privacy protections"

* url = "http://example.org/fhir/ValueSet/sensitive-condition-codes"
* identifier[0].system = "http://example.org/fhir/valueset-identifier"
* identifier[0].value = "VS-89012"

* status = #active
* experimental = false
* purpose = "Identify clinical codes that require security labeling for privacy protection"
* date = "2023-04-06"

//------------------------------------------------------------------------------
// SUBSTANCE USE DISORDER (SUD) CODES
//------------------------------------------------------------------------------

// ICD-10 SUD Codes
* compose.include[0].system = "http://hl7.org/fhir/sid/icd-10"
* compose.include[0].concept[0].code = #F11.11
* compose.include[0].concept[0].display = "Opioid abuse, in remission"

// SNOMED CT SUD Codes
* compose.include[1].system = "http://snomed.info/sct"
* compose.include[1].concept[0].code = #5602001
* compose.include[1].concept[0].display = "Opioid abuse"
* compose.include[1].concept[1].code = #425741009
* compose.include[1].concept[1].display = "Buprenorphine/naloxone"
* compose.include[1].concept[2].code = #444175001
* compose.include[1].concept[2].display = "Cognitive behavioral therapy record"

// RxNorm SUD Medication Codes
* compose.include[2].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* compose.include[2].concept[0].code = #352364
* compose.include[2].concept[0].display = "Buprenorphine 8 MG / Naloxone 2 MG Sublingual Tablet"

//------------------------------------------------------------------------------
// BEHAVIORAL HEALTH (BH) CODES
//------------------------------------------------------------------------------

// ICD-10 BH Codes
* compose.include[3].system = "http://hl7.org/fhir/sid/icd-10"
* compose.include[3].concept[0].code = #F33.1
* compose.include[3].concept[0].display = "Major depressive disorder, recurrent, moderate" 
* compose.include[3].concept[1].code = #F60.5
* compose.include[3].concept[1].display = "Obsessive-compulsive personality disorder"
* compose.include[3].concept[2].code = #F11.11
* compose.include[3].concept[2].display = "Opioid abuse, in remission"
// Note: F11.11 is also included in SUD section since it belongs to both categories

// SNOMED CT BH Codes
* compose.include[4].system = "http://snomed.info/sct"
* compose.include[4].concept[0].code = #310496002
* compose.include[4].concept[0].display = "Major depressive disorder, recurrent, moderate"
* compose.include[4].concept[1].code = #1376001
* compose.include[4].concept[1].display = "Obsessive-compulsive personality disorder"
* compose.include[4].concept[2].code = #720433000
* compose.include[4].concept[2].display = "PHQ-9 depression screening instrument"
* compose.include[4].concept[3].code = #5602001
* compose.include[4].concept[3].display = "Opioid abuse"
// Note: 5602001 is also included in SUD section since it belongs to both categories

// RxNorm BH Medication Codes
* compose.include[5].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* compose.include[5].concept[0].code = #315952
* compose.include[5].concept[0].display = "Fluoxetine 20 MG Oral Capsule"
* compose.include[5].concept[1].code = #352364
* compose.include[5].concept[1].display = "Buprenorphine 8 MG / Naloxone 2 MG Sublingual Tablet"
// Note: 352364 is also included in SUD section since it belongs to both categories

// CPT BH Assessment/Procedure Codes
* compose.include[6].system = "http://www.ama-assn.org/go/cpt"
* compose.include[6].concept[0].code = #96127
* compose.include[6].concept[0].display = "Brief emotional/behavioral assessment"

//------------------------------------------------------------------------------
// SEXUALITY & REPRODUCTIVE HEALTH (SEX) CODES
//------------------------------------------------------------------------------

// ICD-10 SEX Codes
* compose.include[7].system = "http://hl7.org/fhir/sid/icd-10"
// ADD ICD-10 SEXUALITY/REPRODUCTIVE HEALTH CODES HERE

// SNOMED CT SEX Codes
* compose.include[8].system = "http://snomed.info/sct"
// ADD SNOMED SEXUALITY/REPRODUCTIVE HEALTH CODES HERE

// CPT SEX Procedure Codes
* compose.include[9].system = "http://www.ama-assn.org/go/cpt"
// ADD CPT SEXUALITY/REPRODUCTIVE HEALTH PROCEDURE CODES HERE

// LOINC SEX Lab/Assessment Codes
* compose.include[10].system = "http://loinc.org"
// ADD LOINC SEXUALITY/REPRODUCTIVE HEALTH CODES HERE

//------------------------------------------------------------------------------
// EXPANSION
//------------------------------------------------------------------------------
* expansion.timestamp = "2025-04-30T12:00:00Z"
* expansion.total = 13
* expansion.offset = 0
* expansion.contains[0].system = "http://hl7.org/fhir/sid/icd-10"
* expansion.contains[0].code = #F11.11
* expansion.contains[0].display = "Opioid abuse, in remission"
* expansion.contains[1].system = "http://snomed.info/sct"
* expansion.contains[1].code = #5602001
* expansion.contains[1].display = "Opioid abuse"
* expansion.contains[2].system = "http://snomed.info/sct"
* expansion.contains[2].code = #425741009
* expansion.contains[2].display = "Buprenorphine/naloxone"
* expansion.contains[3].system = "http://snomed.info/sct"
* expansion.contains[3].code = #444175001
* expansion.contains[3].display = "Cognitive behavioral therapy record"
* expansion.contains[4].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* expansion.contains[4].code = #352364
* expansion.contains[4].display = "Buprenorphine 8 MG / Naloxone 2 MG Sublingual Tablet"
* expansion.contains[5].system = "http://hl7.org/fhir/sid/icd-10"
* expansion.contains[5].code = #F33.1
* expansion.contains[5].display = "Major depressive disorder, recurrent, moderate"
* expansion.contains[6].system = "http://hl7.org/fhir/sid/icd-10"
* expansion.contains[6].code = #F60.5
* expansion.contains[6].display = "Obsessive-compulsive personality disorder"
* expansion.contains[7].system = "http://snomed.info/sct"
* expansion.contains[7].code = #310496002
* expansion.contains[7].display = "Major depressive disorder, recurrent, moderate"
* expansion.contains[8].system = "http://snomed.info/sct"
* expansion.contains[8].code = #1376001
* expansion.contains[8].display = "Obsessive-compulsive personality disorder"
* expansion.contains[9].system = "http://snomed.info/sct"
* expansion.contains[9].code = #720433000
* expansion.contains[9].display = "PHQ-9 depression screening instrument"
* expansion.contains[10].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* expansion.contains[10].code = #315952
* expansion.contains[10].display = "Fluoxetine 20 MG Oral Capsule"
* expansion.contains[11].system = "http://www.ama-assn.org/go/cpt"
* expansion.contains[11].code = #96127
* expansion.contains[11].display = "Brief emotional/behavioral assessment"