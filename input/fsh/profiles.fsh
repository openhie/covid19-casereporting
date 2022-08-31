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
    covid19EverHospitalized 1..1 and
    covid19Admission 0..1 and
    covid19Symptom 0..* and 
    covid19ConditionsComorbidity 0..* and
    covid19Diagnosis 0..1 and
    hivDiagnosis 0..1 and
    covid19AssessmentVaccination 0..* and
    covid19PatientOutcome 1..1
* section[covid19AssessmentSection].entry[covid19AssessmentEncounter] only Reference(Covid19AssessmentEncounter)
* section[covid19AssessmentSection].entry[covid19ReasonforAssessment] only Reference(Covid19ReasonforAssessment)
* section[covid19AssessmentSection].entry[otherReasonforAssessment] only Reference(OtherReasonforAssessment)
* section[covid19AssessmentSection].entry[covid19Presentation] only Reference(Covid19Presentation)
* section[covid19AssessmentSection].entry[covid19DateLastHospitalized] only Reference(Covid19DateLastHospitalized)
* section[covid19AssessmentSection].entry[covid19EverHospitalized] only Reference(Covid19EverHospitalized)
* section[covid19AssessmentSection].entry[covid19Admission] only Reference(Covid19Admission)
* section[covid19AssessmentSection].entry[covid19Symptom] only Reference(Covid19Symptom)
* section[covid19AssessmentSection].entry[covid19ConditionsComorbidity] only Reference(Covid19ConditionsComorbidity)
* section[covid19AssessmentSection].entry[covid19Diagnosis] only Reference(Covid19Diagnosis)
* section[covid19AssessmentSection].entry[hivDiagnosis] only Reference(HIVDiagnosis)
* section[covid19AssessmentSection].entry[covid19AssessmentVaccination] only Reference(Covid19AssessmentVaccination)
* section[covid19AssessmentSection].entry[covid19PatientOutcome] only Reference(Covid19PatientOutcome)

* section[covid19LabOrderManagementSection].title = "Lab Order Management"
* section[covid19LabOrderManagementSection].code = CSCaseReportSections#LABORDER-MANAGEMENT
* section[covid19LabOrderManagementSection].entry ^slicing.discriminator.type = #profile
* section[covid19LabOrderManagementSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19LabOrderManagementSection].entry ^slicing.rules = #closed
* section[covid19LabOrderManagementSection].entry contains
    covid19LabOrder 0..1 and
    covid19Specimen 0..1 and
    covid19SpecimenCollection 0..1 and
    covid19LabOrderCancellation 0..1 and
    covid19LabResults   0..1
* section[covid19LabOrderManagementSection].entry[covid19LabOrder] only Reference(Covid19LabOrder)
* section[covid19LabOrderManagementSection].entry[covid19Specimen] only Reference(Covid19Specimen)
* section[covid19LabOrderManagementSection].entry[covid19SpecimenCollection] only Reference(Covid19SpecimenCollection)
* section[covid19LabOrderManagementSection].entry[covid19LabOrderCancellation] only Reference(Covid19LabOrderCancellation)
* section[covid19LabOrderManagementSection].entry[covid19LabResults] only Reference(Covid19LabResults)

* section[covid19VaccinationSection].title = "Covid 19 Vaccination"
* section[covid19VaccinationSection].code = CSCaseReportSections#COVID-VACCINATION
* section[covid19VaccinationSection].entry ^slicing.discriminator.type = #profile
* section[covid19VaccinationSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19VaccinationSection].entry ^slicing.rules = #closed
* section[covid19VaccinationSection].entry contains
    covid19Vaccination 1..1 
* section[covid19VaccinationSection].entry[covid19Vaccination] only Reference(Covid19Vaccination)

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


Profile: Covid19ReasonforAssessment
Parent: Observation
Id: covid19-reason-for-Assessment
Title: "Covid19 Reason for Assessment"
Description: "Covid19 Reason for Assessment"
* value[x] only CodeableConcept
* valueCodeableConcept from VSAssessmentReason 
* encounter 1..1 MS

