Profile: Covid19Composition
Parent: Composition
Id: covid19-composition
Description: "Covid19 Case Reporting Composition"
Title: "Covid19 Case Reporting Composition"
* type = $LNC#95412-3
* category = $LNC#75218-8
* identifier.system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-case-report"

* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code.coding.code"
* section ^slicing.rules = #openAtEnd
* section ^slicing.ordered = true
* section ^slicing.description = "Slice of composition.section based on code"
* section contains
    covid19PatientSection 1..1 and
    covid19AssessmentSection 0..1 and
    covid19LabOrderManagementSection 0..1 and
    covid19VaccinationSection 0..1
* section[covid19PatientSection].title = "Client registration"
* section[covid19PatientSection].code = CSCaseReportSections#CLIENT-REGISTRATION
* section[covid19PatientSection].entry ^slicing.discriminator.type = #profile
* section[covid19PatientSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19PatientSection].entry ^slicing.rules = #closed
* section[covid19PatientSection].entry contains
    covid19Patient 1..1 
* section[covid19PatientSection].entry[covid19Patient] only Reference(Covid19Patient)

* section[covid19AssessmentSection].title = "Covid19 Assessment Encounter"
* section[covid19AssessmentSection].code = CSCaseReportSections#COVID-ASSESSMENT
//* section[covid19AssessmentSection].entry only Reference(Covid19AssessmentEncounter)
* section[covid19AssessmentSection].entry ^slicing.discriminator.type = #profile
* section[covid19AssessmentSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19AssessmentSection].entry ^slicing.rules = #closed
* section[covid19AssessmentSection].entry contains
    covid19AssessmentEncounter 1..1 and
    covid19ReasonforAssessment 1..* and
    otherReasonforAssessment   0..1 and
    covid19Presentation 1..1 and
    covid19DateLastHospitalized 0..1 and
    covid19Admission 0..1 and
    covid19Symptom 0..* and 
    //covid19ComorbidityPresent 1..1 and
    covid19ConditionsComorbidity 0..* and
    covid19Diagnosis 0..1 and
    hivDiagnosis 0..1 and
    covid19VaccineDoseReceived 1..1 and
    covid19AssessmentVaccination 1..1 and
    covid19MedicationRequest 0..1
* section[covid19AssessmentSection].entry[covid19AssessmentEncounter] only Reference(Covid19AssessmentEncounter)
* section[covid19AssessmentSection].entry[covid19Presentation] only Reference(Covid19Presentation)
* section[covid19AssessmentSection].entry[covid19Symptom] only Reference(Covid19Symptom)
//* section[covid19AssessmentSection].entry[covid19ComorbidityPresent] only Reference(Covid19ComorbidityPresent)
* section[covid19AssessmentSection].entry[covid19ConditionsComorbidity] only Reference(Covid19ConditionsComorbidity)
* section[covid19AssessmentSection].entry[covid19Diagnosis] only Reference(Covid19Diagnosis)
* section[covid19AssessmentSection].entry[hivDiagnosis] only Reference(HIVDiagnosis)
* section[covid19AssessmentSection].entry[covid19VaccineDoseReceived] only Reference(Covid19VaccineDoseReceived)  
* section[covid19AssessmentSection].entry[covid19AssessmentVaccination] only Reference(Covid19AssessmentVaccination)
* section[covid19AssessmentSection].entry[covid19MedicationRequest] only Reference(Covid19MedicationRequest)

* section[covid19LabOrderManagementSection].title = "Lab Order Management"
* section[covid19LabOrderManagementSection].code = CSCaseReportSections#LABORDER-MANAGEMENT
* section[covid19LabOrderManagementSection].entry ^slicing.discriminator.type = #profile
* section[covid19LabOrderManagementSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19LabOrderManagementSection].entry ^slicing.rules = #closed
* section[covid19LabOrderManagementSection].entry contains
    covid19LabOrder 0..1 and
    covid19Specimen 0..1 and
    covid19LabOrderCancellation 0..1 and
    covid19LabResultsDiagnosticReport 0..1 and
    covid19TestResult 0..1 and
    covid19ReasonTestNotPerformed 0..1
