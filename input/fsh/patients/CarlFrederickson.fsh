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



Instance: AllOfCarlFrederickson
InstanceOf: Bundle
Usage: #example
Title: "AllOfCarlFrederickson"
Description: "Bundle containing all resources related to Carl Frederickson"
* type = #batch
* entry[+].request.method = #PUT
* entry[=].resource = CarlFrederickson
* entry[=].request.url = "Patient/CarlFrederickson"
* entry[=].fullUrl = Canonical(CarlFrederickson)
* entry[+].request.method = #PUT
* entry[=].resource = EllieFrederickson
* entry[=].request.url = "RelatedPerson/EllieFrederickson"
* entry[=].fullUrl = Canonical(EllieFrederickson)
* entry[+].request.method = #PUT
* entry[=].resource = CarlFredericksonPHQ9
* entry[=].request.url = "Observation/CarlFredericksonPHQ9"
* entry[=].fullUrl = Canonical(CarlFredericksonPHQ9)
* entry[+].request.method = #PUT
* entry[=].resource = CarlFredericksonOUDThoughtRecord
* entry[=].request.url = "Observation/CarlFredericksonOUDThoughtRecord"
* entry[=].fullUrl = Canonical(CarlFredericksonOUDThoughtRecord)
* entry[+].request.method = #PUT
* entry[=].resource = CarlFredericksonBloodPressure
* entry[=].request.url = "Observation/CarlFredericksonBloodPressure"
* entry[=].fullUrl = Canonical(CarlFredericksonBloodPressure)
* entry[+].request.method = #PUT
* entry[=].resource = MedicationFluoxetine
* entry[=].request.url = "Medication/MedicationFluoxetine"
* entry[=].fullUrl = Canonical(MedicationFluoxetine)
* entry[+].request.method = #PUT
* entry[=].resource = CarlFredericksonFluoxetine
* entry[=].request.url = "MedicationRequest/CarlFredericksonFluoxetine"
* entry[=].fullUrl = Canonical(CarlFredericksonFluoxetine)
* entry[+].request.method = #PUT
* entry[=].resource = MedicationCaptopril
* entry[=].request.url = "Medication/MedicationCaptopril"
* entry[=].fullUrl = Canonical(MedicationCaptopril)
* entry[+].request.method = #PUT
* entry[=].resource = CarlFredericksonCaptopril
* entry[=].request.url = "MedicationRequest/CarlFredericksonCaptopril"
* entry[=].fullUrl = Canonical(CarlFredericksonCaptopril)
* entry[+].request.method = #PUT
* entry[=].resource = MedicationBuprenorphineNaltrexone
* entry[=].request.url = "Medication/MedicationBuprenorphineNaltrexone"
* entry[=].fullUrl = Canonical(MedicationBuprenorphineNaltrexone)
* entry[+].request.method = #PUT
* entry[=].resource = CarlFredericksonBuprenorphineNaltrexone
* entry[=].request.url = "MedicationRequest/CarlFredericksonBuprenorphineNaltrexone"
* entry[=].fullUrl = Canonical(CarlFredericksonBuprenorphineNaltrexone)
* entry[+].request.method = #PUT
* entry[=].resource = CarlFredericksonXrayFeet
* entry[=].request.url = "DiagnosticReport/CarlFredericksonXrayFeet"
* entry[=].fullUrl = Canonical(CarlFredericksonXrayFeet)
* entry[+].request.method = #PUT
* entry[=].resource = CarlFredericksonOUD
* entry[=].request.url = "Condition/CarlFredericksonOUD"
* entry[=].fullUrl = Canonical(CarlFredericksonOUD)
* entry[+].request.method = #PUT
* entry[=].resource = CarlFredericksonCareTeam
* entry[=].request.url = "CareTeam/CarlFredericksonCareTeam"
* entry[=].fullUrl = Canonical(CarlFredericksonCareTeam)