Profile: OtherReasonforAssessment
Parent: Observation
Id: covid19-other-reason-for-Assessment
Title: "Covid19 Other Reason for Assessment"
Description: "Covid19 Other Reason for Assessment"
* value[x] only string
* encounter 1..1 MS

Profile: Covid19Presentation
Parent: Observation
Id: covid19-presentation
Title: "Covid19 Presentation"
Description: "Covid19 Presentation"
* value[x] only CodeableConcept
* value[x] from VSPresentation
* encounter 1..1 MS

//hospitalization info start
Profile: Covid19DateLastHospitalized  
Parent: Observation
Id: covid19-date-last-hospitalized
Title: "Covid19 Date last Hospitalized"
Description: "Covid19 Date Last Hospitalized"
* valueDateTime MS 
* encounter 1..1 MS

Profile: Covid19EverHospitalized
Parent: Observation
Id: covid19-everhospitalized
Title: "Covid19 Ever Hospitalised"
Description: "Ever hospitalised due to COVID-19?"
* value[x] from VSYesNoUnknown
* encounter 1..1 MS

Profile: Covid19Admission
Parent: Observation
Id: covid19-admission
Title: "Covid19 Admission"
Description: "Covid19 Admission"
* value[x] only CodeableConcept
* valueCodeableConcept from VSAdmissionTypes   //Ward, HDU, ICU
* encounter 1..1 MS

//hospitalization info ends

Profile: Covid19AssessmentEncounter
Parent: Encounter
Id: covid19-encounter
Title: "Covid19 Assessment Encounter"
Description: "Covid19 Assessment Encounter"
* period.start 1..1 MS  //Date of assessment
* subject 1..1 MS //Patient reference
//* period.end MS  //Date died  --> Refer to Outcome effectivedate
* extension contains Covid19VaccineDoseReceived named covid19VaccineDoseReceived 1..1 MS  //Ever received a dose of COVID-19 vaccine // #TODO: A Covid19AssessmentVaccination should be included if Yes

Profile: Covid19OtherSymptoms
Parent: Observation
Id: covid19-other-symptoms
Title: "Other specified symptoms"
Description: "Other specified symptoms"
* valueString MS

Profile: Covid19Symptom
Parent: Observation
Id: covid19-symptom
Title: "Covid19 Symptom"
Description: "Covid19 Symptom"
* valueCodeableConcept from VSSymptoms
* valueDateTime MS // Date of onset of symptoms

Extension: Covid19ComorbidityPresent
Id: covid19-comorbidity-present
Title: "Covid19 Comorbidity Present"
Description: "Covid19 Comorbidity Present"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Extension: OtherConditionsComorbidity
Id: covid19-other-conditions-comorbidity
Title: "Other Conditions or Comorbidity"
Description: "Other Conditions or Comorbidity"
* valueString only string

Extension: ConditionsComorbidityExt
Id: conditions-comorbidity-extension
Title: "Covid19 Conditions or comorbidity"
Description: "Covid19 Conditions or comorbidity"
* value[x] only CodeableConcept
* valueCodeableConcept from VSConditionsComorbidity

Profile: Covid19ConditionsComorbidity
Parent: Condition
Id: covid19-conditions-comorbidity
Title: "Covid19 Conditions or comorbidity"
Description: "Covid19 Conditions or comorbidity"
* code MS
* code from VSConditionsComorbidity 
* extension contains Covid19ComorbidityPresent named covid19ComorbidityPresent 0..1 MS   
* extension contains OtherConditionsComorbidity named otherConditionsComorbidity 0..1 MS  

