// Sensitive Observation Codes ValueSet
Instance: sensitive-observation-codes
InstanceOf: ValueSet
Usage: #definition
Title: "ValueSet - Sensitive Observation Codes"
Description: "Codes representing sensitive observations requiring special privacy protections"

* url = "http://shift.github.io/demo/ValueSet/sensitive-observation-codes"
* version = "0.0.1"
* name = "SensitiveObservationCodes"
* identifier[0].system = "http://shift.github.io/demo/valueset-identifier"
* identifier[0].value = "VS-89013"

* status = #active
* experimental = false
* purpose = "Identify observation codes that require security labeling for privacy protection"
* date = "2023-04-06"

//------------------------------------------------------------------------------
// SUBSTANCE USE DISORDER (SUD) OBSERVATION CODES
//------------------------------------------------------------------------------

// SNOMED CT SUD Observation Codes
* compose.include[0].system = "http://snomed.info/sct"
* compose.include[0].concept[0].code = #444175001
* compose.include[0].concept[0].display = "Cognitive behavioral therapy record"

//------------------------------------------------------------------------------
// BEHAVIORAL HEALTH (BH) OBSERVATION CODES
//------------------------------------------------------------------------------

// SNOMED CT BH Observation Codes
* compose.include[1].system = "http://snomed.info/sct"
* compose.include[1].concept[0].code = #720433000
* compose.include[1].concept[0].display = "PHQ-9 depression screening instrument"

// CPT BH Assessment/Procedure Codes
* compose.include[2].system = "http://www.ama-assn.org/go/cpt"
* compose.include[2].concept[0].code = #96127
* compose.include[2].concept[0].display = "Brief emotional/behavioral assessment"

//------------------------------------------------------------------------------
// LOINC ASSESSMENT INSTRUMENT CODES
//------------------------------------------------------------------------------

* compose.include[3].system = "http://loinc.org"
* compose.include[3].concept[0].code = #44249-1
* compose.include[3].concept[0].display = "PHQ-9 quick depression assessment panel"
* compose.include[3].concept[1].code = #89204-2
* compose.include[3].concept[1].display = "Patient Health Questionnaire-9: Depression"

//------------------------------------------------------------------------------
// EXPANSION
//------------------------------------------------------------------------------
* expansion.timestamp = "2025-04-30T12:00:00Z"
* expansion.total = 5
* expansion.offset = 0
* expansion.contains[0].system = "http://snomed.info/sct"
* expansion.contains[0].code = #444175001
* expansion.contains[0].display = "Cognitive behavioral therapy record"
* expansion.contains[1].system = "http://snomed.info/sct"
* expansion.contains[1].code = #720433000
* expansion.contains[1].display = "PHQ-9 depression screening instrument"
* expansion.contains[2].system = "http://www.ama-assn.org/go/cpt"
* expansion.contains[2].code = #96127
* expansion.contains[2].display = "Brief emotional/behavioral assessment"
* expansion.contains[3].system = "http://loinc.org"
* expansion.contains[3].code = #44249-1
* expansion.contains[3].display = "PHQ-9 quick depression assessment panel"
* expansion.contains[4].system = "http://loinc.org"
* expansion.contains[4].code = #89204-2
* expansion.contains[4].display = "Patient Health Questionnaire-9: Depression"