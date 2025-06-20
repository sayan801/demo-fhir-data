Profile: SensitiveCareTeamProfile
Parent: CareTeam
Id: sensitive-care-team-profile
Title: "Sensitive Care Team Profile"
Description: "A profile for care teams that are managing sensitive conditions, with specific constraints on team categories and roles."
* ^url = "http://shift.github.io/demo/StructureDefinition/sensitive-care-team-profile"
* ^version = "0.0.1"
* ^status = #active
* ^identifier.system = "http://shift.github.io/demo/identifiers"
* ^identifier.value = "sensitive-care-team-profile"
* category 1..*
* category from http://shift.github.io/demo/ValueSet/sensitive-care-team-codes|0.0.1 (extensible)
* reasonCode from http://shift.github.io/demo/ValueSet/sensitive-care-team-codes|0.0.1 (extensible)
* participant.role from http://shift.github.io/demo/ValueSet/sensitive-care-team-codes|0.0.1 (extensible)