Profile: SensitiveCareTeamProfile
Parent: CareTeam
Id: sensitive-care-team-profile
Title: "Sensitive Care Team Profile"
Description: "A profile for care teams that are managing sensitive conditions, with specific constraints on team categories and roles."
* ^url = "http://example.org/fhir/StructureDefinition/sensitive-care-team-profile"
* ^status = #active
* ^identifier.system = "http://example.org/fhir/identifiers"
* ^identifier.value = "sensitive-care-team-profile"
* category 1..*
* category from http://example.org/fhir/ValueSet/sensitive-care-team-codes (extensible)
* reasonCode from http://example.org/fhir/ValueSet/sensitive-care-team-codes (extensible)
* participant.role from http://example.org/fhir/ValueSet/sensitive-care-team-codes (extensible)