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
    covid19ImmunizationSection 0..1
* section[covid19PatientSection].title = "Client registration"
* section[covid19PatientSection].code = CSCaseReportSections#CLIENT-REGISTRATION
* section[covid19PatientSection].entry ^slicing.discriminator.type = #profile
* section[covid19PatientSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19PatientSection].entry ^slicing.rules = #closed
* section[covid19PatientSection].entry contains
    covid19Patient 1..1 and
    covid19RelatedPerson 0..*
* section[covid19PatientSection].entry[covid19Patient] only Reference(Covid19Patient)
* section[covid19PatientSection].entry[covid19RelatedPerson] only Reference(Covid19RelatedPerson)

* section[covid19AssessmentSection].title = "Covid19 Assessment Encounter"
* section[covid19AssessmentSection].code = CSCaseReportSections#ASSESSMENT
//* section[covid19AssessmentSection].entry only Reference(Covid19AssessmentEncounter)
* section[covid19AssessmentSection].entry ^slicing.discriminator.type = #profile
* section[covid19AssessmentSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19AssessmentSection].entry ^slicing.rules = #closed
* section[covid19AssessmentSection].entry contains
    covid19AssessmentEncounter 1..1 and
    covid19Symptom 0..* and 
    covid19ConditionsComorbidity 0..* and
    covid19VaccineTypeAdministered 0..* and
    covid19PatientOutcome 0..1
* section[covid19AssessmentSection].entry[covid19AssessmentEncounter] only Reference(Covid19AssessmentEncounter)
* section[covid19AssessmentSection].entry[covid19Symptom] only Reference(Covid19Symptom)
* section[covid19AssessmentSection].entry[covid19ConditionsComorbidity] only Reference(Covid19ConditionsComorbidity)
* section[covid19AssessmentSection].entry[covid19VaccineTypeAdministered] only Reference(Covid19VaccineTypeAdministered)
* section[covid19AssessmentSection].entry[covid19PatientOutcome] only Reference(Covid19PatientOutcome)

* section[covid19LabOrderManagementSection].title = "Lab Order Management"
* section[covid19LabOrderManagementSection].code = CSCaseReportSections#LABORDER
* section[covid19LabOrderManagementSection].entry ^slicing.discriminator.type = #profile
* section[covid19LabOrderManagementSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19LabOrderManagementSection].entry ^slicing.rules = #closed
* section[covid19LabOrderManagementSection].entry contains
    covid19LabOrder 1..1 and
    covid19Specimen 1..1 and
    covid19SpecimenCollection 1..1 and
    covid19LabOrderCancellation 0..1 and
    covid19LabResults   0..1
* section[covid19LabOrderManagementSection].entry[covid19LabOrder] only Reference(Covid19LabOrder)
* section[covid19LabOrderManagementSection].entry[covid19Specimen] only Reference(Covid19Specimen)
* section[covid19LabOrderManagementSection].entry[covid19SpecimenCollection] only Reference(Covid19SpecimenCollection)
* section[covid19LabOrderManagementSection].entry[covid19LabOrderCancellation] only Reference(Covid19LabOrderCancellation)
* section[covid19LabOrderManagementSection].entry[covid19LabResults] only Reference(Covid19LabResults)

* section[covid19ImmunizationSection].title = "Covid 19 Immunization"
* section[covid19ImmunizationSection].code = CSCaseReportSections#IMMUNIZATION
* section[covid19ImmunizationSection].entry ^slicing.discriminator.type = #profile
* section[covid19ImmunizationSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19ImmunizationSection].entry ^slicing.rules = #closed
* section[covid19ImmunizationSection].entry contains
    covid19Immunization 1..1 
* section[covid19ImmunizationSection].entry[covid19Immunization] only Reference(Covid19Immunization)


/* Profile: HIVDiagnosisEncounter
Parent: Encounter
Id: hiv-disgnosis-encounter
Title: "HIV Diagnosis Encounter"
Description: "HIV Encounter for a case report"
* serviceProvider 1..1
* subject 1..1
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#PRENC
*/

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

Extension: ClientMiddleName
Id: client-middle-name
Title: "Client Middle name"
Description: "Client Middle name"
* valueString only string

