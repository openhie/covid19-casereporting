Instance: EMR
InstanceOf: Bundle
Usage: #example
Title: "Covid19 Case Report - Full Bundle Example"
Description: "Example of a clinical bundle representing a case report"
* type = #transaction
* entry[+].fullUrl = "Patient/Covid19PatientExample"
* entry[=].resource = Covid19PatientExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Patient/Covid19PatientExample"

* entry[+].fullUrl = "Encounter/Covid19AssessmentEncounterExample"
* entry[=].resource = Covid19AssessmentEncounterExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Encounter/Covid19AssessmentEncounterExample"

* entry[+].fullUrl = "Location/Covid19AdmissionLocationExample"
* entry[=].resource = Covid19AdmissionLocationExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Location/Covid19AdmissionLocationExample"

* entry[+].fullUrl = "Observation/Covid19PresentingSymptomsExample"
* entry[=].resource = Covid19PresentingSymptomsExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Observation/Covid19PresentingSymptomsExample"

* entry[+].fullUrl = "Condition/Covid19DiagnosisExample"
* entry[=].resource = Covid19DiagnosisExample 
* entry[=].request.method = #PUT
* entry[=].request.url = "Condition/Covid19DiagnosisExample"

* entry[+].fullUrl = "Condition/Covid19ConditionsOrComorbidityExample"
* entry[=].resource = Covid19ConditionsOrComorbidityExample 
* entry[=].request.method = #PUT
* entry[=].request.url = "Condition/Covid19ConditionsOrComorbidityExample"

* entry[+].fullUrl = "Immunization/Covid19AssessmentVaccinationExample"
* entry[=].resource = Covid19AssessmentVaccinationExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Immunization/Covid19AssessmentVaccinationExample"

* entry[+].fullUrl = "Immunization/Covid19VaccinationExample"
* entry[=].resource = Covid19VaccinationExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Immunization/Covid19VaccinationExample"

* entry[+].fullUrl = "MedicationRequest/Covid19MedicationRequestExample"
* entry[=].resource = Covid19MedicationRequestExample
* entry[=].request.method = #PUT
* entry[=].request.url = "MedicationRequest/Covid19MedicationRequestExample"

* entry[+].fullUrl = "Observation/Covid19VaccineDoseEverReceivedExample"
* entry[=].resource = Covid19VaccineDoseEverReceivedExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Observation/Covid19VaccineDoseEverReceivedExample"

* entry[+].fullUrl = "Observation/Covid19RecoveredOrSymptomsResolvedExample"
* entry[=].resource = Covid19RecoveredOrSymptomsResolvedExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Observation/Covid19RecoveredOrSymptomsResolvedExample"

* entry[+].fullUrl = "Observation/Covid19DeathExample"
* entry[=].resource = Covid19DeathExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Observation/Covid19DeathExample"

* entry[+].fullUrl = "Observation/Covid19LongCovidPostCovidExample"
* entry[=].resource = Covid19LongCovidPostCovidExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Observation/Covid19LongCovidPostCovidExample"