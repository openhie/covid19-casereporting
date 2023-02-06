Profile: Covid19Organization
Parent: Organization
Id: covid19-organization
Title: "Organization"
Description: "Administering Organization"
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #openAtEnd
* identifier ^slicing.description = "Slice based on the type of identifier"
* identifier contains
    PRN 1..1
* identifier[PRN].value 1..1
* identifier[PRN].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-organization" (exactly)
* name 1..1
* address 1..1
* address.country 1..1
* address.state 1..1
* address.district 1..1
* address.city 1..1

Profile: Covid19Patient
Parent: Patient
Id: covid19-patient
Title: "Patient"
Description: "The individual receiving COVID19 services"
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #openAtEnd
* identifier ^slicing.description = "Slice based on the type of identifier"
* identifier contains
    PPN 1..1 and
    NID 1..1
* identifier[PPN].value 1..1
* identifier[PPN].system = "http://openhie.org/fhir/covid19-casereporting/identifier/passport" (exactly)
* identifier[NID].value 1..1
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
Title: "Ever Hospitalized"
Description: "Has the individual been admitted to hospital at any point in time in the past?"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Extension: ExtCovid19DateLastHospitalised
Id: covid19-date-last-hospitalised
Title: "Date Last Hospitalised"
Description: "When last was the individual admitted to hospital?"
* value[x] only dateTime 

Profile: Covid19AssessmentEncounter
Parent: Encounter
Id: covid19-encounter
Title: "Encounter"
Description: "A record of the individual's visit at the organization"
* extension contains ExtNextVisit named nextVisit 0..1
* extension contains ExtCovid19EverHospitalised named extCovid19EverHospitalised 0..1
* extension contains ExtCovid19DateLastHospitalised named extCovid19DateLastHospitalised 0..1
* status 1..1
* class 1..1
* subject only Reference(Patient)
* subject 1..1
* period 1..1
//* reasonCode from VSReasonForAssessmentOrTestNotPerformed (required)
* location 1..1
* location.location 1..1
* location.physicalType from VSAdmissionTypes (required)

Profile: Covid19PresentingSymptoms
Parent: Observation
Id: covid19-presenting-symptoms 
Title: "Presenting Symptoms"
Description: "Existing symptoms which may help with diagnosis"
* status = #final
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* code from VSSymptoms (required)
* effectiveDateTime 1..1
* performer only Reference(Organization)
* note.authorReference only Reference(Organization)
* note 0..1

Extension: ExtCovid19ConditionsOrComorbiditiesPresent
Id: covid19-conditions-or-comorbidities-present
Title: "Conditions or Comorbidities Present"
Description: "Does the individual have any known pre-existing conditions and/or comorbidities?"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Profile: Covid19ConditionsOrComorbidity
Parent: Condition
Id: covid19-conditions-or-comorbidities
Title: "Conditions or Comorbidity"
Description: "What pre-existing conditions and/or comorbidities exist for the individual?"
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
Title: "Vaccine Dose Ever Received"
Description: "Has the individual received at least one shot of the vaccine at any point in time in the past?"
* status = #final
* code from VSYesNoUnknown (required)
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* performer only Reference(Organization)

Profile: Covid19AssessmentVaccination
Parent: Immunization
Id: covid19-assessment-vaccination
Title: "Immunization Tracking"
Description: "Retrospectively capture COVID19 immunization data for vaccines administered at other organizations"
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
Title: "Diagnosis"
Description: "Confirmation of the diagnosis"
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
Title: "Treatment dispensed or prescribed"
Description: "To indicate whether Paxlovid has been issued to the individual"
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
Title: "Lab Order"
Description: "A service request that initiates the need for the lab to collect the test sample"
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #openAtEnd
* identifier ^slicing.description = "Slice based on the type of identifier"
* identifier contains
    FILL 1..1 
* identifier[FILL].value 1..1
* identifier[FILL].system = "http://openhie.org/fhir/covid19-casereporting/identifier/lab-order-identifier" (exactly)
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
Title: "Specimen"
Description: "The test sample that was collected for the initiated lab order"
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
Title: "Lab Results"
Description: "The result of the lab test which determines whether the patient is infected with COVID19 or not"
* status = #final
* code from VSTestTypes (required)
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* effectiveDateTime 1..1
* performer only Reference(Organization)
* valueCodeableConcept from VSTestResult (required)

Profile: Covid19Vaccination
Parent: Immunization
Id: covid19-vaccination
Title: "Immunization Tracking"
Description: "Administer a suitable vaccine based on the most recent lab result"
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
Title: "Date of next vaccination"
Description: "When must the individual return to the organization for the next scheduled vaccination?"
* value[x] only dateTime

Profile: Covid19ServiceRequestLocation
Parent: Location
Id: covid19-service-request-location
Title: "Lab Order Request Location"
Description: "What is the location of the organization responsible for conducting the examination of the individual's sample?"
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #openAtEnd
* identifier ^slicing.description = "Slice based on the type of identifier"
* identifier contains
    PRN 0..1
* identifier[PRN].value 0..1
* identifier[PRN].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-service-request-location" (exactly)
* name 1..1
* address 1..1

Profile: Covid19AdmissionLocation
Parent: Location
Id: covid19-admission-location
Title: "Admission Location"
Description: "What is the location of the organization where the patient is currently being admitted to for treatment?"
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #openAtEnd
* identifier ^slicing.description = "Slice based on the type of identifier"
* identifier contains
    PRN 0..1
* identifier[PRN].value 0..1
* identifier[PRN].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-admission-location" (exactly)
* name 1..1
* address 1..1

Profile: Covid19RecoveredOrSymptomsResolved
Parent: Observation
Id: covid19-recovered-or-symptoms-resolved 
Title: "Recovered Or Symptoms Resolved"
Description: "Has the individual fully recovered from symptoms associated with COVID19?"
* status = #final
* code = $SCT#370996005
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* effectiveDateTime 1..1
* performer only Reference(Organization)
* note.authorReference only Reference(Organization)
* note 0..1

Profile: Covid19Death
Parent: Observation
Id: covid19-death 
Title: "Death"
Description: "An event assoicated with the death of an individual who has been diagnosed with COVID19"
* status = #final
* code = $SCT#419099009
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* effectiveDateTime 1..1
* performer only Reference(Organization)
* note.authorReference only Reference(Organization)
* note 0..1

Profile: Covid19LongCovidPostCovid
Parent: Observation
Id: covid19-long-covid-post-covid
Title: "Long Covid / Post-Covid"
Description: "Does the indiviual continue to suffer from COVID19 health problems that are new, returning or ongoing conditons?"
* status = #final
* code = $SCT#1119303003
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* effectiveDateTime 1..1
* performer only Reference(Organization)
* note.authorReference only Reference(Organization)
* note 0..1

Profile: Covid19LabTask
Parent: Task
Id: covid19-lab-task
Title: "Lab Task"
Description: "Assists with tracking the state of the lab order and its completion status"
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
Title: "Practitioner"
Description: "The healthcare professional who has been assigned to a given lab task"
* name 1..1
* telecom 0..1

Profile: Covid19DiagnosticReport
Parent: DiagnosticReport
Id: covid19-diagnostic-report
Title: "Diagnostic Report"
Description: "A report as a result of the lab task being completed"
* basedOn only Reference(ServiceRequest)
* status = #final
* code from VSTestTypes (required)
* subject only Reference(Patient)
* subject 1..1
* performer only Reference(Practitioner)
* result 1..1
* conclusion 0..1