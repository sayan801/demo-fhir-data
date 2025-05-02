Profile: SensitiveMedicationRequestProfile
Parent: MedicationRequest
Id: sensitive-medication-request-profile
Title: "Sensitive Medication Request Profile"
Description: "A profile for medication requests that are considered sensitive, with specific constraints on the medication."
* ^url = "http://example.org/fhir/StructureDefinition/sensitive-medication-request-profile"
* ^status = #active
* ^identifier.system = "http://example.org/fhir/identifiers"
* ^identifier.value = "sensitive-medication-request-profile"
* medicationCodeableConcept 0..1 MS
* medicationCodeableConcept from http://example.org/fhir/ValueSet/sensitive-medication-request-codes (extensible)
* medicationReference 0..1 MS
* medicationReference only Reference(SensitiveMedicationProfile)