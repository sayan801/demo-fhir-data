Profile: SensitiveMedicationRequestProfile
Parent: MedicationRequest
Id: sensitive-medication-request-profile
Title: "Sensitive Medication Request Profile"
Description: "A profile for medication requests that are considered sensitive, with specific constraints on the medication."
* ^url = "http://shift.github.io/demo/StructureDefinition/sensitive-medication-request-profile"
* ^version = "0.0.1"
* ^status = #active
* ^identifier.system = "http://shift.github.io/demo/identifiers"
* ^identifier.value = "sensitive-medication-request-profile"
* medicationCodeableConcept 0..1 MS
* medicationCodeableConcept from http://shift.github.io/demo/ValueSet/sensitive-medication-request-codes|0.0.1 (extensible)