Extension: ClientEstimatedAge
Id: client-estimated-age
Title: "Client Estimated Age"
Description: "Client Estimated Age"
* valueInteger only integer
//* measurement from UnitsOfTime

Extension: ClientWardDivision
Id: client-ward-division
Title: "Client Ward Division"
Description: "Client Ward Division"
* valueString only string


Profile: Covid19RelatedPerson
Parent: RelatedPerson
Id: covid19-RelatedPerson
Title: "Related Person"
Description: "Related Person"
* name.given 1..* MS 
* telecom MS


Profile: Covid19Patient
Parent: Patient
Id: covid19-patient
Title: "Covid19 Patient"
Description: "This Patient profile allows the exchange of patient information, including all the data associated with Covid19 patients"
* name.given 1..* MS   //Client first name (s)
* extension contains
    ClientMiddleName named clientMiddleName 0..1 MS 
* name.family 1..1 MS // Surname
* gender 1..1 MS // Client Sex
* birthDate 1..1 MS   // Client Date of Birth
* extension contains
    ClientEstimatedAge named clientEstimatedAge 0..1 MS  //Estimated Age
* telecom MS  // Client telephone number and Client Email Addresss
//* covid19RelatedPerson only Covid19RelatedPerson 0..1 MS //Next of kin

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type of identifier"

//* address 1..*
* address.country MS    //Client Country  /  Nationality / Citizenship
* address.state MS      //Client County / Province  / State
* address.district MS   //Client SubCounty / District 
* extension contains
    ClientWardDivision named clientWardDivision 1..1 MS  //
* address.line MS   //Client Ward / Division
* address.city MS      //Client Village / Estate */


* identifier contains
    // art 0..* and
    passport 0..* and
    national 0..* and
    pos 0..*

//* identifier[art].value 0..1
//* identifier[art].system = "http://openhie.org/fhir/hiv-casereporting/identifier/art"
* identifier[passport].value 0..1
* identifier[passport].system = "http://openhie.org/fhir/covid19-casereporting/identifier/passport"
* identifier[national].value 0..1
* identifier[national].system = "http://openhie.org/fhir/covid19-casereporting/identifier/nid"
* identifier[pos].value 1..1

//* managingOrganization 1..1

Extension: ReasonforAssessment
Id: reason-for-assessment
Title: "Reason for Assessment"
Description: "Reason for Assessment"
* value[x] only CodeableConcept
* valueCodeableConcept from VSAssessmentReason

Extension: OtherReasonforAssessment
Id: other-reason-for-assessment
Title: "Other-reason for Assessment"
Description: "Other reason for Assessment"
* valueString only string

Extension: Presentation
Id: Presentation
Title: "Presentation"
Description: "Presentation"
* value[x] only CodeableConcept
* valueCodeableConcept from VSPresentation

Profile: Covid19AssessmentEncounter
Parent: Encounter
Id: covid19-encounter
Title: "Covid19 Assessment Encounter"
Description: "Covid19 Assessment Encounter"
* period.start 1..1 MS  //Date of assessment
* subject 1..1 MS //Patient reference
* extension contains ReasonforAssessment named assessmentReason 1..1 MS  //Reason for assessment
* extension contains OtherReasonforAssessment named otherReasonforAssessment 0..1 MS  // Other reasons for assessment
* extension contains Presentation named presentation 0..1 MS  // Presentation
* period.end MS  //Date died

Extension: Covid19SymptomsDate
Id: covid19-symptoms-date
Title: "Date of onset of symptoms"
Description: "Date of onset of symptoms"
* valueDateTime MS 

Extension: Covid19OtherSymptoms
Id: covid19-other-symptoms
Title: "Other specified symptoms"
Description: "Other specified symptoms"
* valueString MS

Profile: Covid19Symptom
Parent: Observation
Id: covid19-symptom
Title: "Covid19 Symptom"
Description: "Covid19 Symptom"
* value[x] only CodeableConcept 
* valueCodeableConcept from VSSymptoms
* extension contains Covid19SymptomsDate named covid19SymptomsDate 0..1 MS
* extension contains Covid19OtherSymptoms named covid19OtherSymptoms 0..1 MS

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
* code 0..0 // #TODO - check how to bind code field to the conditionsComorbidity value set
* extension contains Covid19ComorbidityPresent named covid19ComorbidityPresent 0..1 MS  
* extension contains ConditionsComorbidityExt named conditionsComorbidity 0..1 MS  
* extension contains OtherConditionsComorbidity named otherConditionsComorbidity 0..1 MS  

