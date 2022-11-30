Instance: CaresSubmitLabCancellationBundleExample
InstanceOf: Bundle
Usage: #example
Title: "Cares Submit Lab Cancellation Bundle Example"
Description: "Cares Submit Lab Cancellation Bundle Example"
* type = #transaction
* entry[+].fullUrl = "Task/Covid19LabOrderCancellationExample"
* entry[=].resource = Covid19LabOrderCancellationExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Task/Covid19LabOrderCancellationExample"