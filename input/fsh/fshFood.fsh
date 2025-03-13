


Instance:   ex-condition-1
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns
Title: "Example 1 of a condition"
Usage: #example
Description:      """
Example from a mock
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[+].value = "487" 
* identifier[=].system = "https://example.org/ProblemTO.id"
* identifier[=].use = #usual
* code.text = "Hypertension (ICD-9-CM 401.9)"
* code.coding = http://hl7.org/fhir/sid/icd-9-cm#401.9
//* asserter = Reference(Practitioner/ex-MHV-practitioner-110)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed
* recordedDate = "1995-09-27"
* meta.lastUpdated = "1995-09-27T00:00:00Z"



Instance: ex-labReport-1
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab
Title: "Example 1 of an JFM labReport"
Usage: #example
Description: """
Example from a mock labReportTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "LR MICROBIOLOGY REPORT"
* code = LOINC#79381-0
* subject = Reference(Patient/ex-patient)
* effectiveDateTime = 1995-08-03T14:49:00Z
* issued = 1995-08-03T14:49:00Z
* identifier[+].value = "MI;7049269" 
* identifier[=].system = "https://example.org/LabReportTO.id"
* identifier[=].use = #usual
* conclusion = """
NO OVA OR PARASITES FOUND
"""




Instance:   ex-immunization-1
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-immunization
Title: "Example 1 of an immunization"
Usage: #example
Description:      """
Example from a mock ImmunizationTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #completed
* vaccineCode.text = "COVID-19 (MODERNA), MRNA, LNP-S, PF, 100 MCG/0.5ML DOSE OR 50 MCG/0.25ML DOSE"
* patient = Reference(Patient/ex-patient)
* occurrenceDateTime = 2022-08-08T11:15:28Z
* recorded = 2022-08-08T11:15:28Z
* primarySource = false
* identifier[+].value = "124684" 
* identifier[=].system = "https://example.org/ImmunizationTO.id"
* identifier[=].use = #usual
* note[0].text = "test"


Instance:   ex-patient
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Title:      "Patient example"
Description: "patient example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
// history - http://playgroundjungle.com/2018/02/origins-of-john-jacob-jingleheimer-schmidt.html
// wiki - https://en.wikipedia.org/wiki/John_Jacob_Jingleheimer_Schmidt
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[+].system = "urn:ietf:rfc:3986"
* identifier[=].value = "mailto:JohnSchmidt@example.com"
* name[+].use = #usual
* name[=].family = "Schmidt"
* name[=].given = "John"
* name[+].use = #old
* name[=].family = "Schnidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingle"
* name[=].given[+] = "Heimer"
* name[=].period.end = "1960"
* name[+].use = #official
* name[=].family = "Schmidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingleheimer"
* name[=].period.start = "1960-01-01"
* name[+].use = #nickname
* name[=].family = "Schmidt"
* name[=].given = "Jack"
* gender = #other
* birthDate = "1923-07-25"
* address.state = "WI"
* address.country = "USA"

Instance: ex-pain
InstanceOf: http://hl7.org/fhir/StructureDefinition/vitalsigns
Title: "PAIN of zero"
Description: "simple observation for pain of value zero"
Usage: #example
* status = #final
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code.coding = http://loinc.org#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-patient)
* effectiveDateTime = "2004-01-21T11:01:00Z"
* performer.display = "self"
* valueInteger = 0





Instance: ex-alcoholUse
InstanceOf: Observation
Title: "Observation - SH: Alcohol Use"
Description: """
This example Observation resource to represent alcohol use assessment in a patient summary.

- SLS assessed this as ETHUD
- SLS added Restricted due to the ETHUD assessment
"""
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#ETHUD
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R
* status = #final
* code = http://loinc.org#74013-4
* subject = Reference(Patient/ex-patient)
* performer = Reference(Practitioner/ex-author)
* effectiveDateTime = 2022-06-13
* valueQuantity = 5 '{wine glasses}/d' "glasses of wine"
* encounter = Reference(Encounter/ex-encounter)



Instance:   ex-bloodSugar
InstanceOf: Observation
Title: "Example of an MHV blood sugar R4 observation"
Description: """
holding typical health values

