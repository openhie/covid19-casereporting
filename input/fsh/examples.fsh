Instance: Covid19BundleExample
InstanceOf: Bundle
Usage: #example
Title: "Covid19 Case Report - Full Bundle Example"
Description: "Example of a clinical bundle representing a case report"
* type = #document
* entry[+].fullUrl = "Composition/Covid19CompositionExample"
* entry[=].resource = Covid19CompositionExample
* entry[+].fullUrl = "Composition/Covid19PatientExample"
* entry[=].resource = Covid19PatientExample
* entry[+].fullUrl = "Composition/Covid19AssessmentEncounterExample"
* entry[=].resource = Covid19AssessmentEncounterExample
* entry[+].fullUrl = "Composition/Covid19PresentationExample"
* entry[=].resource = Covid19PresentationExample
* entry[+].fullUrl = "Composition/Covid19SymptomExample"
* entry[=].resource = Covid19SymptomExample
//* entry[+].fullUrl = "Composition/Covid19ComorbidityPresentExample"
//* entry[=].resource = Covid19ComorbidityPresentExample
* entry[+].fullUrl = "Composition/Covid19ConditionsComorbidityExample"
* entry[=].resource = Covid19ConditionsComorbidityExample
* entry[+].fullUrl = "Composition/Covid19DiagnosisExample"
* entry[=].resource = Covid19DiagnosisExample 
* entry[+].fullUrl = "Composition/Covid19VaccineDoseReceivedExample"
* entry[=].resource = Covid19VaccineDoseReceivedExample
* entry[+].fullUrl = "Composition/Covid19AssessmentVaccinationExample"
* entry[=].resource = Covid19AssessmentVaccinationExample
* entry[+].fullUrl = "Composition/Covid19LabOrderExample"
* entry[=].resource = Covid19LabOrderExample
* entry[+].fullUrl = "Composition/Covid19SpecimenExample"
* entry[=].resource = Covid19SpecimenExample
* entry[+].fullUrl = "Composition/Covid19LabOrderCancellationExample"
* entry[=].resource = Covid19LabOrderCancellationExample
* entry[+].fullUrl = "Composition/Covid19LabResultsDiagnosticReportExample"
* entry[=].resource = Covid19LabResultsDiagnosticReportExample
* entry[+].fullUrl = "Composition/Covid19TestResultExample"
* entry[=].resource = Covid19TestResultExample
* entry[+].fullUrl = "Composition/Covid19VaccinationExample"
* entry[=].resource = Covid19VaccinationExample
* entry[+].fullUrl = "Composition/Covid19VaccinationAppointmentExample"
* entry[=].resource = Covid19VaccinationAppointmentExample

Instance: Covid19CompositionExample
InstanceOf: Covid19Composition
Usage: #example
Title: "Covid19 Case Report Composition Example"
Description: "Basic Composition example"
* status = #final
* identifier.system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-case-report"
* identifier.value = "1111"
* date = "2022-08-04"
* author = Reference(Covid19OrganizationExample)
* title = "Covid19 Case Report"

* section[+].title = "Client registration"
* section[=].code = CSCaseReportSections#CLIENT-REGISTRATION
* section[=].entry[+] = Reference(Covid19PatientExample)

* section[+].title = "Covid19 Assessment Encounter"
* section[=].code = CSCaseReportSections#COVID-ASSESSMENT
* section[=].entry[+] = Reference(Covid19AssessmentEncounterExample)
* section[=].entry[+] = Reference(Covid19ReasonforAssessmentExample)
* section[=].entry[+] = Reference(Covid19PresentationExample)
* section[=].entry[+] = Reference(Covid19SymptomExample)
//* section[=].entry[+] = Reference(Covid19ComorbidityPresentExample) 
//* section[=].entry[+] = Reference(Covid19ConditionsComorbidityExample) 
* section[=].entry[+] = Reference(Covid19DiagnosisExample)   
* section[=].entry[+] = Reference(HIVDiagnosisExample) 
* section[=].entry[+] = Reference(Covid19AssessmentVaccinationExample) 
* section[=].entry[+] = Reference(Covid19PatientOutcomeExample) 
 
* section[+].title = "Lab Order Management"
* section[=].code = CSCaseReportSections#LABORDER-MANAGEMENT
* section[=].entry[+] = Reference(Covid19LabOrderExample)
* section[=].entry[+] = Reference(Covid19SpecimenExample)  
* section[=].entry[+] = Reference(Covid19LabOrderCancellationExample ) 
* section[=].entry[+] = Reference(Covid19LabResultsExamples) 

* section[+].title = "Covid 19 Vaccination"
* section[=].code = CSCaseReportSections#COVID-VACCINATION
* section[=].entry[+] = Reference(Covid19VaccinationExample)
* section[=].entry[+] = Reference(Covid19VaccinationAppointmentExample)