Extension: Covid19VaccineDoseReceived
Id: covid19-vaccine-dose-received
Title: "Covid19 Vaccine Dose Received"
Description: "Covid19 Vaccine Dose Received"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Extension: VaccinationSourceOfInfo
Id: vaccination-source-of-info
Title: "Vaccination source of info"
Description: "Vaccination source of info"
* value[x] only CodeableConcept
* valueCodeableConcept from VSSourceOfInfo

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
* protocolApplied.series MS  ///Primary, Booster   #TODO
* extension contains Covid19OtherVaccine named covid19OtherVaccine 0..1 MS  //Other vaccine
* occurrenceDateTime  MS // Vaccination date    #TODO - check all required fields
* extension contains VaccinationSourceOfInfo named vaccinationSourceOfInfo 0..1 MS //Source of Information

Profile: Covid19Diagnosis
Parent: Condition
Id: covid19-diagnosis
Title: "Covid19 Diagnosis"
Description: "Covid19 Diagnosis"
* code MS
* code from VSCovidDiagnosis 
* recordedDate MS // Date of Diagnosis

//Fields required from the CBS MDS for Covid Report indicators
Profile: HIVDiagnosis
Parent: Condition
Id: hiv-diagnosis
Title: "HIV Diagnosis"
Description: "This profile allows the exchange of a patient's hiv diagnosis"
* recordedDate 1..1
* identifier 1..*
* code 1..1

Extension: Covid19DateRecovered  
Id: covid19-date-recovered
Title: "Covid19 Date Recovered"
Description: "Date recovered or date symptoms resolved"
* valueDateTime MS

Extension: Covid19LongCOVIDDescription
Id: covid19-long-covid-description
Title: "Covid19 Date Recovered"
Description: "Long COVID / post-COVID description"
* valueString MS

Profile: Covid19PatientOutcome
Parent: Observation
Id: covid19-patient-outcome
Title: "Covid19 Patient Outcome"
Description: "Covid19 Patient Outcome"
//* value[x] only CodeableConcept
* valueCodeableConcept from VSPatientOutcome 
* extension contains Covid19DateRecovered named covid19DateRecovered 0..1 MS
* extension contains Covid19LongCOVIDDescription named covid19LongCOVIDDescription 0..1 MS
* note MS    //additional notes
* valueDateTime  MS // Date of Outcome 

Extension: Covid19TestRequested
Id: covid19-test-requested
Title: "Covid19 Test Requested"
Description: "Covid19 Test Requested"
* value[x] only CodeableConcept
* valueCodeableConcept from VSTestTypes

Profile: Covid19LabOrder
Parent: ServiceRequest
Id: covid19-lab-order
Title: "Covid19 Lab Order"
Description: "Covid19 Lab Order"
* subject 1..1 MS // Patient reference
* intent = #order 
* reasonCode  1..* MS //Reason for testing
* reasonCode from VSAssessmentReason 
//* extension contains OtherReasonforAssessment named otherReasonforTesting 0..1 MS   #TODO
* authoredOn  1..1 MS  
* extension contains Covid19TestRequested named covid19TestRequested 1..1 MS   //could rather bind to field code?
* encounter MS //
* requester MS // Provider name
* authoredOn 1..1 MS // Order time
* code 1..1 MS // Test request Code

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
* type 1..1 MS 
* type from VSCovid19SpecimenType
* collection.collectedDateTime 1..1 MS  // Date specimen collected
//* extension contains OtherReasonforAssessment named otherSpecimenType 0..1 MS   #TODo

Extension: Covid19SpecimenForwarded
Id: covid19-specimen-forwarded
Title: "Covid19 Specimen Forwarded"
Description: "Covid19 Specimen forwarded to reference lab"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Extension: ReferenceLab
Id: covid-19reference-lab
Title: "Covid19 Reference Lab"
Description: "Covid19 Reference Lab sample sent to"  
* valueReference only Reference(Organization) 

Profile: Covid19SpecimenCollection
Parent: DiagnosticReport
Id: covid19-specimen-collection
Title: "Covid19 Specimen Collection"
Description: "Covid19 Specimen Collection"
* subject 1..1 MS // Patient reference
* encounter 1..1 MS // Covid Assessment reference 
* specimen 1..1 MS //
* identifier 1..1 MS //Sample ID
* extension contains ReferenceLab named referenceLab 0..1 MS //##TODO - use of performer?
* extension contains Covid19SpecimenForwarded named covid19SpecimenForwarded 1..1 MS //Specimen forwarded to reference lab

