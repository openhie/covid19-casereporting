Instance: CaresSubmitLaborderBundleExample
InstanceOf: Bundle
Usage: #example
Title: "Cares Submit Lab Order Bundle Example"
Description: "Cares Submit Lab Order Bundle Example"
* type = #transaction
* entry[+].fullUrl = "Task/LabOrderTaskExample"
* entry[=].resource = LabOrderTaskExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Task/LabOrderTaskExample"
* entry[+].fullUrl = "Encounter/Covid19AssessmentEncounterExample"
* entry[=].resource = Covid19AssessmentEncounterExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Encounter/Covid19AssessmentEncounterExample"
* entry[+].fullUrl = "Location/Covid19ServiceRequestLocationExample"
* entry[=].resource = Covid19ServiceRequestLocationExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Location/Covid19ServiceRequestLocationExample"
* entry[+].fullUrl = "ServiceRequest/Covid19LabOrderExample"
* entry[=].resource = Covid19LabOrderExample
* entry[=].request.method = #PUT
* entry[=].request.url = "ServiceRequest/Covid19LabOrderExample"
* entry[+].fullUrl = "Practitioner/PractitionerExample"
* entry[=].resource = PractitionerExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Practitioner/PractitionerExample"
* entry[+].fullUrl = "Patient/Covid19PatientExample"
* entry[=].resource = Covid19PatientExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Patient/Covid19PatientExample"
* entry[+].fullUrl = "Specimen/Covid19SpecimenExample"
* entry[=].resource = Covid19SpecimenExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Specimen/Covid19SpecimenExample"