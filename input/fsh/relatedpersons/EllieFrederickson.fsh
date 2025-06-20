// Related Person Resource for Ellie Frederickson (Wife and Portal Proxy)
Instance: EllieFrederickson
InstanceOf: RelatedPerson
Title: "Related Person - Ellie Frederickson"
Description: "Related person information for Ellie Frederickson, spouse and portal proxy"

* identifier[0].system = "http://shift.github.io/demo/relatedperson-identifier"
* identifier[0].value = "RP-56789"

* patient.reference = "urn:uuid:CarlFrederickson"
* relationship[0] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#WIFE "wife"
* relationship[+] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RESPRSN "responsible party"
* name.family = "Frederickson"
* name.given = "Ellie" 