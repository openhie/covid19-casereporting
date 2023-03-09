Instance: Covid19OrganizationExample
InstanceOf: Covid19Organization
Usage: #example
Title: "Covid19 Organization example"
Description: "Covid19 Organization example"
* identifier[XX].value = "facility1"
* identifier[XX].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-organization"
* identifier[XX].type.coding.code = #XX
* identifier[XX].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* name = "Covid19 Organization"
* address[0].country = "Country"
* address[0].state = "State"
* address[0].district = "District"
* address[0].city = "City"
* address[0].line[0] = "Some building number"
* address[0].line[0] = "Some street name"
* address[0].line[0] = "Some additional address info"
* address[0].postalCode = "Some postal code"

Instance: Covid19PatientExample
InstanceOf: Covid19Patient
Usage: #example
Title: "Covid19 Patient example"
Description: "Covid19 Patient example"
* identifier[PPN].value = "PASSPORT1234567"
* identifier[PPN].system = "http://openhie.org/fhir/covid19-casereporting/identifier/passport"
* identifier[PPN].type.coding.code = #PPN
* identifier[PPN].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[NID].value = "NAT1234567"
* identifier[NID].system = "http://openhie.org/fhir/covid19-casereporting/identifier/nid"
* active = true
* name.use = #official
* name.family = "Smith"
* name.given[0] = "Jane"
* name.given[1] = "Maria"
* telecom[0].system = #phone
* telecom[0].value = "+27825556666"
* telecom[1].system = #email
* telecom[1].value = "someone@example.com"
* gender = #female
* birthDate = "1986-06-04"
* address.country = "South Africa"
* address.state = "Western Province"
* address.district = "City of Cape Town"
* address.city = "Cape Town"
* contact[0].relationship = #N
* contact[0].relationship.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0131"
* contact[0].name.given = "John" 
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
//* reasonCode = $SCT#397933008
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
* performer = Reference(Covid19OrganizationExample)

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
* performer = Reference(Covid19OrganizationExample)
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
* verificationStatus = #confirmed
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
* note.time = "2015-02-07T13:28:17-05:00"

Instance: Covid19AssessmentVaccinationExample
InstanceOf: Covid19AssessmentVaccination
Usage: #example
Title: "Covid19 Vaccine Type Administered example"
Description: "Covid19 Vaccine Type Administered example"
* status = #completed
* vaccineCode = $ICD11#XM8NQ0
* patient = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample) 
* occurrenceDateTime = "2022-07-28"
* reportOrigin.coding.system = "http://openhie.org/fhir/covid19-casereporting/CodeSystem/cs-source-of-info"
* reportOrigin = #VaccineCard
* lotNumber = "1"
* expirationDate = "2022-12-28"
* protocolApplied.series = "Primary"
* protocolApplied.doseNumberPositiveInt = 1 
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "Some other text..."
* note.time = "2015-02-07T13:28:17-05:00"

Instance: Covid19ServiceRequestExample
InstanceOf: Covid19ServiceRequest
Usage: #example
Title: "Covid19 Lab Order example"
Description: "Covid19 Lab Order example"
* identifier[PLAC].value = "ORDER12345"
* identifier[PLAC].system = "http://openhie.org/fhir/covid19-casereporting/identifier/lab-order-identifier"
* identifier[PLAC].type.coding.code = #PLAC
* identifier[PLAC].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* status = #completed
* intent = #order
* code = $LNC#94558-4
* subject = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample)
* occurrenceDateTime = "2012-01-05"
* requester = Reference(PractitionerExample)
//* locationReference = Reference(Covid19ServiceRequestLocationExample)
* performer = Reference(Covid19ServiceRequestLocationExample)
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
* identifier[USID].value = "abc123"
* identifier[USID].system = "http://openhie.org/fhir/covid19-casereporting/identifier/specimen-id" (exactly)
* identifier[USID].type.coding.code = #USID
* identifier[USID].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
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

Instance: Covid19LabResultsDiagnosticReportExample
InstanceOf: Covid19DiagnosticReport
Usage: #example
Title: "Covid19 Lab Results Diagnostic Report example"
Description: "Covid19 Lab Results Diagnostic Report example"
* basedOn = Reference(Covid19ServiceRequestExample)
* status = #final
* code = $LNC#94558-4 
* subject = Reference(Covid19PatientExample) 
* performer = Reference(PractitionerExample)
* result = Reference(Covid19TestResultExample)
* conclusion = "Some conclusion text"

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
* performer = Reference(Covid19OrganizationExample)
* valueCodeableConcept = $SCT#10828004

Instance: Covid19VaccinationExample
InstanceOf: Covid19Vaccination
Usage: #example
Title: "Covid19 Vaccination example"
Description: "Covid19 Vaccination example"
* status = #completed
* vaccineCode = $ICD11#XM4YL8
* patient = Reference(Covid19PatientExample)
* encounter = Reference(Covid19AssessmentEncounterExample) 
* occurrenceDateTime = "2022-07-28"
* reportOrigin.coding.system = "http://openhie.org/fhir/covid19-casereporting/CodeSystem/cs-source-of-info"
* reportOrigin = #VaccineCard
* lotNumber = "1"
* expirationDate = "2022-12-28"
* protocolApplied.series = "Booster"
* protocolApplied.doseNumberPositiveInt = 1 
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "Some other text..."
* note.time = "2015-02-07T13:28:17-05:00"

