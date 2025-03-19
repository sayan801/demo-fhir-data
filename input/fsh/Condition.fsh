// Condition Resources for Carl Frederickson

// Hypertension
Instance: CarlFredericksonHTN
InstanceOf: Condition
Usage: #example
Title: "Condition - Essential Hypertension"
Description: "Essential hypertension diagnosis for Carl Frederickson"
* subject.reference = "Patient/CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10-cm"
* code.coding[0].code = #I10
* code.coding[0].display = "Essential hypertension"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #59621000
* code.coding[1].display = "Essential hypertension"

// Bunions
Instance: CarlFredericksonBunions
InstanceOf: Condition
Usage: #example
Title: "Condition - Bilateral Bunions"
Description: "Bilateral bunions diagnosis for Carl Frederickson"
* subject.reference = "Patient/CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10-cm"
* code.coding[0].code = #M21.611
* code.coding[0].display = "Bunions, bilateral"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #415692008
* code.coding[1].display = "Bunions, bilateral"

// Major Depressive Disorder
Instance: CarlFredericksonMDD
InstanceOf: Condition
Usage: #example
Title: "Condition - Major Depressive Disorder"
Description: "Major depressive disorder, recurrent, moderate for Carl Frederickson"
* subject.reference = "Patient/CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category[1] = http://terminology.hl7.org/CodeSystem/condition-category#behavioral
* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10-cm"
* code.coding[0].code = #F33.1
* code.coding[0].display = "Major depressive disorder, recurrent, moderate"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #310496002
* code.coding[1].display = "Major depressive disorder, recurrent, moderate"

// Opiate Use Disorder
Instance: CarlFredericksonOUD
InstanceOf: Condition
Usage: #example
Title: "Condition - Opiate Use Disorder"
Description: "Opiate Use Disorder for Carl Frederickson"
* subject.reference = "Patient/CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category[1] = http://terminology.hl7.org/CodeSystem/condition-category#behavioral
* category[2].coding.code = #SUD
* category[2].coding.display = "Substance Use Disorder"
* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10-cm"
* code.coding[0].code = #F11.11
* code.coding[0].display = "Opiate Use Disorder"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #5602001
* code.coding[1].display = "Opiate Use Disorder"
* recordedDate = "2025-03-12" // Using today's date as a placeholder for when this was recorded
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActCode#42CFRPart2 "42 CFR Part 2 restrictions apply"

// Obsessive Compulsive Personality Disorder
Instance: CarlFredericksonOCPD
InstanceOf: Condition
Usage: #example
Title: "Condition - Obsessive Compulsive Personality Disorder"
Description: "Obsessive Compulsive Personality Disorder for Carl Frederickson"
* subject.reference = "Patient/CarlFrederickson"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category[1] = http://terminology.hl7.org/CodeSystem/condition-category#behavioral
* category[2].coding.code = #PD
* category[2].coding.display = "Personality Disorder"
* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10-cm"
* code.coding[0].code = #F60.5
* code.coding[0].display = "Obsessive Compulsive Personality Disorder"
* code.coding[1].system = "http://snomed.info/sct"
* code.coding[1].code = #1376001
* code.coding[1].display = "Obsessive Compulsive Personality Disorder"