- SLS assessed this as not sensitvie
- SLS added Normal due to not sensitive
"""
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* subject = Reference(Patient/ex-patient)
* performer = Reference(Practitioner/ex-author)
* effectiveDateTime = 2020-12-04T23:50:50-05:00
* valueQuantity = 99 'mg/dL' "mg/dL"
// no comments in this one as comments is only in DSTU2
* note.text = "a bit low, no indicated method, no indicated eating"
* encounter = Reference(Encounter/ex-encounter)



Instance:   ex-bloodPressure
InstanceOf: http://hl7.org/fhir/StructureDefinition/bp
Title: "Example of a blood pressure R4 observation, minimal"
Description:      "holding typical values"
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* status = #final
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code.coding[BPCode] = LOINC#85354-9 
* subject = Reference(Patient/ex-patient)
* performer = Reference(Practitioner/ex-author)
* effectiveDateTime = 2004-12-25T23:50:50-05:00
* component[SystolicBP].code.coding[SBPCode] = LOINC#8480-6 "Systolic blood pressure"
* component[SystolicBP].valueQuantity = 140.0 'mm[Hg]' "mm[Hg]"
* component[DiastolicBP].code.coding[DBPCode] = LOINC#8462-4 "Diastolic blood pressure"
* component[DiastolicBP].valueQuantity = 90.0 'mm[Hg]' "mm[Hg]"
* note.text = "a minimal blood pressure"
* encounter = Reference(Encounter/ex-encounter)



Instance:   ex-weight
InstanceOf: http://hl7.org/fhir/StructureDefinition/bodyweight
Title: "Example of a bodyWeight R4 observation"
Description: """
Sample for demonstration purposes of a common weight Observation
- marked as compliant with IHE.ToDo.bodyWeight profile
- marked as test data
- status of final
- category vital-signs
- code of loinc body weight
- subject of the example patient
- effective time of December 25th, 2004
- weight 185 pounds
- note: a bit heavy
"""
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* status = #final
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code = http://loinc.org#29463-7
* subject = Reference(Patient/ex-patient)
* performer = Reference(Practitioner/ex-author)
* effectiveDateTime = 2004-12-25T23:50:50-05:00
* valueQuantity = 185 '[lb_av]' "pounds"
* note.text = "a bit heavy"
* encounter = Reference(Encounter/ex-encounter)



Instance:   ex-weight-2
InstanceOf: http://hl7.org/fhir/StructureDefinition/bodyweight
Title: "Example of an valid FHIR bodyWeight R4 observation, but not compliant with the profile"
Description: """
Sample for demonstration purposes of a common weight Observation.
- Given that this is not compliant, it is thus not declaring that it is compliant, it is just an Observation
- marked as test data
- status of final
- category of vital-signs
- code of loinc 29463-7 and 3141-9
- also code of snomed 27113001
- subject of the example patient
- linked to an encounter
- effectiveDateTime = March 28, 2016
- weight 280 lbs
- note: a bit heavy, about 280 lbs
"""
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* status = #final
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code.text = "body weight"
* code.coding[BodyWeightCode] = LOINC#29463-7
* subject = Reference(Patient/ex-patient)
* performer = Reference(Practitioner/ex-author)
* encounter = Reference(Encounter/example)
* effectiveDateTime = 2016-03-28
* valueQuantity = 280 '[lb_av]' "pounds"
* note.text = "a bit heavy, about 280 lbs"
* encounter = Reference(Encounter/ex-encounter)


Instance:   ex-encounter
InstanceOf: Encounter
Title: "Example Encounter"
Description:      "holding typical values"
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* subject = Reference(Patient/ex-patient)
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#HH

Instance: ex-practitioner
InstanceOf: Practitioner
Title: "Dummy Practitioner example"
Description: "Dummy Practitioner example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* telecom.system = #email
* telecom.value = "Practitioner@example.com"

Instance: ex-author
InstanceOf: Practitioner
Title: "Dummy Authoring Practitioner example"
Description: "Dummy Practitioner example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* telecom.system = #email
* telecom.value = "Author@example.com"


Instance: ex-clerk
InstanceOf: Practitioner
Title: "Clerk Practitioner example"
Description: "Clerk Practitioner example used as an example Clerk managing Consents"
Usage: #example
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* telecom.system = #email
* telecom.value = "Clerk@example.org"




Instance: ex-organization
InstanceOf: Organization
Title: "Example Organization holding the data"
Description: "The Organization that holds the data, and enforcing any Consents"
Usage: #example
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* active = true
* name = "somewhere org"

Instance: ex-documentreference
InstanceOf: DocumentReference
Title: "DocumentReference Consent Paperwork example"
Description: """
DocumentReference example of the paperwork of the Consent