Instance: Covid19OrganizationExample
InstanceOf: Covid19Organization
Usage: #example
Title: "Covid19 Organization example"
Description: "Covid19 Organization example"
* address[+].country = "CARES country"
* address[=].state = "CARES state 1"
* address[=].district = "CARES district 1"
* address[=].city = "CARES city 1"
* address[=].line[+] = "CARES line 1"
* address[=].line[+] = "CARES line 2"
* address[=].line[+] = "CARES line 3"
* address[=].postalCode = "CARES postal code"
* name = "Covid19 Organization"
* identifier[+].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-organization"
* identifier[=].value = "facility1"

Instance: Covid19PatientExample
InstanceOf: Covid19Patient
Usage: #example
Title: "Covid19 Patient example"
Description: "Covid19 Patient example"
* active = true
* name.use = #official
* name.given = "Jane"
* name.family = "Smith"
* gender = #female
* extension[keyPopulation].valueCodeableConcept = #GENERAL-POPULATION
* birthDate = "1986-06-04"
* telecom.system = #phone
* telecom.value = "+27825556666"
* address.country = "South Africa"
* address.state = "Western Province"
* extension[clientWardDivision].valueString = "Division 9087"
* address.district = "City of Cape Town"
* address.city = "Cape Town"
* identifier[passport].value = "PASSPORT1234567"
* identifier[passport].system = "http://openhie.org/fhir/covid19-casereporting/identifier/passport"
* identifier[national].value = "NAT1234567"
* identifier[national].system = "http://openhie.org/fhir/covid19-casereporting/identifier/nid"
* identifier[pos].value = "EMR1234567"
* identifier[pos].system = "http://openhie.org/fhir/covid19-casereporting/identifier/facility1"
* managingOrganization = Reference(Covid19OrganizationExample)
* contact[0].relationship = #N   //https://hl7.org/fhir/valueset-patient-contactrelationship.html
* contact[0].name.family = "John"
* contact[0].telecom.system = #phone

Instance: Covid19AssessmentEncounterExample
InstanceOf: Covid19AssessmentEncounter
Usage: #example
Title: "Covid19 Assessment Encounter example"
Description: "Covid19 Assessment Encounter  example"
* class = #SS                 //#TODO - Mandatory base resource field, make sure about this
* status = #finished
* period.start =  "2022-07-28"  //Date of assessment
* subject = Reference(Covid19PatientExample) //Patient reference
* period.end  =  "2022-08-15"  //Date of death
* reasonCode.coding.code = #Other
* reasonCode.text = "Other specified details"
* diagnosis.condition = Reference(Covid19PresentationExample)

Instance: Covid19VaccineDoseReceivedExample
InstanceOf: Covid19VaccineDoseReceived
Usage: #example
Title: "Covid19 Vaccine Dose Received example"
Description: "Covid19 Vaccine Dose Received example"
* valueCodeableConcept = #Yes
* status = #final
* code = $LNC#75618-9 // #TODO
* encounter = Reference(Covid19AssessmentEncounterExample) 

Instance: Covid19PresentationExample
InstanceOf: Covid19Presentation
Usage: #example
Title: "Covid19 Presentation example"
Description: "Covid19 Presentation example"
* encounter = Reference(Covid19AssessmentEncounterExample) 
* subject = Reference(Covid19PatientExample) 
* evidence.code = $SCT#84387000

Instance: Covid19SymptomExample
InstanceOf: Covid19Symptom
Usage: #example
Title: "Covid19 Symptom example"
Description: "Covid19 Symptom example"
* encounter = Reference(Covid19AssessmentEncounterExample) 
* subject = Reference(Covid19PatientExample) 
* status = #final
* code = $SCT#21522001 
* investigation.code = #JointPain

/*
Instance: Covid19ComorbidityPresentExample
InstanceOf: Observation
Usage: #example
Title: "Covid19 Comorbidity Present example"
Description: "Covid19 Comorbidity Present example"
* encounter = Reference(Covid19AssessmentEncounterExample) 
* subject = Reference(Covid19PatientExample) 
* status = #final
* code = $LNC#83243-6  
* valueCodeableConcept = #Yes
* valueDateTime = "2022-07-28"
*/

Instance: Covid19ConditionsComorbidityExample
InstanceOf: Covid19ConditionsComorbidity
Usage: #example
Title: "Covid19 Conditions or comorbidity example"
Description: "Covid19 Conditions or comorbidity example"
* subject = Reference(Covid19PatientExample) 
* encounter = Reference(Covid19AssessmentEncounterExample) 
* code = #Other
* note.text = "Other condition details specified here"

Instance: Covid19DiagnosisExample
InstanceOf: Covid19Diagnosis
Usage: #example
Title: "Covid19 Diagnosis Example"
Description: "Covid19 Diagnosis Example"
* code = #Confirmed
* recordedDate = "2022-07-28"
* subject = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample)
* clinicalStatus = $SCT#410605003 