Extension: Covid19VaccineDoseReceived
Id: covid19-vaccine-dose-received
Title: "Covid19 Vaccine Dose Received"
Description: "Covid19 Vaccine Dose Received"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Extension: Covid19VaccinceType
Id: covid19-vaccine-code
Title: "Covid19 Vaccine type"
Description: "Covid19 Vaccine Type"
* value[x] only CodeableConcept
* valueCodeableConcept from VSVaccineTypes

Profile: Covid19VaccineTypeAdministered
Parent: Immunization
Id: covid19-vaccine-type-administered
Title: "Covid19 Vaccine Type Administered"
Description: "Covid19 Vaccine Type Administered"
* extension contains Covid19VaccineDoseReceived named covid19VaccineDoseReceived 0..1 MS
* extension contains Covid19VaccinceType named covid19VaccinceType 0..1 MS // #TODO investigate how to rather bind vaccineCode to  VSVaccineTypes

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
* value[x] only CodeableConcept
* valueCodeableConcept from VSPatientOutcome 
* extension contains Covid19DateRecovered named covid19DateRecovered 0..1 MS
* extension contains Covid19LongCOVIDDescription named covid19LongCOVIDDescription 0..1 MS
* note MS    //additional notes

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
//* reasonCode.coding.code only Reference(CSAssessmentReason)   #TODO - How to bind reasonCode to Reason Value set?
* subject 1..1 MS // Patient reference
* intent = #order 
* reasonCode  1..1 MS //Reason for testing
* extension contains OtherReasonforAssessment named otherReasonforTesting 0..1 MS
* authoredOn  1..1 MS  //Order date    #TODO - How to add a custom desc to fields?
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
* type 0..0 ////* type    #TODO  - Bind type to CSCovid19SpecimenType - avoid extra extension Covid19SpecimenType?
* collection.collectedDateTime 1..1 MS  // Date specimen collected
* extension contains Covid19SpecimenType named covid19SpecimenType 1..1 MS  
* extension contains OtherReasonforAssessment named otherSpecimenType 0..1 MS

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
* extension contains ReferenceLab named referenceLab 0..1 MS //Reference lab sample sent to  // #TODO  --> Reference lab sample sent to
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
//* reasonCode.coding.code only Reference(CSAssessmentReason)   #TODO - How to bind reasonCode to Reason Value set?
* intent = #order
* focus 1..1 MS // Refer to Lab Order  --> What task is acting on
* for 1..1 MS // Beneficiary of the Task --> Patient
* encounter 1..1 MS // Healthcare event during which this task originated -- >Covid19AssessmentEncounter
* authoredOn 1..1 MS //Cancellation date
* extension contains Covid19CancellationReason named covid19CancellationReason 1..1 MS // #TODO bind statusReason  to VSCancellationReason

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
* conclusionCode MS //Test Result --> Positive/Nagative/inconclusive  -->#TODO - Bind valueset to a afield of type valuecodeableconcept
* extension contains Covid19testCompleted named testCompleted 1..1 MS  //Lab Test Performed
* status MS  //Status of lab order -  #TODO - Bind Valueset to "Pending, complete, canceled, not done"
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

Profile: Covid19Immunization
Parent: Immunization
Id: covid19-immunization
Title: "Covid19 Immunization"
Description: "Covid19 Immunization"
* patient MS // Patient reference
* occurrenceDateTime MS //Vaccination date
* protocolApplied.doseNumberString MS   //#TODO - Bind field to VS --> First, second, booster  
* expirationDate MS    //Vaccine expiration date
* extension contains Covid19NextVaccinationDate named covid19NextVaccinationDate 0..1 MS //Date of next vaccination (if scheduled)
* vaccineCode MS    //Vaccine administered     #TODO - Bind to covid19 vaccince code list
* extension contains Covid19OtherVaccine named covid19OtherVaccine 0..1 MS  //Other vaccine
* lotNumber MS  //Vaccine lot number