This is showing an example of a document that is purely text.
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* type = http://loinc.org#64292-6 "Release of information consent"
* subject = Reference(Patient/ex-patient)
* author = Reference(Organization/ex-organization)
* description = "The captured signed document"
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain
* content.attachment.data = "TG9yZW0gaXBzdW0gZG9sb3Igc2l0IGFtZXQsIGNvbnNlY3RldHVyIGFkaXBpc2NpbmcgZWxpdCwgc2VkIGRvIGVpdXNtb2QgdGVtcG9yIGluY2lkaWR1bnQgdXQgbGFib3JlIGV0IGRvbG9yZSBtYWduYSBhbGlxdWEuIFV0IGVuaW0gYWQgbWluaW0gdmVuaWFtLCBxdWlzIG5vc3RydWQgZXhlcmNpdGF0aW9uIHVsbGFtY28gbGFib3JpcyBuaXNpIHV0IGFsaXF1aXAgZXggZWEgY29tbW9kbyBjb25zZXF1YXQuIER1aXMgYXV0ZSBpcnVyZSBkb2xvciBpbiByZXByZWhlbmRlcml0IGluIHZvbHVwdGF0ZSB2ZWxpdCBlc3NlIGNpbGx1bSBkb2xvcmUgZXUgZnVnaWF0IG51bGxhIHBhcmlhdHVyLiBFeGNlcHRldXIgc2ludCBvY2NhZWNhdCBjdXBpZGF0YXQgbm9uIHByb2lkZW50LCBzdW50IGluIGN1bHBhIHF1aSBvZmZpY2lhIGRlc2VydW50IG1vbGxpdCBhbmltIGlkIGVzdCBsYWJvcnVtLg=="
// Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


