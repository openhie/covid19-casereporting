Instance: CaresSubmitLabResultBundleExample
InstanceOf: Bundle
Usage: #example
Title: "Cares Submit Lab Result Bundle Example"
Description: "Cares Submit Lab Result Bundle Example"
* type = #transaction
* entry[+].fullUrl = "Task/LabResultTaskExample"
* entry[=].resource = LabResultTaskExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Task/"
* entry[+].fullUrl = "DiagnosticReport/Covid19LabResultsDiagnosticReportExample"
* entry[=].resource = Covid19LabResultsDiagnosticReportExample
* entry[=].request.method = #PUT
* entry[=].request.url = "DiagnosticReport/"
* entry[+].fullUrl = "Practitioner/PractitionerExample"
* entry[=].resource = PractitionerExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Practitioner/"
* entry[+].fullUrl = "Specimen/Covid19SpecimenExample"
* entry[=].resource = Covid19SpecimenExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Specimen/"
* entry[+].fullUrl = "Observation/Covid19TestResultExample"
* entry[=].resource = Covid19TestResultExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Observation/"