* section[covid19LabOrderManagementSection].entry[covid19LabOrder] only Reference(Covid19LabOrder)
* section[covid19LabOrderManagementSection].entry[covid19Specimen] only Reference(Covid19Specimen)
* section[covid19LabOrderManagementSection].entry[covid19LabOrderCancellation] only Reference(Covid19LabOrderCancellation)
* section[covid19LabOrderManagementSection].entry[covid19LabResultsDiagnosticReport] only Reference(Covid19LabResultsDiagnosticReport)
* section[covid19LabOrderManagementSection].entry[covid19TestResult] only Reference(Covid19TestResult)
* section[covid19LabOrderManagementSection].entry[covid19ReasonTestNotPerformed] only Reference(Covid19ReasonTestNotPerformed)

* section[covid19VaccinationSection].title = "Covid 19 Vaccination"
* section[covid19VaccinationSection].code = CSCaseReportSections#COVID-VACCINATION
* section[covid19VaccinationSection].entry ^slicing.discriminator.type = #profile
* section[covid19VaccinationSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19VaccinationSection].entry ^slicing.rules = #closed
* section[covid19VaccinationSection].entry contains
    covid19Vaccination 1..1 and
    covid19VaccinationAppointment 0..1
* section[covid19VaccinationSection].entry[covid19Vaccination] only Reference(Covid19Vaccination)
* section[covid19VaccinationSection].entry[covid19VaccinationAppointment] only Reference(Covid19VaccinationAppointment)


Profile: Covid19Organization
Parent: Organization
Id: covid19-organization
Title: "Covid19 Organization"
Description: "Covid19 Organization for case report - this represents a health facility"
* address 1..1
* address.country 1..1
* address.state 1..1
* address.district 1..1
* address.city 1..1
* identifier 1..* 

Extension: ClientWardDivision
Id: client-ward-division
Title: "Client Ward Division"
Description: "Client Ward Division"
* valueString only string

Extension: KeyPopulation
Id: key-population
Title: "Key population"
Description: "Key population"
* value[x] only CodeableConcept
* valueCodeableConcept from VSKeyPopulation

Profile: Covid19Patient
Parent: Patient
Id: covid19-patient
Title: "Covid19 Patient"
Description: "This Patient profile allows the exchange of patient information, including all the data associated with Covid19 patients"
* name.given 1..* MS   //Client first name(s) & Mioddle Name(s)
* name.family 1..1 MS // Surname
* gender 1..1 MS // Client Sex
* birthDate 1..1 MS   // Client Date of Birth
* telecom MS  // Client telephone number and Client Email Addresss
//Next of kin contact details
* contact.name MS
* contact.telecom MS
//* address 1..*
* address.country MS    //Client Country  /  Nationality / Citizenship
* address.state MS      //Client County / Province  / State
* address.district MS   //Client SubCounty / District 
* extension contains ClientWardDivision named clientWardDivision 1..1 MS  //
* address.line MS   //Client Ward / Division
* address.city MS      //Client Village / Estate */

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type of identifier"

* identifier contains
    // art 0..* and
    passport 0..1 and
    national 0..1 and
    pos 0..1

//* identifier[art].value 0..1
//* identifier[art].system = "http://openhie.org/fhir/hiv-casereporting/identifier/art"
* identifier[passport].value 0..1
* identifier[passport].system = "http://openhie.org/fhir/covid19-casereporting/identifier/passport"
* identifier[national].value 0..1
* identifier[national].system = "http://openhie.org/fhir/covid19-casereporting/identifier/nid"
* identifier[pos].value 1..1

* extension contains KeyPopulation named keyPopulation 0..1 MS

* managingOrganization 1..1

Profile: Covid19Presentation
Parent: Condition
Id: covid19-presentation
Title: "Covid19 Presentation"
Description: "Covid19 Presentation"
* encounter 1..1 MS
* evidence.code from VSPresentation
* onsetDateTime MS //date of onset of symptoms

