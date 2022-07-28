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
    covid19PatientSection 1..1 
    // hivDiagnosisSection 0..1 and
    // hivEntryToCareSection 0..1 and
    // arvTreatmentSection 0..1 and
    // cd4Section 0..1 and
    // viralSuppressionSection 0..1 and
    // deathSection 0..1
* section[covid19PatientSection].title = "Client registration"
//* section[covid19PatientSection].code = CSCaseReportSections#CLIENT-REGISTRATION
* section[covid19PatientSection].entry ^slicing.discriminator.type = #profile
* section[covid19PatientSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[covid19PatientSection].entry ^slicing.rules = #closed
* section[covid19PatientSection].entry contains
    covid19Patient 1..1 and
    covid19RelatedPerson 0..*
* section[covid19PatientSection].entry[covid19Patient] only Reference(Covid19Patient)
//* section[covid19PatientSection].entry[hivRelatedPerson] only Reference(HIVRelatedPerson)

/* * section[hivDiagnosisSection].title = "HIV Diagnosis"
* section[hivDiagnosisSection].code = CSCaseReportSections#HIV-DIAGNOSIS
* section[hivDiagnosisSection].entry only Reference(HIVDiagnosis or HIVDiagnosisEncounter or HIVRecencyTestConducted or HIVRecencyResult)
* section[hivDiagnosisSection].entry ^slicing.discriminator.type = #profile
* section[hivDiagnosisSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[hivDiagnosisSection].entry ^slicing.rules = #closed
* section[hivDiagnosisSection].entry contains
    hivDiagnosis 1..1 and
    hivDiagnosisEncounter 1..1 and
    hivRecencyTestConducted 1..1 and
    hivRecencyResult 1..1
* section[hivDiagnosisSection].entry[hivDiagnosis] only Reference(HIVDiagnosis)
* section[hivDiagnosisSection].entry[hivDiagnosisEncounter] only Reference(HIVDiagnosisEncounter)
* section[hivDiagnosisSection].entry[hivRecencyTestConducted] only Reference(HIVRecencyTestConducted)
* section[hivDiagnosisSection].entry[hivRecencyResult] only Reference(HIVRecencyResult)

* section[hivEntryToCareSection].title = "HIV Entry To Care"
* section[hivEntryToCareSection].code = CSCaseReportSections#HIV-ENTRY-TO-CARE
* section[hivEntryToCareSection].entry only Reference(HIVEpisodeOfCare or HIVClinicalEncounter)
* section[hivEntryToCareSection].entry ^slicing.discriminator.type = #profile
* section[hivEntryToCareSection].entry ^slicing.discriminator.path = "item.resolve()"
* section[hivEntryToCareSection].entry ^slicing.rules = #closed
* section[hivEntryToCareSection].entry contains
    hivEpisodeOfCare 1..1 and
    hivClinicalEncounter 1..1
* section[hivEntryToCareSection].entry[hivEpisodeOfCare] only Reference(HIVEpisodeOfCare)
* section[hivEntryToCareSection].entry[hivClinicalEncounter] only Reference(HIVClinicalEncounter)

* section[arvTreatmentSection].title = "ARV Treatment"
* section[arvTreatmentSection].code = CSCaseReportSections#ARV-TREATMENT
* section[arvTreatmentSection].entry only Reference(ARVTreatment)

* section[cd4Section].title = "CD4"
* section[cd4Section].code = CSCaseReportSections#CD4
* section[cd4Section].entry only Reference(CD4)

* section[viralSuppressionSection].title = "Viral Suppression"
* section[viralSuppressionSection].code = CSCaseReportSections#VIRAL-SUPPRESSION
* section[viralSuppressionSection].entry only Reference(ViralLoadSuppression)

* section[deathSection].title = "Death"
* section[deathSection].code = CSCaseReportSections#DEATH
* section[deathSection].entry only Reference(DeathObs) */

/* Profile: HIVDiagnosisEncounter
Parent: Encounter
Id: hiv-disgnosis-encounter
Title: "HIV Diagnosis Encounter"
Description: "HIV Encounter for a case report"
* serviceProvider 1..1
* subject 1..1
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#PRENC

Profile: HIVClinicalEncounter
Parent: Encounter
Id: hiv-clinical-encounter
Title: "HIV Clinical Encounter"
Description: "HIV Encounter for a case report"
* subject 1..1
* period.start 1..1
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#OBSENC

Profile: HIVOrganization
Parent: Organization
Id: hiv-organization
Title: "HIV Organization"
Description: "HIV Organization for case report - this represents a health facility"
* address 1..1
* address.country 1..1
* address.state 1..1
* address.district 1..1
* address.city 1..1
* identifier 1..* */

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
* name 1..* MS 
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
* extension contains OtherReasonforAssessment named OtherReasonforAssessment 0..1 MS  // Other reasons for assessment
* extension contains Presentation named presentation 0..1 MS  // Presentation
* period.end MS  //Date died

Profile: Covid19SymptomsDate
Parent: Observation
Id: covid19-symptoms-date
Title: "Date of onset of symptoms"
Description: "Date of onset of symptoms"
* valueDateTime MS 

Profile: Covid19Symptom
Parent: Observation
Id: covid19-symptom
Title: "Covid19 Symptom"
Description: "Covid19 Symptom"
* value[x] only CodeableConcept 
* valueCodeableConcept from VSSymptoms 

Profile: Covid19OtherSymptoms
Parent: Observation
Id: covid19-other-symptoms
Title: "Other specified symptoms"
Description: "Other specified symptoms"
* valueString MS

Profile: Covid19ComorbidityPresent
Parent: Observation
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

Profile: Covid19ConditionsComorbidity
Parent: Condition
Id: covid19-conditions-comorbidity
Title: "Covid19 Conditions or comorbidity"
Description: "Covid19 Conditions or comorbidity"
* code 1..1 MS
//* CodeableConcept from VSConditionsComorbidity
* extension contains OtherConditionsComorbidity named otherConditionsComorbidity 0..1 MS  //Reason for assessment

Profile: Covid19VaccineDoseReceived
Parent: Observation
Id: covid19-vaccine-dose-received
Title: "Covid19 Vaccine Dose Received"
Description: "Covid19 Vaccine Dose Received"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Profile: Covid19VaccineTypeAdministered
Parent: Immunization
Id: covid19-vaccine-type-administered
Title: "Covid19 Vaccine Type Administered"
Description: "Covid19 Vaccine Type Administered"
* vaccineCode  MS  // #TODO include only code from valueCodeableConcept from VSVaccineTypes

Profile: Covid19PatientOutcome
Parent: Observation
Id: covid19-patient-outcome
Title: "Covid19 Patient Outcome"
Description: "Covid19 Patient Outcome"
//* value[x] only CodeableConcept
* valueCodeableConcept from VSPatientOutcome 
* valueString MS //Long COVID / post-COVID description
* note MS    //additional notes

Profile: Covid19DateRecovered  
Parent: Observation
Id: covid19-date-recovered
Title: "Covid19 Date Recovered"
Description: "Date recovered or date symptoms resolved"
* valueDateTime MS 