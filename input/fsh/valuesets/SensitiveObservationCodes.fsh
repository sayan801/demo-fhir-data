// Sensitive Observation Codes ValueSet
ValueSet: ExampleSensitiveObservationCodes
Title: "ValueSet - Example Sensitive Observation Codes"
Description: "Example set of codes representing sensitive observations requiring special privacy protections"
* ^experimental = false

* codes from valueset ExampleSubstanceUseObservationCodes
* codes from valueset ExampleBehavioralHealthObservationCodes
* codes from valueset ExampleSexualityAndReproductiveHealthObservationCodes

//------------------------------------------------------------------------------
// SUBSTANCE USE DISORDER (SUD) OBSERVATION CODES
//------------------------------------------------------------------------------
ValueSet: ExampleSubstanceUseObservationCodes
Title: "ValueSet - Example Substance Use Observation Codes"
Description: "Example set of codes representing substance use observations requiring special privacy protections"
* ^experimental = false

// SNOMED CT SUD Observation Codes
* http://snomed.info/sct#444175001  "Cognitive behavioral therapy record"

//------------------------------------------------------------------------------
// BEHAVIORAL HEALTH (BH) OBSERVATION CODES
//------------------------------------------------------------------------------
ValueSet: ExampleBehavioralHealthObservationCodes
Title: "ValueSet - Example Behavioral Health Observation Codes"
Description: "Example set of codes representing behavioral health observations requiring special privacy protections"
* ^experimental = false

// SNOMED CT BH Observation Codes
* http://snomed.info/sct#720433000  "PHQ-9 depression screening instrument"

// CPT BH Assessment/Procedure Codes
* http://www.ama-assn.org/go/cpt#96127  "Brief emotional/behavioral assessment"

//------------------------------------------------------------------------------
// LOINC ASSESSMENT INSTRUMENT CODES
//------------------------------------------------------------------------------

* http://loinc.org#44249-1  "PHQ-9 quick depression assessment panel"
* http://loinc.org#89204-2  "Patient Health Questionnaire-9: Depression"

//------------------------------------------------------------------------------
// SEXUALITY & REPRODUCTIVE HEALTH (SEX) CODES
//------------------------------------------------------------------------------
ValueSet: ExampleSexualityAndReproductiveHealthObservationCodes
Title: "ValueSet - Example Sexuality and Reproductive Health Observation Codes"
Description: "Example set of codes representing sexuality and reproductive health observations requiring special privacy protections"
* ^experimental = false

