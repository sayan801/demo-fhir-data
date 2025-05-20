Profile: SensitiveConditionProfile
Parent: Condition
Id: sensitive-condition-profile
Title: "Sensitive Condition Profile"
Description: "A profile for conditions that are considered sensitive, with specific constraints on the condition code."
* ^url = "http://shift.github.io/demo/StructureDefinition/sensitive-condition-profile"
* ^version = "0.0.1"
* ^status = #active
* ^identifier.system = "http://shift.github.io/demo/identifiers"
* ^identifier.value = "sensitive-condition-profile"
* code 1..1
* code from http://shift.github.io/demo/ValueSet/sensitive-condition-codes|0.0.1 (extensible)