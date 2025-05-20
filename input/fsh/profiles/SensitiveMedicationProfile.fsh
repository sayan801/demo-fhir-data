// Sensitive Medication Profile
Profile: SensitiveMedicationProfile
Parent: Medication
Id: sensitive-medication-profile
Title: "Sensitive Medication Profile"
Description: "A profile for medications that are considered sensitive, with specific constraints on the medication code."
* ^url = "http://shift.github.io/demo/StructureDefinition/sensitive-medication-profile"
* ^version = "0.0.1"
* ^status = #active
* ^identifier.system = "http://shift.github.io/demo/identifiers"
* ^identifier.value = "sensitive-medication-profile"
* code 1..1
* code from http://shift.github.io/demo/ValueSet/sensitive-medication-codes|0.0.1 (extensible)