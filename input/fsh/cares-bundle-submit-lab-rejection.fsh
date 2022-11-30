Instance: CaresSubmitLabRejectionBundleExample
InstanceOf: Bundle
Usage: #example
Title: "Cares Submit Lab Rejection Bundle Example"
Description: "Cares Submit Lab Rejection Bundle Example"
* type = #transaction
* entry[+].fullUrl = "Task/Covid19LabOrderRejectionExample"
* entry[=].resource = Covid19LabOrderRejectionExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Task/Covid19LabOrderRejectionExample"