Instance: ex-consent-advanced-normal-focused-psy-or-sdv
InstanceOf: AdvancedConsent
Title: "Consent allowing NORMAL and focused access to Mental Health or Sexual Health data"
Description: """
Consent allowing NORMAL and focused access to Mental Health or Sexual Health data.

This is the Basic part:
- status is active - so it should be enforced
- scope is privacy 
- category is LOINC 59284-0 Consent
- date indicated when the consent is recorded
- patient is identified
- performer is the patient
- organization is identified
- source indicate a DocumentReference (with included text of the policy)
- policy url is to a base policy
- base provision is #permit -- accepting the policy
- base provision includes TPO so as to be clear this is a consent about TPO

This is the Advanced part:
- Normal data only
- only [Practitioner](Practitioner-ex-practitioner.html) gets Mental Health or Sexual Health data
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* category[+] = http://loinc.org#59284-0 "Consent"
* patient = Reference(Patient/ex-patient)
* dateTime = "2022-06-13"
* performer = Reference(Patient/ex-patient)
* organization = Reference(Organization/ex-organization)
* sourceReference = Reference(DocumentReference/ex-documentreference)
* policy.uri = "http://example.org/policies/basePrivacyConsentPolicy.txt"
* provision.type = #permit
* provision.purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#TREAT
* provision.purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HPAYMT
* provision.purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HOPERAT
* provision.securityLabel[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* provision.provision.type = #permit
* provision.provision.securityLabel[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#PSY
* provision.provision.securityLabel[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#SDV
* provision.provision.actor.reference = Reference(Practitioner/ex-practitioner)
* provision.provision.actor.role = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP


Instance: ex-bundle
InstanceOf: Bundle
Title: "Example Bundle"
Description: "holding typical values"
Usage: #example
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #batch
* entry[+].request.method = #PUT
* entry[=].resource = ex-encounter
* entry[=].request.url = "Encounter/ex-encounter"
* entry[=].fullUrl = "http://example.org/fhir/Encounter/ex-encounter"
* entry[+].request.method = #PUT
* entry[=].resource = ex-bloodPressure
* entry[=].request.url = "Observation/ex-bloodPressure"
* entry[=].fullUrl = "http://example.org/fhir/Observation/ex-bloodPressure"
* entry[+].request.method = #PUT
* entry[=].resource = ex-bloodSugar
* entry[=].request.url = "Observation/ex-bloodSugar"
* entry[=].fullUrl = "http://example.org/fhir/Observation/ex-bloodSugar"
* entry[+].request.method = #PUT
* entry[=].resource = ex-weight
* entry[=].request.url = "Observation/ex-weight"
* entry[=].fullUrl = "http://example.org/fhir/Observation/ex-weight"
* entry[+].request.method = #PUT
* entry[=].resource = ex-alcoholUse
* entry[=].request.url = "Observation/ex-alcoholUse"
* entry[=].fullUrl = "http://example.org/fhir/Observation/ex-alcoholUse"
* entry[+].request.method = #PUT
* entry[=].resource = ex-immunization-1
* entry[=].request.url = "Immunization/ex-immunization-1"
* entry[=].fullUrl = "http://example.org/fhir/Immunization/ex-immunization-1"
* entry[+].request.method = #PUT
* entry[=].resource = ex-labReport-1
* entry[=].request.url = "DiagnosticReport/ex-labReport-1"
* entry[=].fullUrl = "http://example.org/fhir/DiagnosticReport/ex-labReport-1"
* entry[+].request.method = #PUT
* entry[=].resource = ex-condition-1
* entry[=].request.url = "Condition/ex-condition-1"
* entry[=].fullUrl = "http://example.org/fhir/Condition/ex-condition-1"
* entry[+].request.method = #PUT
* entry[=].resource = ex-patient
* entry[=].request.url = "Patient/ex-patient"
* entry[=].fullUrl = "http://example.org/fhir/Patient/ex-patient"
* entry[+].request.method = #PUT
* entry[=].resource = ex-practitioner
* entry[=].request.url = "Practitioner/ex-practitioner"
* entry[=].fullUrl = "http://example.org/fhir/Practitioner/ex-practitioner"
* entry[+].request.method = #PUT
* entry[=].resource = ex-author
* entry[=].request.url = "Practitioner/ex-author"
* entry[=].fullUrl = "http://example.org/fhir/Practitioner/ex-author"
* entry[+].request.method = #PUT
* entry[=].resource = ex-clerk
* entry[=].request.url = "Practitioner/ex-clerk"
* entry[=].fullUrl = "http://example.org/fhir/Practitioner/ex-clerk"
* entry[+].request.method = #PUT
* entry[=].resource = ex-organization
* entry[=].request.url = "Organization/ex-organization"
* entry[=].fullUrl = "http://example.org/fhir/Organization/ex-organization"
* entry[+].request.method = #PUT
* entry[=].resource = ex-consent-advanced-normal-focused-psy-or-sdv
* entry[=].request.url = "Consent/ex-consent-advanced-normal-focused-psy-or-sdv"
* entry[=].fullUrl = "http://example.org/fhir/Consent/ex-consent-advanced-normal-focused-psy-or-sdv"
* entry[+].request.method = #PUT
* entry[=].resource = ex-documentreference
* entry[=].request.url = "DocumentReference/ex-documentreference"
* entry[=].fullUrl = "http://example.org/fhir/DocumentReference/ex-documentreference"


