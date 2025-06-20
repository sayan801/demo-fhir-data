Profile: SensitiveObservationProfile
Parent: Observation
Id: sensitive-observation-profile
Title: "Sensitive Observation Profile"
Description: "A profile for observations that are considered sensitive, with specific constraints on the observation code."
* ^url = "http://shift.github.io/demo/StructureDefinition/sensitive-observation-profile"
* ^version = "0.0.1"
* ^status = #active
* ^identifier.system = "http://shift.github.io/demo/identifiers"
* ^identifier.value = "sensitive-observation-profile"
* code 1..1
* code from http://shift.github.io/demo/ValueSet/sensitive-observation-codes|0.0.1 (extensible)