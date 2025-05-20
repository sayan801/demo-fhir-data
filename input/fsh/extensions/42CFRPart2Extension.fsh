Extension: CFRPart2
Id: 42CFRPart2
Title: "42 CFR Part 2 Extension"
Description: "Extension for identifying 42 CFR Part 2 protected data"
* ^url = "http://shift.github.io/demo/StructureDefinition/42CFRPart2"
* ^version = "0.0.1"
* ^status = #active
* ^experimental = false
* ^date = "2023-04-06"
* ^context[0].type = #element
* ^context[0].expression = "Resource"
* ^context[1].type = #element
* ^context[1].expression = "CareTeam.participant"

* value[x] only boolean
* valueBoolean 1..1
