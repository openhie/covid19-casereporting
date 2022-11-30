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
* identifier[=].value = "facility"

Instance: Covid19PatientExample
InstanceOf: Covid19Patient
Usage: #example
Title: "Covid19 Patient example"
Description: "Covid19 Patient example"
* identifier[passport].value = "PASSPORT1234567"
* identifier[passport].system = "http://openhie.org/fhir/covid19-casereporting/identifier/passport"
* identifier[national].value = "NAT1234567"
* identifier[national].system = "http://openhie.org/fhir/covid19-casereporting/identifier/nid"
* identifier[pos].value = "EMR1234567"
* identifier[pos].system = "http://openhie.org/fhir/covid19-casereporting/identifier/facility"
* active = true
* name.use = #official
* name.family = "Smith"
* name.given[0] = "Jane"
* name.given[1] = "Maria"
* telecom.system = #phone
* telecom.value = "+27825556666"
* telecom.system = #email
* telecom.value = "someone@example.com"
* gender = #female
* birthDate = "1986-06-04"
* address.country = "South Africa"
* address.state = "Western Province"
* address.district = "City of Cape Town"
* address.city = "Cape Town"
* contact[0].relationship.coding.code = #N
* contact[0].relationship.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0131"
* contact[0].name.family = "Doe"
* contact[0].telecom.system = #phone
* contact[0].telecom.value = "+27829999999"
* managingOrganization = Reference(Covid19OrganizationExample)

Instance: Covid19AssessmentEncounterExample
InstanceOf: Covid19AssessmentEncounter    
Usage: #example
Title: "Covid19 Assessment Encounter example"
Description: "Covid19 Assessment Encounter example"
* extension[nextVisit].valueDateTime = "2022-07-28" 
* extension[extCovid19EverHospitalised].valueCodeableConcept = $SCT#373066001
* extension[extCovid19DateLastHospitalised].valueDateTime = "2022-07-28"
* status = #finished
* class.code = #SS
* class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* subject = Reference(Covid19PatientExample)
* period.start = "2022-07-28"
* period.end  = "2022-08-15"
* reasonCode = $SCT#428792000
* location.location = Reference(Covid19AdmissionLocationExample)
* location.physicalType = $SCT#225746001

Instance: Covid19VaccineDoseEverReceivedExample
InstanceOf: Covid19VaccineDoseEverReceived
Usage: #example
Title: "Covid19 Vaccine Dose Received example"
Description: "Covid19 Vaccine Dose Received example"
* status = #final
* code = $SCT#373066001
* subject = Reference(Covid19PatientExample) 
* encounter = Reference(Covid19AssessmentEncounterExample) 

Instance: Covid19PresentingSymptomsExample
InstanceOf: Covid19PresentingSymptoms
Usage: #example
Title: "Covid19 Symptom example"
Description: "Covid19 Symptom example"
* status = #final
* subject = Reference(Covid19PatientExample) 
* encounter = Reference(Covid19AssessmentEncounterExample)
* code = $SCT#21522001 
* effectiveDateTime = "2022-07-28"  
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "Other symptoms here"
* note.time = "2015-02-07T13:28:17-05:00"

Instance: Covid19ConditionsOrComorbidityExample
InstanceOf: Covid19ConditionsOrComorbidity
Usage: #example
Title: "Covid19 Conditions or comorbidity example"
Description: "Covid19 Conditions or comorbidity example"
* extension[extCovid19ConditionsOrComorbiditiesPresent].valueCodeableConcept = $SCT#373066001
* code = $SCT#49601007
* subject = Reference(Covid19PatientExample) 
* encounter = Reference(Covid19AssessmentEncounterExample) 
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "Other conditionss or comorbidities here"
* note.time = "2015-02-07T13:28:17-05:00"
  

Instance: Covid19DiagnosisExample
InstanceOf: Covid19Diagnosis
Usage: #example
Title: "Covid19 Diagnosis Example"
Description: "Covid19 Diagnosis Example"
* verificationStatus.coding.code = #confirmed
* verificationStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
* subject = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample)
* onsetDateTime = "2022-07-28"
* recordedDate = "2022-07-28"
* evidence.code = $SCT#84387000
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "additional notes here"
* note.time = "2015-02-07T13:28:17-05:00"

Instance: Covid19MedicationRequestExample
InstanceOf: Covid19MedicationRequest
Usage: #example
Title: "Covid19 Treatment dispensed or prescribed example"
Description: "Covid19 Treatment dispensed or prescribed example"
* status = #active
* intent = #order
* subject = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample)
* medicationCodeableConcept = $RXN#2599543
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "additional notes here"
* note.time = "2015-02-07T13:28:17-05:00" //Medication Request Date

