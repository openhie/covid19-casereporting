Profile: Covid19Organization
Parent: Organization
Id: covid19-organization
Title: "Covid19 Organization"
Description: "Covid19 Organization for case report - this represents a health facility"
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #openAtEnd
* identifier ^slicing.description = "Slice based on the type of identifier"
* identifier contains
    PRN 1..1
* identifier[PRN].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-organization"  (exactly)
* name 1..1
* address 1..1
* address.country 1..1
* address.state 1..1
* address.district 1..1
* address.city 1..1

Profile: Covid19Patient
Parent: Patient
Id: covid19-patient
Title: "Covid19 Patient"
Description: "This Patient profile allows the exchange of patient information, including all the data associated with Covid19 patients"
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #openAtEnd
* identifier ^slicing.description = "Slice based on the type of identifier"
* identifier contains
    PPN 1..1 and
    NID 1..1 and
* identifier[PPN].system = "http://openhie.org/fhir/covid19-casereporting/identifier/passport" (exactly)
* identifier[NID].system = "http://openhie.org/fhir/covid19-casereporting/identifier/nid" (exactly)
* active 1..1
* name.given 1..*
* name.family 1..1
* telecom 0..*
* gender 1..1
* birthDate 1..1
* address 0..*
* contact 0..*
* managingOrganization 1..1

Extension: ExtCovid19EverHospitalised
Id: covid19-ever-hospitalised
Title: "Covid19 Ever Hospitalized"
Description: "Covid19 Ever Hospitalized"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Extension: ExtCovid19DateLastHospitalised
Id: covid19-date-last-hospitalised
Title: "Covid19 Date Last Hospitalised"
Description: "Covid19 Date Last Hospitalised"
* value[x] only dateTime 

Profile: Covid19AssessmentEncounter
Parent: Encounter
Id: covid19-encounter
Title: "Covid19 Assessment Encounter"
Description: "Covid19 Assessment Encounter"
* extension contains ExtNextVisit named nextVisit 0..1
* extension contains ExtCovid19EverHospitalised named extCovid19EverHospitalised 0..1
* extension contains ExtCovid19DateLastHospitalised named extCovid19DateLastHospitalised 0..1
* status = #finished
* class 1..1
* subject only Reference(Patient)
* subject 1..1
* period 1..1
* reasonCode from VSReasonForAssessmentOrTestNotPerformed (required)
* location 1..1
* location.location 1..1
* location.physicalType from VSAdmissionTypes (required)

Profile: Covid19PresentingSymptoms
Parent: Observation
Id: covid19-presenting-symptoms 
Title: "Covid19 Symptom"
Description: "Covid19 Symptom"
* status = #final
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* code from VSSymptoms (required)
* effectiveDateTime 1..1
* note.authorReference only Reference(Organization)
* note 0..1

Extension: ExtCovid19ConditionsOrComorbiditiesPresent
Id: covid19-conditions-or-comorbidities-present
Title: "Covid19 Conditions or Comorbidities Present"
Description: "Covid19 Conditions or Comorbidities Present"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Profile: Covid19ConditionsOrComorbidity
Parent: Condition
Id: covid19-conditions-or-comorbidities
Title: "Covid19 Conditions or comorbidity"
Description: "Covid19 Conditions or comorbidity"
* extension contains ExtCovid19ConditionsOrComorbiditiesPresent named extCovid19ConditionsOrComorbiditiesPresent 1..1
* code from VSConditionsComorbidity (required)
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* note.authorReference only Reference(Organization)
* note 0..1

Profile: Covid19VaccineDoseEverReceived
Parent: Observation
Id: covid19-vaccine-dose-ever-received
Title: "Covid19 Vaccine Dose Received"
Description: "Covid19 Vaccine Dose Received"
* status = #final
* code from VSYesNoUnknown (required)
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1

Profile: Covid19AssessmentVaccination
Parent: Immunization
Id: covid19-assessment-vaccination
Title: "Covid19 Vaccination info included as part of the Assessment"
Description: "Covid19 Vaccination info included as part of the Assessment"
* status = #completed
* vaccineCode from VSVaccineTypes (required)
* patient 1..1
* encounter 1..1
* occurrenceDateTime 1..1
* reportOrigin.coding.code from VSSourceOfInfo (required)
* lotNumber 1..1
* expirationDate 0..1
* protocolApplied 1..1
* protocolApplied.series 1..1
* protocolApplied.doseNumberPositiveInt 1..1
* note.authorReference only Reference(Organization)
* note 0..1

Profile: Covid19Diagnosis
Parent: Condition
Id: covid19-diagnosis
Title: "Covid19 Diagnosis"
Description: "Covid19 Diagnosis"
* verificationStatus 1..1
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* onsetDateTime 1..1
* recordedDate 1..1
* evidence 1..1
* evidence.code from VSPresentation (required)
* note.authorReference only Reference(Organization)
* note 0..1

Profile: Covid19MedicationRequest
Parent: MedicationRequest
Id: covid19-medication-request
Title: "Covid19 Treatment dispensed or prescribed"
Description: "Covid19 Treatment dispensed or prescribed"
* status = #active
* intent = #order
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* medicationCodeableConcept from VSTreatMentDispensedPrescribed (required)
* note.authorReference only Reference(Organization)
* note 0..1

