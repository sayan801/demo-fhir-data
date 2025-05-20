Extension: PatientPortalProxy
Id: patient-portalProxy
Title: "Patient Portal Proxy Extension"
Description: "Extension for identifying proxy access in a patient portal"
* ^url = "http://shift.github.io/demo/StructureDefinition/patient-portalProxy"
* ^version = "0.0.1"
* ^status = #active
* ^experimental = false
* ^date = "2023-04-06"
* ^context[0].type = #element
* ^context[0].expression = "Patient"

* value[x] only Reference
* valueReference only Reference(Patient or RelatedPerson)
* valueReference 1..1
