// Sensitive Medication Profile
Profile: SensitiveMedicationProfile
Parent: Medication
Id: sensitive-medication-profile
Title: "Sensitive Medication Profile"
Description: "A profile for medications that are considered sensitive, with specific constraints on the medication code."
* ^url = "http://example.org/fhir/StructureDefinition/sensitive-medication-profile"
* ^status = #active
* ^identifier.system = "http://example.org/fhir/identifiers"
* ^identifier.value = "sensitive-medication-profile"
* code 1..1
* code from http://example.org/fhir/ValueSet/sensitive-medication-codes (extensible)