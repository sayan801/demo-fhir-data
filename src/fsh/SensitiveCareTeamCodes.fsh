// Sensitive CareTeam Codes ValueSet
// TODO: JFM 20250913: Seems this should be a grouping valueSet of a set of valueSets for each of the specific kinds of sensitivity. Thus the specific kinds of sensitivity can be used to tag data for specific kinds of data.
Instance: sensitive-care-team-codes
InstanceOf: ValueSet
Usage: #definition
Title: "ValueSet - Sensitive CareTeam Codes"
Description: "Codes representing sensitive care team roles requiring special privacy protections"

* version = "0.0.1"
* name = "SensitiveCareTeamCodes"
* identifier[0].system = "http://example.com/demo/valueset-identifier"
* identifier[0].value = "VS-89015"

* status = #active
* experimental = false
* purpose = "Identify care team roles that require security labeling for privacy protection"
* date = "2023-04-06"

//------------------------------------------------------------------------------
// SUBSTANCE USE DISORDER (SUD) PROVIDER ROLES
//------------------------------------------------------------------------------

// SNOMED CT SUD Provider Roles
* compose.include[0].system = "http://snomed.info/sct"
* compose.include[0].concept[0].code = #17561000
* compose.include[0].concept[0].display = "Addiction psychiatrist"
* compose.include[0].concept[1].code = #309343006 
* compose.include[1].concept[1].display = "Psychiatrist (occupation)"

//------------------------------------------------------------------------------
// BEHAVIORAL HEALTH (BH) PROVIDER ROLES
//------------------------------------------------------------------------------

// SNOMED CT BH Provider Roles
* compose.include[1].system = "http://snomed.info/sct"
* compose.include[1].concept[0].code = #66288003
* compose.include[1].concept[0].display = "Psychotherapist (occupation)"
* compose.include[1].concept[1].code = #310026003
* compose.include[1].concept[1].display = "Mental health counselor"

//------------------------------------------------------------------------------
// PROVIDER TEAM ROLES
//------------------------------------------------------------------------------

* compose.include[2].system = "http://loinc.org"
* compose.include[2].concept[0].code = #LA27976-2
* compose.include[2].concept[0].display = "Encounter-focused care team"

* compose.include[3].system = "http://snomed.info/sct"
* compose.include[3].concept[0].code = #386661006
* compose.include[3].concept[0].display = "Multidisciplinary care"

//------------------------------------------------------------------------------
// EXPANSION
//------------------------------------------------------------------------------
* expansion.timestamp = "2025-04-30T12:00:00Z"
* expansion.total = 6
* expansion.offset = 0
* expansion.contains[0].system = "http://snomed.info/sct"
* expansion.contains[0].code = #309354004
* expansion.contains[0].display = "Addiction medicine specialist"
* expansion.contains[1].system = "http://snomed.info/sct"
* expansion.contains[1].code = #309343006
* expansion.contains[1].display = "Psychiatrist (occupation)"
* expansion.contains[2].system = "http://snomed.info/sct"
* expansion.contains[2].code = #66288003
* expansion.contains[2].display = "Psychotherapist (occupation)"
* expansion.contains[3].system = "http://snomed.info/sct"
* expansion.contains[3].code = #310026003
* expansion.contains[3].display = "Mental health counselor"
* expansion.contains[4].system = "http://loinc.org"
* expansion.contains[4].code = #LA27976-2
* expansion.contains[4].display = "Interdisciplinary team"
* expansion.contains[5].system = "http://snomed.info/sct"
* expansion.contains[5].code = #386661006
* expansion.contains[5].display = "Multidisciplinary care"