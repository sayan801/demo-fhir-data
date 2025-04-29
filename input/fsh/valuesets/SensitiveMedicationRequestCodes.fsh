// Sensitive MedicationRequest Codes ValueSet
Instance: SensitiveMedicationRequestCodes
InstanceOf: ValueSet
Usage: #definition
Title: "ValueSet - Sensitive MedicationRequest Codes"
Description: "Codes representing sensitive medication requests requiring special privacy protections"

* url = "http://example.org/fhir/ValueSet/sensitive-medication-request-codes"
* identifier[0].system = "http://example.org/fhir/valueset-identifier"
* identifier[0].value = "VS-89016"

* status = #active
* experimental = false
* purpose = "Identify medication request codes that require security labeling for privacy protection"
* date = "2023-04-06"

//------------------------------------------------------------------------------
// SUBSTANCE USE DISORDER (SUD) MEDICATION REQUEST CODES
//------------------------------------------------------------------------------

// RxNorm SUD Medication Codes
* compose.include[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* compose.include[0].concept[0].code = #352364
* compose.include[0].concept[0].display = "Buprenorphine 8 MG / Naloxone 2 MG Sublingual Tablet"

// SNOMED CT SUD Medication Codes
* compose.include[1].system = "http://snomed.info/sct"
* compose.include[1].concept[0].code = #425741009
* compose.include[1].concept[0].display = "Buprenorphine/naloxone"

//------------------------------------------------------------------------------
// BEHAVIORAL HEALTH (BH) MEDICATION REQUEST CODES
//------------------------------------------------------------------------------

// RxNorm BH Medication Codes
* compose.include[2].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* compose.include[2].concept[0].code = #315952
* compose.include[2].concept[0].display = "Fluoxetine 20 MG Oral Capsule"

// SNOMED CT BH Medication Codes
* compose.include[3].system = "http://snomed.info/sct"
* compose.include[3].concept[0].code = #372767007
* compose.include[3].concept[0].display = "Fluoxetine (substance)"
* compose.include[3].concept[1].code = #373265006
* compose.include[3].concept[1].display = "Buprenorphine (substance)"

//------------------------------------------------------------------------------
// EXPANSION
//------------------------------------------------------------------------------
* expansion.timestamp = "2025-04-30T12:00:00Z"
* expansion.total = 5
* expansion.offset = 0
* expansion.contains[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* expansion.contains[0].code = #352364
* expansion.contains[0].display = "Buprenorphine 8 MG / Naloxone 2 MG Sublingual Tablet"
* expansion.contains[1].system = "http://snomed.info/sct"
* expansion.contains[1].code = #425741009
* expansion.contains[1].display = "Buprenorphine/naloxone"
* expansion.contains[2].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* expansion.contains[2].code = #315952
* expansion.contains[2].display = "Fluoxetine 20 MG Oral Capsule"
* expansion.contains[3].system = "http://snomed.info/sct"
* expansion.contains[3].code = #372767007
* expansion.contains[3].display = "Fluoxetine (substance)"
* expansion.contains[4].system = "http://snomed.info/sct"
* expansion.contains[4].code = #373265006
* expansion.contains[4].display = "Buprenorphine (substance)"