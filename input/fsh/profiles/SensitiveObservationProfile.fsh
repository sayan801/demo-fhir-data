Profile: SensitiveObservationProfile
Parent: Observation
Id: sensitive-observation-profile
Title: "Sensitive Observation Profile"
Description: "A profile for observations that are considered sensitive, with specific constraints on the observation code."
* ^url = "http://example.org/fhir/StructureDefinition/sensitive-observation-profile"
* ^status = #active
* ^identifier.system = "http://example.org/fhir/identifiers"
* ^identifier.value = "sensitive-observation-profile"
* code 1..1
* code from http://example.org/fhir/ValueSet/sensitive-observation-codes (extensible)