Instance: Covid19AssessmentVaccinationExample
InstanceOf: Covid19AssessmentVaccination
Usage: #example
Title: "Covid19 Vaccine Type Administered example"
Description: "Covid19 Vaccine Type Administered example"
* status = #completed
* vaccineCode = $ICD#XM8NQ0
* patient = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample) 
* occurrenceDateTime = "2022-07-28"
* reportOrigin.coding.system = "http://openhie.org/fhir/covid19-casereporting/CodeSystem/cs-source-of-info"
* reportOrigin.coding.code = #VaccineCard
* lotNumber = "1"
* expirationDate = "2022-12-28"
* protocolApplied.series = "Primary"
* protocolApplied.doseNumberPositiveInt = 1 
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "Some other text..."
* note.time = "2015-02-07T13:28:17-05:00"

Instance: Covid19LabOrderExample
InstanceOf: Covid19LabOrder
Usage: #example
Title: "Covid19 Lab Order example"
Description: "Covid19 Lab Order example"
* identifier.value = "ORDER12345"
* identifier.system = "http://covid19laborder.org/order"
* status = #completed
* intent = #order
* code = $LNC#94558-4
* subject = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample)
* occurrenceDateTime = "2012-01-05"
* requester = Reference(PractitionerExample)
* locationReference = Reference(Covid19ServiceRequestLocationExample)
* doNotPerform = false
* reasonCode = $SCT#397933008
* specimen = Reference(Covid19SpecimenExample)
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "additional notes here"
* note.time = "2015-02-07T13:28:17-05:00"

Instance: Covid19SpecimenExample
InstanceOf: Covid19Specimen
Usage: #example
Title: "Covid19 Specimen example"
Description: "Covid19 Specimen example"
* identifier.value = "SPECIMEN109191879"
* identifier.system = "http://covid19laborder.org/specimen"
* collection.collectedDateTime = "2022-07-28"
* type = $SCT#258500001
* subject = Reference(Covid19PatientExample)
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "additional notes here"
* note.time = "2015-02-07T13:28:17-05:00"

Instance: Covid19SpecimenLabResultExample
InstanceOf: Covid19Specimen
Usage: #example
Title: "Covid19 Specimen example"
Description: "Covid19 Specimen example"
* identifier.value = "SPECIMEN109191879"
* identifier.system = "http://covid19laborder.org/specimen"
* collection.collectedDateTime = "2022-07-28"
* type = $SCT#258500001  
* subject = Reference(Covid19PatientExample)
* processing.timeDateTime = "2022-07-28"
* receivedTime = "2022-07-28T13:28:17-05:00" 
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "additional notes here"
* note.time = "2015-02-07T13:28:17-05:00" //Covdi19SpecimenNoteDate

Instance: Covid19LabOrderCancellationExample
InstanceOf: Task
Usage: #example
Title: "Covid19 Lab Order Cancellation  example"
Description: "Covid19 Lab Order Cancellation Task example"
* basedOn = Reference(Covid19LabOrderExample)
* executionPeriod.end = "2022-07-28"
* statusReason = $SCT#281264009 
* requester = Reference(Covid19OrganizationExample)
* owner = Reference(Covid19OrganizationExample)
* lastModified = "2015-02-07"
* intent = #order
* status = #cancelled
* identifier.system = "http://openhie.org/fhir/covid19-casereporting/lab-integration/test-order-number"
* identifier.value = "ORDER12345"

Instance: Covid19LabResultsDiagnosticReportExample
InstanceOf: DiagnosticReport
Usage: #example
Title: "Covid19 Lab Results Diagnostic Report example"
Description: "Covid19 Lab Results Diagnostic Report example"
* code = $LNC#94558-4 
* basedOn = Reference(Covid19LabOrderExample) 
* subject = Reference(Covid19PatientExample) 
* status = #final 
* result = Reference(Covid19TestResultExample)
* performer = Reference(PractitionerExample)
* conclusion = "Some textual conclusion"

Instance: Covid19TestResultExample
InstanceOf: Covid19TestResult
Usage: #example
Title: "Covid19 Lab Results example"
Description: "Covid19 Lab Results example"
* status = #final
* code = $LNC#94558-4
* subject = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample)
* effectiveDateTime = "2022-07-28"
* valueCodeableConcept = $SCT#10828004

