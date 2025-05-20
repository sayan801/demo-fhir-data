Extension: ObservationSupportingInfo
Id: observation-supportingInfo
Title: "Observation Supporting Info Extension"
Description: "Extension for providing supporting information for an observation"
* ^url = "http://shift.github.io/demo/StructureDefinition/observation-supportingInfo"
* ^version = "0.0.1"
* ^status = #active
* ^experimental = false
* ^date = "2023-04-06"
* ^context[0].type = #element
* ^context[0].expression = "Observation"

* value[x] only CodeableConcept
* valueCodeableConcept 1..1