Profile: Covid19AssessmentEncounter
Parent: Encounter
Id: covid19-encounter
Title: "Covid19 Assessment Encounter"
Description: "Covid19 Assessment Encounter"
* period.start 1..1 MS  //Date of assessment
* subject 1..1 MS //Patient reference
* reasonCode 1..* MS  
* reasonCode from VSAssessmentReason 
* reasonCode.text MS
* location.physicalType from VSAdmissionTypes 
* location.physicalType MS //Admission
* classHistory.class MS //determine ever hospitalized → if classHistory.class = IMP and classHistory.period.start   
* classHistory.period.start MS // Date Last Hospitalized --> To answer  "Ever Hospitalized due to Covid-19?" 

Profile: Covid19Symptom
Parent: ClinicalImpression
Id: covid19-symptom
Title: "Covid19 Symptom"
Description: "Covid19 Symptom"
* investigation.code from VSSymptoms
* investigation.code MS
* note MS // other presenting symptoms

/*
Profile: Covid19ComorbidityPresent
Parent: Observation
Id: covid19-comorbidity-present
Title: "Covid19 Comorbidity Present"
Description: "Covid19 Comorbidity Present"
//* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown
*/

Profile: Covid19ConditionsComorbidity
Parent: Condition
Id: covid19-conditions-comorbidity
Title: "Covid19 Conditions or comorbidity"
Description: "Covid19 Conditions or comorbidity"
* code MS
* code from VSConditionsComorbidity 
* note MS  //OtherConditions   #TODO: Conditional rule: mandatory if code = #Other

Profile: Covid19VaccineDoseReceived
Parent: Observation
Id: covid19-vaccine-dose-received
Title: "Covid19 Vaccine Dose Received"
Description: "Covid19 Vaccine Dose Received"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Profile: Covid19AssessmentVaccination
Parent: Immunization
Id: covid19-assessment-vaccination
Title: "Covid19 Vaccination info included as part of the Assessment"
Description: "Covid19 Vaccination info included as part of the Assessment"
* patient MS // Patient ref
* encounter MS //Covid19Assessment ref
* vaccineCode MS
* vaccineCode from VSVaccineTypes 
* protocolApplied.doseNumberPositiveInt MS
* protocolApplied.series 1..1 MS //  VSVaccineSeries  #TODO conditional validation for aplying binding validation
* vaccineCode.text 0..1 MS //Other vaccine
* occurrenceDateTime  MS // Vaccination date    #TODO - check all required fields
* reportOrigin from VSSourceOfInfo  // source of information
* reportOrigin.text MS // Other Source of info details

Profile: Covid19Diagnosis
Parent: Condition
Id: covid19-diagnosis
Title: "Covid19 Diagnosis"
Description: "Covid19 Diagnosis"
* recordedDate MS // Date of Diagnosis
* verificationStatus from VSCovidDiagnosis //Covid Diagnosis
* clinicalStatus from VSPatientOutcome
* clinicalStatus 1..1 MS // Patient Outcome
* abatementDateTime 0..1 MS //Date recovered or date symptoms resolved / Date Died
* note MS  // Long covid description and/or Additional notes

Profile: Covid19MedicationRequest
Parent: MedicationRequest
Id: covid19-medication-request
Title: "Covid19 Treatment dispensed or prescribed"
Description: "Covid19 Treatment dispensed or prescribed"
* medicationCodeableConcept from VSTreatMentDispensedPrescribed 
* medicationCodeableConcept.text MS // Other (specify) - details

//Fields required from the CBS MDS for Covid Report indicators
Profile: HIVDiagnosis
Parent: Condition
Id: hiv-diagnosis
Title: "HIV Diagnosis"
Description: "This profile allows the exchange of a patient's hiv diagnosis"
* recordedDate 1..1
* identifier 1..*
* code 1..1

