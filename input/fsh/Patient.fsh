// Demo Patient: Carl Frederickson
Instance: CarlFrederickson
InstanceOf: Patient
Title: "Patient Carl Frederickson"
Description: "Patient demographics for Carl Frederickson"
* identifier[0].system = "http://example.org/fhir/identifier/mrn"
* identifier[0].value = "12345"
* name.family = "Frederickson"
* name.given = "Carl"
* birthDate = "1949-09-12"
* gender = #male
* maritalStatus.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus"
* maritalStatus.coding[0].code = #M
* maritalStatus.coding[0].display = "Married"
* contact[0].relationship.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0131"
* contact[0].relationship.coding[0].code = #C
* contact[0].relationship.coding[0].display = "Emergency Contact"
* contact[0].name.given[0] = "Ellie"
* contact[0].name.family = "Frederickson"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/patient-portalProxy"
* extension[0].valueReference.reference = "RelatedPerson/EllieFrederickson"