Extension: Covid19CancellationReason
Id: covid19-cancellation-reason
Title: "Covid19 Cancellation Reason"
Description: "Covid19 Cancellation Reason"
* value[x] only CodeableConcept
* valueCodeableConcept from VSCancellationReason

Profile: Covid19LabOrderCancellation
Parent: Task
Id: covid19-lab-order-cancellation
Title: "Covid19 Lab Order Cancellation"
Description: "Covid19 Lab Order Cancellation Task"
* intent = #order
* focus 1..1 MS // Refer to Lab Order  --> What task is acting on
* for 1..1 MS // Beneficiary of the Task --> Patient
* encounter 1..1 MS // Healthcare event during which this task originated -- >Covid19AssessmentEncounter
* authoredOn 1..1 MS //Cancellation date
* reasonCode 1..1 MS
* reasonCode from VSCancellationReason

Extension: Covid19testCompleted
Id: covid19-test-completed
Title: "Covid19 Test Completed"
Description: "Covid19 Test Completed"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Extension: Covid19ReasonTestNotPerformed
Id: covid19-reason-test-not-performed
Title: "Covid19 Reason Test not performed"
Description: "Covid19 Reason test not performed"
* value[x] only CodeableConcept
* valueCodeableConcept from VSReasonTestNotPerformed

Profile: Covid19LabResults
Parent: DiagnosticReport
Id: covid19-lab-results
Title: "Covid19 Lab Results"
Description: "Covid19 Lab Results"
* subject 1..1 MS // Patient reference
* encounter 1..1 MS // Covid Assessment reference
* identifier 1..1 MS //Sample ID
* effectiveDateTime MS //Test result date
* conclusionCode MS //Test Result
* conclusionCode from VSTestResult
* extension contains Covid19testCompleted named testCompleted 1..1 MS  //Lab Test Performed
* status MS  //Status of lab order
* status from VSLabOrderStatus
* extension contains Covid19ReasonTestNotPerformed named reasonTestNotPerformed 0..1 MS //Reason test not performed
* code.coding.system MS  //Result Coding system
* code.coding.code MS  //Result Code

Extension: Covid19NextVaccinationDate
Id: covid19-next-vaccination-date
Title: "Covid19 Date of next vaccination"
Description: "Covid19 Date of next vaccination (if scheduled)"
* valueDateTime MS 

Extension: Covid19OtherVaccine
Id: covid19-other-vaccine
Title: "Covid19 Other vaccine"
Description: "Covid19 Other vaccine"
* valueString MS 

Extension: VaccineSeries
Id: covid19-dose-number-code
Title: "Covid19 Dose Number "
Description: "Covid19 Dose Number"
* value[x] only CodeableConcept
* valueCodeableConcept from VSVaccineSeries

Profile: Covid19Vaccination
Parent: Immunization
Id: covid19-vaccination
Title: "Covid19 Vaccination"
Description: "Covid19 Vaccination"
* patient MS // Patient reference
* occurrenceDateTime 1..1 MS //Vaccination date
* protocolApplied 1..1 MS
* protocolApplied.series 0..0 //  not used, using extension to bind to VSVaccineSeries
* protocolApplied.extension contains  VaccineSeries named vaccineSeries 1..1 MS
* protocolApplied.doseNumberPositiveInt 1..1  MS 
* expirationDate MS    //Vaccine expiration date
* extension contains Covid19NextVaccinationDate named covid19NextVaccinationDate 0..1 MS //Date of next vaccination (if scheduled)
* vaccineCode MS    //Vaccine administered  
* vaccineCode from VSCovid19VaccineCodes
* extension contains Covid19OtherVaccine named covid19OtherVaccine 0..1 MS  //Other vaccine
* lotNumber MS  //Vaccine lot number
