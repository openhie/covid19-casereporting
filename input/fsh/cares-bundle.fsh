Instance: CaresBundleExample
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

* entry[+].fullUrl = "Condition/Covid19DiagnosisExample"
* entry[=].resource = Covid19DiagnosisExample 
* entry[=].request.method = #PUT
* entry[=].request.url = "Condition/Covid19DiagnosisExample"

* entry[+].fullUrl = "Immunization/Covid19AssessmentVaccinationExample"
* entry[=].resource = Covid19AssessmentVaccinationExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Immunization/Covid19AssessmentVaccinationExample"

* entry[+].fullUrl = "Immunization/Covid19VaccinationExample"
* entry[=].resource = Covid19VaccinationExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Immunization/Covid19VaccinationExample"

* entry[+].fullUrl = "Observation/Covid19DeathExample"
* entry[=].resource = Covid19DeathExample
* entry[=].request.method = #PUT
* entry[=].request.url = "Immunization/Covid19DeathExample"