Profile: Covid19ServiceRequest
Parent: ServiceRequest
Id: covid19-lab-order
Title: "Covid19 Lab Order"
Description: "Covid19 Lab Order"
* identifier 1..1
* status 1..1
* intent = #order
* code from VSTestTypes (required)
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* occurrenceDateTime 1..1
* requester 1..1
* locationReference 1..1
* doNotPerform 0..1
* reasonCode from VSReasonForAssessmentOrTestNotPerformed (required)
* specimen 1..1
* note.authorReference only Reference(Organization)
* note 0..1
 
Profile: Covid19Specimen
Parent: Specimen
Id: covid19-specimen
Title: "Covid19 Specimen"
Description: "Covid19 Specimen"
* identifier 1..1
* type from VSCovid19SpecimenType (required)
* subject only Reference(Patient)
* subject 1..1
* collection.collectedDateTime 1..1
* note.authorReference only Reference(Organization)
* note 0..1

Profile: Covid19TestResult
Parent: Observation
Id: covid19-test-results
Title: "Covid19 Lab Results"
Description: "Covid19 Lab Results"
* status = #final
* code from VSTestTypes (required)
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* effectiveDateTime 1..1
* valueCodeableConcept from VSTestResult (required)

Profile: Covid19Vaccination
Parent: Immunization
Id: covid19-vaccination
Title: "Covid19 Vaccination"
Description: "Covid19 Vaccination"
* status = #completed
* vaccineCode from VSVaccineTypes (required)
* patient 1..1
* encounter 1..1
* occurrenceDateTime 1..1
* reportOrigin.coding.code from VSSourceOfInfo (required)
* lotNumber 1..1
* expirationDate 0..1
* protocolApplied 1..1
* protocolApplied.series 1..1
* protocolApplied.doseNumberPositiveInt 1..1
* note.authorReference only Reference(Organization)
* note 0..1

Extension: ExtNextVisit
Id: covid19-next-vaccination
Title: "Covid19 date of next vaccination"
Description: "Covid19 date of next vaccination"
* value[x] only dateTime

Profile: Covid19ServiceRequestLocation
Parent: Location
Id: covid19-service-request-location
Title: "Covid19 Service Request Location"
Description: "Covid19 Service Request Location"
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #openAtEnd
* identifier ^slicing.description = "Slice based on the type of identifier"
* identifier contains
    PRN 1..1
* identifier[PRN].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-service-request-location" (exactly)
* name 1..1
* address 1..1

Profile: Covid19AdmissionLocation
Parent: Location
Id: covid19-admission-location
Title: "Covid19 Admission Location"
Description: "Covid19 Admission Location"
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #openAtEnd
* identifier ^slicing.description = "Slice based on the type of identifier"
* identifier contains
    PRN 1..1
* identifier[PRN].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-admission-location" (exactly)
* name 1..1
* address 1..1

Profile: Covid19RecoveredOrSymptomsResolved
Parent: Observation
Id: covid19-recovered-or-symptoms-resolved 
Title: "Covid19 Recovered Or Symptoms Resolved"
Description: "Covid19 Recovered Or Symptoms Resolved"
* status = #final
* code = $SCT#370996005
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* effectiveDateTime 1..1
* note.authorReference only Reference(Organization)
* note 1..1

Profile: Covid19Death
Parent: Observation
Id: covid19-death 
Title: "Covid19 Death"
Description: "Covid19 Death"
* status = #final
* code = $SCT#419099009
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* effectiveDateTime 1..1
* note.authorReference only Reference(Organization)
* note 1..1

Profile: Covid19LongCovidPostCovid
Parent: Observation
Id: covid19-long-covid-post-covid
Title: "Covid19 Long Covid / Post-Covid"
Description: "Covid19 Long Covid / Post-Covid"
* status = #final
* code = $SCT#1119303003
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* effectiveDateTime 1..1
* note.authorReference only Reference(Organization)
* note 1..1

Profile: Covid19LabTask
Parent: Task
Id: covid19-lab-task
Title: "Covid19 Lab Task"
Description: "Covid19 Lab Task"
* identifier 1..*
* basedOn only Reference(ServiceRequest)
* status 1..1
* statusReason 0..1
* intent = #order
* executionPeriod 1..1
* lastModified 0..1
* requester only Reference(Organization)
* owner only Reference(Organization)
* output 0..*
* output.type.coding.code from VSLabTaskOutput (required)
* output.valueReference 1..1

Profile: Covid19Practitioner
Parent: Practitioner
Id: covid19-practitioner
Title: "Covid19 Practitioner"
Description: "Covid19 Practitioner"
* name 1..1
* telecom 0..1

Profile: Covid19DiagnosticReport
Parent: DiagnosticReport
Id: covid19-diagnostic-report
Title: "Covid19 Diagnostic Report"
Description: "Covid19 Diagnostic Report"
* basedOn only Reference(ServiceRequest)
* status = #final
* code from VSTestTypes (required)
* subject only Reference(Patient)
* subject 1..1
* performer only Reference(Practitioner)
* result 1..1
* conclusion 0..1