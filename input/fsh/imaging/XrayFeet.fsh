// X-Ray Bilateral Feet DiagnosticReport
Instance: CarlFredericksonXrayFeet
InstanceOf: DiagnosticReport
Title: "Diagnostic Report - Bilateral Feet X-Ray"
Description: "X-ray, bilateral feet, weightbearing, 2 views: dorsoplantar (DP) and axial for Carl Frederickson"

* identifier[0].system = "http://example.com/demo/diagnosticreport-identifier"
* identifier[0].value = "XRAY-23456"

* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"
* code.coding[0] = http://www.ama-assn.org/go/cpt#73620 "Radiologic examination, foot; 2 views"
* code.text = "X-ray, bilateral feet, weightbearing, 2 views: dorsoplantar (DP) and axial"
* subject = Reference(CarlFrederickson)
* effectiveDateTime = "2022-11-15T10:30:00Z"
* issued = "2022-11-15T14:45:00Z"
* performer.display = "Dr. Robert Smith, Radiologist"
* conclusion = "Bilateral bunions with hallux valgus deformity, moderate degenerative changes in the first metatarsophalangeal joint bilaterally, more pronounced on the right." 