Instance: Covid19VaccinationExample
InstanceOf: Covid19Vaccination
Usage: #example
Title: "Covid19 Vaccination example"
Description: "Covid19 Vaccination example"
* status = #completed
* vaccineCode = $ICD#XM4YL8
* patient = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample) 
* occurrenceDateTime = "2022-07-28"
* reportOrigin.coding.system = "http://openhie.org/fhir/covid19-casereporting/CodeSystem/cs-source-of-info"
* reportOrigin.coding.code = #VaccineCard
* lotNumber = "1"
* expirationDate = "2022-12-28"
* protocolApplied.series = "Booster"
* protocolApplied.doseNumberPositiveInt = 1 
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "Some other text..."
* note.time = "2015-02-07T13:28:17-05:00"


Instance: LabOrderTaskExample
InstanceOf: Task
Usage: #example
Title: "Lab Order example"
Description: "Lab Order example"
* basedOn = Reference(Covid19LabOrderExample)
* requester = Reference(Covid19OrganizationExample)
* owner = Reference(Covid19OrganizationExample)
* identifier.system = "http://openhie.org/fhir/covid19-casereporting/lab-integration/test-order-number"
* identifier.value = "ORDER12345"
* intent = #order
* status = #requested
* lastModified = "2015-02-07"
* executionPeriod.start = "2022-11-09"

Instance: PractitionerExample
InstanceOf: Practitioner
Usage: #example
Title: "Practitioner example"
Description: "Practitioner example"
* name.given = "Joe"
* name.family = "Smith"
* telecom.system = #phone
* telecom.value = "27 53 765 2509"

Instance: LabResultTaskExample
InstanceOf: Task
Usage: #example
Title: "Lab Result Task example"
Description: "Lab Result Task example"
* basedOn = Reference(Covid19LabOrderExample)
* requester = Reference(Covid19OrganizationExample)
* owner = Reference(Covid19OrganizationExample)
* identifier.system = "http://openhie.org/fhir/covid19-casereporting/lab-integration/test-order-number"
* identifier.value = "ORDER12345"
* intent = #order
* status = #completed
* lastModified = "2015-02-07"
* output.type.coding.system = "http://openhie.org/fhir/covid19-casereporting/lab-integration/task-output"
* output.type.coding.code = #result 
* output.valueReference = Reference(Covid19LabResultsDiagnosticReportExample)
* executionPeriod.start = "2022-11-09"

Instance: Covid19ServiceRequestLocationExample
InstanceOf: Covid19ServiceRequestLocation
Usage: #example
Title: "Covid19 Service Request Location example"
Description: "Covid19 Service Request Location example"
* name = "Covid19 Location"
* address.country = "Cares country 1"
* address.state = "Cares state 1"
* address.district = "Cares district 1"
* address.city = "Cares city 1"

Instance: Covid19AdmissionLocationExample
InstanceOf: Covid19AdmissionLocation
Usage: #example
Title: "Covid19 Admission Location example"
Description: "Covid19 Admission Location example"
* name = "Covid19 Location"
* address.country = "Cares country 1"
* address.state = "Cares state 1"
* address.district = "Cares district 1"
* address.city = "Cares city 1"

Instance: Covid19RecoveredOrSymptomsResolvedExample
InstanceOf: Covid19RecoveredOrSymptomsResolved
Usage: #example
Title: "Covid19 Recovered Or Symptoms Resolved"
Description: "Covid19 Recovered Or Symptoms Resolved"
* status = #final
* code = $SCT#370996005
* subject = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample)
* effectiveDateTime =  "2022-11-09"
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "Some other text..."
* note.time = "2015-02-07T13:28:17-05:00"

Instance: Covid19DeathExample
InstanceOf: Covid19Death
Usage: #example
Title: "Covid19 Death"
Description: "Covid19 Death"
* status = #final
* code = $SCT#419099009
* subject = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample)
* effectiveDateTime =  "2022-11-09"
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "Some other text..."
* note.time = "2015-02-07T13:28:17-05:00"

Instance: Covid19LongCovidPostCovidExample
InstanceOf: Covid19LongCovidPostCovid
Usage: #example
Title: "Covid19 Long Covid / Post-Covid"
Description: "Covid19 Long Covid / Post-Covid"
* status = #final
* code = $SCT#1119303003
* subject = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample)
* effectiveDateTime =  "2022-11-09"
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "Some other text..."
* note.time = "2015-02-07T13:28:17-05:00"