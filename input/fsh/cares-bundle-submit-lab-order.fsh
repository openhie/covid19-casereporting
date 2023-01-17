Instance: LabOrder
InstanceOf: Bundle
Usage: #example
Title: "Cares Submit Lab Order Bundle Example"
Description: "Cares Submit Lab Order Bundle Example"
* type = #transaction
* entry[+].fullUrl = "Task/LabOrderTaskExample"
* entry[=].resource = LabOrderTaskExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Task/LabOrderTaskExample"

* entry[+].fullUrl = "Location/Covid19ServiceRequestLocationExample"
* entry[=].resource = Covid19ServiceRequestLocationExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Location/Covid19ServiceRequestLocationExample"

* entry[+].fullUrl = "ServiceRequest/Covid19ServiceRequestExample"
* entry[=].resource = Covid19ServiceRequestExample
* entry[=].request.method = #PUT
* entry[=].request.url = "ServiceRequest/Covid19ServiceRequestExample"

* entry[+].fullUrl = "Practitioner/PractitionerExample"
* entry[=].resource = PractitionerExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Practitioner/PractitionerExample"

* entry[+].fullUrl = "Specimen/Covid19SpecimenExample"
* entry[=].resource = Covid19SpecimenExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Specimen/Covid19SpecimenExample"