Instance: Covid19MedicationRequestExample
InstanceOf: Covid19MedicationRequest
Usage: #example
Title: "Covid19 Treatment dispensed or prescribed example"
Description: "Covid19 Treatment dispensed or prescribed example"
* status = #active
* intent = #proposal
* subject = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample)
* medicationCodeableConcept = #Paxlovid

Instance: HIVDiagnosisExample
InstanceOf: HIVDiagnosis
Usage: #example
Title: "HIV Condition example"
Description: "."
* clinicalStatus = #active
* verificationStatus = #confirmed
* code = $SCT#86406008
* subject = Reference(Covid19PatientExample)
* recordedDate = "2021-05-18"
* identifier[+].system = "http://openhie.org/fhir/hiv-casereporting/identifier/hiv-diagnosis"
* identifier[=].value = "abc"

Instance: Covid19AssessmentVaccinationExample
InstanceOf: Covid19AssessmentVaccination
Usage: #example
Title: "Covid19 Vaccine Type Administered example"
Description: "Covid19 Vaccine Type Administered example"
* patient = Reference(Covid19PatientExample) 
* encounter = Reference(Covid19AssessmentEncounterExample) 
* status = #completed
* vaccineCode = $ICD#XM8NQ0 
* occurrenceDateTime = "2022-07-28"
* protocolApplied.doseNumberPositiveInt = 1
* protocolApplied.series = #Booster

Instance: Covid19LabOrderExample
InstanceOf: Covid19LabOrder
Usage: #example
Title: "Covid19 Lab Order example"
Description: "Covid19 Lab Order example"
* identifier.value = "ORDERNR109191879"
* identifier.system = "http://covid19laborder.org/order"
* encounter = Reference(Covid19AssessmentEncounterExample) 
* subject = Reference(Covid19PatientExample) 
* reasonCode  = #Surveillance
* authoredOn  = "2022-07-28"
* status = #Completed
* code =  $LNC#94558-4 
* requester = Reference(Covid19OrganizationExample)
* locationReference = Reference(Covid19Laboratory) 
* specimen = Reference(Covid19SpecimenExample)

Instance: Covid19SpecimenExample
InstanceOf: Covid19Specimen
Usage: #example
Title: "Covid19 Specimen example"
Description: "Covid19 Specimen example"
* identifier.value = "SPECIMEN109191879"
* identifier.system = "http://covid19laborder.org/specimen"
* collection.collectedDateTime = "2022-07-28"
* type = $SCT#258500001  

Instance: Covid19LaboratoryExample
InstanceOf: Organization
Usage: #example
Title: "Covid19 Laboratory"
Description: "Covid19 Laboratory testing the specimen"
* identifier.id = "Lab001"

Instance: Covid19LabOrderCancellationExample
InstanceOf: Covid19LabOrderCancellation
Usage: #example
Title: "Covid19 Lab Order Cancellation  example"
Description: "Covid19 Lab Order Cancellation Task example"
* basedOn = Reference(Covid19LabOrderExample)
* executionPeriod.start = "2022-07-28"
* statusReason = #Duplicate

Instance: Covid19LabResultsDiagnosticReportExample
InstanceOf: Covid19LabResultsDiagnosticReport
Usage: #example
Title: "Covid19 Lab Results Diagnostic Report example"
Description: "Covid19 Lab Results Diagnostic Report example"
* code = $LNC#100156-9  
* basedOn = Reference(Covid19LabOrder) 
* subject = Reference(Covid19PatientExample) 
* identifier.id = "12341324"
* effectiveDateTime = "2022-07-28"
* conclusionCode.coding.code =  #Positive
* status = #final 
* result = Reference(Covid19TestResultExample)

Instance: Covid19TestResultExample
InstanceOf: Covid19TestResult
Usage: #example
Title: "Covid19 Lab Results example"
Description: "Covid19 Lab Results example"
* status = #final
* code = $LNC#94558-4
* valueDateTime = "2022-07-28"
* valueCodeableConcept = $SCT#10828004

Instance: Covid19VaccinationExample
InstanceOf: Covid19Vaccination
Usage: #example
Title: "Covid19 Vaccination example"
Description: "Covid19 Vaccination example"
* status = #final
* patient = Reference(Covid19PatientExample)
* occurrenceDateTime = "2022-07-28"
* protocolApplied.doseNumberPositiveInt = 1    //#TODO : min=1, max = 9
* protocolApplied.series = #Booster
* expirationDate = "2022-12-28"
* vaccineCode =   #Astrazeneca
* lotNumber = "1"

Instance: Covid19VaccinationAppointmentExample
InstanceOf: Covid19VaccinationAppointment
Usage: #example
Title: "Covid19 Vaccination Appointment example"
Description: "Covid19 Vaccination Appointment example"
* participant.actor  = Reference(Covid19PatientExample)
* participant.status = #tentative
* start = "2015-02-07T13:28:17.239+02:00"
* status = #proposed