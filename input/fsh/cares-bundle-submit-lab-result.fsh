Instance: CaresSubmitLabResultBundleExample
InstanceOf: Bundle
Usage: #example
Title: "Cares Submit Lab Result Bundle Example"
Description: "Cares Submit Lab Result Bundle Example"
* type = #transaction
* entry[+].fullUrl = "Task/LabResultTaskExample"
* entry[=].resource = LabResultTaskExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Task/LabResultTaskExample"

* entry[+].fullUrl = "DiagnosticReport/Covid19LabResultsDiagnosticReportExample"
* entry[=].resource = Covid19LabResultsDiagnosticReportExample
* entry[=].request.method = #PUT
* entry[=].request.url = "DiagnosticReport/Covid19LabResultsDiagnosticReportExample"

* entry[+].fullUrl = "Practitioner/PractitionerExample"
* entry[=].resource = PractitionerExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Practitioner/PractitionerExample"

* entry[+].fullUrl = "Specimen/Covid19SpecimenLabResultExample"
* entry[=].resource = Covid19SpecimenLabResultExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Specimen/Covid19SpecimenLabResultExample"

* entry[+].fullUrl = "Observation/Covid19TestResultExample"
* entry[=].resource = Covid19TestResultExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Observation/Covid19TestResultExample"


