Profile: SensitiveConditionProfile
Parent: Condition
Id: sensitive-condition-profile
Title: "Sensitive Condition Profile"
Description: "A profile for conditions that are considered sensitive, with specific constraints on the condition code."
* ^url = "http://example.org/fhir/StructureDefinition/sensitive-condition-profile"
* ^status = #active
* ^identifier.system = "http://example.org/fhir/identifiers"
* ^identifier.value = "sensitive-condition-profile"
* code 1..1
* code from http://example.org/fhir/ValueSet/sensitive-condition-codes (extensible)