Instance: PractitionerExample
InstanceOf: Covid19Practitioner
Usage: #example
Title: "Practitioner example"
Description: "Practitioner example"
* name.given = "James"
* name.family = "Smith"
* telecom.system = #phone
* telecom.value = "27537652509"

Instance: Covid19ServiceRequestLocationExample
InstanceOf: Covid19ServiceRequestLocation
Usage: #example
Title: "Covid19 Service Request Location example"
Description: "Covid19 Service Request Location example"
* identifier[XX].value = "facility2"
* identifier[XX].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-service-request-location"
* identifier[XX].type.coding.code = #XX
* identifier[XX].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* name = "Laboratory Services"
* address[+].country = "DISI country"
* address[=].state = "DISI state 1"
* address[=].district = "DISI district 1"
* address[=].city = "DISI city 1"
* address[=].line[+] = "DISI line 1"
* address[=].line[+] = "DISI line 2"
* address[=].line[+] = "DISI line 3"
* address[=].postalCode = "DISI postal code"

Instance: Covid19AdmissionLocationExample
InstanceOf: Covid19AdmissionLocation
Usage: #example
Title: "Covid19 Admission Location example"
Description: "Covid19 Admission Location example"
* identifier[RI].value = "abc123"
* identifier[RI].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-admission-location-id"
* identifier[RI].type.coding.code = #RI
* identifier[RI].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* name = "Covid19 Location"
* address.country = "Example country 1"
* address.state = "Example state 1"
* address.district = "Example district 1"
* address.city = "Example city 1"

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
* performer = Reference(Covid19OrganizationExample)
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
* performer = Reference(Covid19OrganizationExample)
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
* performer = Reference(Covid19OrganizationExample)
* note.authorReference = Reference(Covid19OrganizationExample)
* note.text = "Some other text..."
* note.time = "2015-02-07T13:28:17-05:00"

Instance: Covid19LabOrderRejectionExample
InstanceOf: Covid19LabTask
Usage: #example
Title: "Covid19 Lab Order Cancellation  example"
Description: "Covid19 Lab Order Cancellation Task example"
* identifier[FILL].system = "http://openhie.org/fhir/covid19-casereporting/lab-integration/order-id"
* identifier[FILL].value = "ORDER12345"
* identifier[FILL].type.coding.code = #FILL
* identifier[FILL].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* basedOn = Reference(Covid19ServiceRequestExample)
* status = #rejected
* statusReason = $SCT#135839007 
* intent = #order
* executionPeriod.end = "2022-07-30"
* lastModified = "2022-07-30"
* requester = Reference(Covid19OrganizationExample)
* owner = Reference(Covid19OrganizationExample)

Instance: Covid19LabOrderCancellationExample
InstanceOf: Covid19LabTask
Usage: #example
Title: "Covid19 Lab Order Cancellation  example"
Description: "Covid19 Lab Order Cancellation Task example"
* identifier[FILL].system = "http://openhie.org/fhir/covid19-casereporting/lab-integration/order-id"
* identifier[FILL].value = "ORDER12345"
* identifier[FILL].type.coding.code = #FILL
* identifier[FILL].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* basedOn = Reference(Covid19ServiceRequestExample)
* status = #cancelled
* statusReason = $SCT#281264009 
* intent = #order
* executionPeriod.end = "2022-07-30"
* lastModified = "2022-07-30"
* requester = Reference(Covid19OrganizationExample)
* owner = Reference(Covid19OrganizationExample)

Instance: LabResultTaskExample
InstanceOf: Covid19LabTask
Usage: #example
Title: "Lab Result Task example"
Description: "Lab Result Task example"
* identifier[FILL].system = "http://openhie.org/fhir/covid19-casereporting/lab-integration/order-id"
* identifier[FILL].value = "ORDER12345"
* identifier[FILL].type.coding.code = #FILL
* identifier[FILL].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* basedOn = Reference(Covid19ServiceRequestExample)
* status = #completed
* intent = #order
* executionPeriod.end = "2022-07-30"
* lastModified = "2022-07-30"
* requester = Reference(Covid19OrganizationExample)
* owner = Reference(Covid19OrganizationExample)
* output.type.coding.system = "http://openhie.org/fhir/covid19-casereporting/CodeSystem/cs-lab-task-output"
* output.type = #Result 
* output.valueReference = Reference(Covid19LabResultsDiagnosticReportExample)

Instance: LabOrderTaskExample
InstanceOf: Covid19LabTask
Usage: #example
Title: "Lab Order example"
Description: "Lab Order example"
* identifier[FILL].system = "http://openhie.org/fhir/covid19-casereporting/lab-integration/order-id"
* identifier[FILL].value = "ORDER12345"
* identifier[FILL].type.coding.code = #FILL
* identifier[FILL].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* basedOn = Reference(Covid19ServiceRequestExample)
* status = #requested
* intent = #order
* executionPeriod.start = "2022-07-28"
* lastModified = "2022-07-28"
* requester = Reference(Covid19OrganizationExample)
* owner = Reference(Covid19OrganizationExample)