Profile: Covid19LabOrder
Parent: ServiceRequest
Id: covid19-lab-order
Title: "Covid19 Lab Order"
Description: "Covid19 Lab Order"
* identifier 1..1 MS //
* subject 1..1 MS // Patient reference
* intent = #order 
* reasonCode  1..* MS //Reason for testing
* reasonCode from VSAssessmentReason 
* note MS // for capturing other reasons for testing
* encounter 1..1 MS  
* requester MS // Provider name
* authoredOn 1..1 MS // Order time
* code from VSTestTypes
* code 1..1 MS // Test request Code
* locationReference MS //Reference Lab sample send to
* status MS // Status of Lab Order
* occurrenceDateTime MS // sample forwarded to reference lab; Yes = if there is a dateTime when sample was sent
* specimen 1..1 MS //sample

Extension: Covid19SpecimenType
Id: covid19-specimen-type
Title: "Covid19 Specimen Type"
Description: "Covid19 Specimen Type"
* value[x] only CodeableConcept
* valueCodeableConcept from VSCovid19SpecimenType

Profile: Covid19Specimen
Parent: Specimen
Id: covid19-specimen
Title: "Covid19 Specimen"
Description: "Covid19 Specimen"
* identifier 1..1 MS //Sample ID
* type 1..1 MS 
* type from VSCovid19SpecimenType
* collection.collectedDateTime 1..1 MS  // Date specimen collected
* note MS // Other Sample Type
* processing.timePeriod.end MS   //Using the date to derive that the "Lab Test was Performed"

Profile: Covid19LabOrderCancellation
Parent: Task
Id: covid19-lab-order-cancellation
Title: "Covid19 Lab Order Cancellation"
Description: "Covid19 Lab Order Cancellation Task"
* intent = #order
* basedOn 1..1 MS // Reference to the Lab Order (ServiceRequest)
* executionPeriod 1..1 MS //Cancellation date
* statusReason 1..1 MS
* statusReason from VSCancellationReason
* status = #cancelled

Profile: Covid19LabResultsDiagnosticReport
Parent: DiagnosticReport
Id: covid19-lab-results
Title: "Covid19 Lab Results Diagnostic Report"
Description: "Covid19 Lab Results Diagnostic Report"
* subject 1..1 MS // Patient reference
* basedOn 1..1 MS // Ref to ServiceRequest
* result  MS //

Profile: Covid19TestResult
Parent: Observation
Id: covid19-test-results
Title: "Covid19 Lab Results"
Description: "Covid19 Lab Results"
* valueDateTime MS //Test result date-time
* valueCodeableConcept from VSTestResult
* valueCodeableConcept MS //Result Code

Profile: Covid19ReasonTestNotPerformed
Parent: Observation
Id: covid19-reason-test-not-performed
Title: "Covid19 Reason Test Not Performed"
Description: "Covid19 reason test not peformed"
* dataAbsentReason from VSReasonTestNotPerformed   
* dataAbsentReason MS //Reason test not performed

Extension: Covid19OtherVaccine
Id: covid19-other-vaccine
Title: "Covid19 Other vaccine"
Description: "Covid19 Other vaccine"
* valueString MS 

Profile: Covid19Vaccination
Parent: Immunization
Id: covid19-vaccination
Title: "Covid19 Vaccination"
Description: "Covid19 Vaccination"
* patient MS // Patient reference
* occurrenceDateTime 1..1 MS //Vaccination date
* protocolApplied 1..1 MS
* protocolApplied.series 1..1 MS //  VSVaccineSeries  #TODO conditional validation for aplying binding validation
* protocolApplied.doseNumberPositiveInt 1..1  MS 
* expirationDate MS    //Vaccine expiration date
* vaccineCode MS    //Vaccine administered  
* vaccineCode from VSVaccineTypes
* vaccineCode.text MS //other vaccine
* lotNumber  1..1 MS  //Vaccine lot number
* note MS // notes

Profile: Covid19VaccinationAppointment
Parent: Appointment
Id: covid19-vaccination-appointment
Title: "Covid19 Vaccination Appointment"
Description: "Covid19 Vaccination Appointment"
* participant.actor 1..1 MS // Patient Reference
* start 1..1 MS // date of next vaccination