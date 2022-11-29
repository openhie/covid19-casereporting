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
* address.country MS    //Client Country  /  Nationality / Citizenship
* address.state MS      //Client County / Province  / State
* address.district MS   //Client SubCounty / District 
* address.line MS   //Client Ward / Division
* address.city MS      //Client Village / Estate */

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type of identifier"

* identifier contains
    passport 0..1 and
    national 0..1 and
    pos 0..1

* identifier[passport].value 0..1
* identifier[passport].system = "http://openhie.org/fhir/covid19-casereporting/identifier/passport"
* identifier[national].value 0..1
* identifier[national].system = "http://openhie.org/fhir/covid19-casereporting/identifier/nid"
* identifier[pos].value 1..1
* identifier[pos].system = "http://openhie.org/fhir/covid19-casereporting/identifier/facility"

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
* period.start 1..1 MS  //Date of assessment
* subject 1..1 MS //Patient reference
* reasonCode 1..* MS  
* reasonCode from VSReasonForAssessmentOrTestNotPerformed 
* reasonCode.text MS
* location.physicalType from VSAdmissionTypes 
* location.physicalType MS //Admission
* extension contains ExtNextVisit named nextVisit 0..1 MS
* extension contains ExtCovid19EverHospitalised named extCovid19EverHospitalised 1..1 MS
* extension contains ExtCovid19DateLastHospitalised named extCovid19DateLastHospitalised 0..1 MS

Profile: Covid19PresentingSymptoms
Parent: Observation
Id: covid19-presenting-symptoms 
Title: "Covid19 Symptom"
Description: "Covid19 Symptom"
* code from VSSymptoms
* code MS
* note MS // other presenting symptoms

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
* code MS
* code from VSConditionsComorbidity  // 
* note MS  //OtherConditions   
* extension contains ExtCovid19ConditionsOrComorbiditiesPresent named extCovid19ConditionsOrComorbiditiesPresent 1..1 MS 

Profile: Covid19VaccineDoseEverReceived
Parent: Observation
Id: covid19-vaccine-dose-ever-received
Title: "Covid19 Vaccine Dose Received"
Description: "Covid19 Vaccine Dose Received"
* code from VSYesNoUnknown

Profile: Covid19AssessmentVaccination
Parent: Immunization
Id: covid19-assessment-vaccination
Title: "Covid19 Vaccination info included as part of the Assessment"
Description: "Covid19 Vaccination info included as part of the Assessment"
* status = #completed
* vaccineCode 1..* 
* vaccineCode from VSVaccineTypes (required)
* patient 1..1
* encounter 1..1
* occurrenceDateTime 1..1
* reportOrigin 1..1
* reportOrigin from VSSourceOfInfo (required)
* lotNumber  1..1
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
* recordedDate MS // Date of Diagnosis
* verificationStatus MS //1..1 MS
//* verificationStatus from VSCovidDiagnosis //Covid Diagnosis
//* clinicalStatus from VSPatientOutcome
//* clinicalStatus 1..1 MS // Patient Outcome
* abatementDateTime 0..1 MS //Date recovered or date symptoms resolved / Date Died
* note MS  // Long covid description and/or Additional notes
* evidence.code from VSPresentation
* evidence.code 1..1 MS
* onsetDateTime MS //date of onset of symptoms

Profile: Covid19MedicationRequest
Parent: MedicationRequest
Id: covid19-medication-request
Title: "Covid19 Treatment dispensed or prescribed"
Description: "Covid19 Treatment dispensed or prescribed"
* medicationCodeableConcept from VSTreatMentDispensedPrescribed 
* medicationCodeableConcept.text MS // Other (specify) - details

Profile: Covid19LabOrder 
Parent: ServiceRequest
Id: covid19-lab-order
Title: "Covid19 Lab Order"
Description: "Covid19 Lab Order"
* identifier 1..1 MS //
* subject 1..1 MS // Patient reference
* intent = #order 
* reasonCode  1..* MS //Reason for testing
* reasonCode from VSReasonForAssessmentOrTestNotPerformed 
* note MS // for capturing other reasons for testing
* encounter 1..1 MS  
* requester MS // Provider name
* occurrenceDateTime 1..1
* code 1..1 MS // Test request Code
* code from VSTestTypes
* locationReference MS //Reference Lab sample send to
* status MS // Status of Lab Order
* occurrenceDateTime MS // sample forwarded to reference lab; Yes = if there is a dateTime when sample was sent
* specimen 1..1 MS //sample
* doNotPerform MS //If yes then a reason for test not performed to be provided in the reasonCode element

//* dataAbsentReason from VSReasonTestNotPerformed  

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
* subject 1..1 MS // Patient reference

Profile: Covid19TestResult
Parent: Observation
Id: covid19-test-results
Title: "Covid19 Lab Results"
Description: "Covid19 Lab Results"
* valueDateTime MS //Test result date-time
* valueCodeableConcept from VSTestResult
* valueCodeableConcept MS //Result Code

Profile: Covid19Vaccination
Parent: Immunization
Id: covid19-vaccination
Title: "Covid19 Vaccination"
Description: "Covid19 Vaccination"
* status = #completed
* vaccineCode 1..* 
* vaccineCode from VSVaccineTypes (required)
* patient 1..1
* encounter 1..1
* occurrenceDateTime 1..1
* reportOrigin 1..1
* reportOrigin from VSSourceOfInfo (required)
* lotNumber  1..1
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
* value[x] only dateTime 1..1

Profile: Covid19ServiceRequestLocation
Parent: Location
Id: covid19-service-request-location
Title: "Covid19 Service Request Location"
Description: "Covid19 Service Request Location"
* name 1..1
* address 1..1

Profile: Covid19AdmissionLocation
Parent: Location
Id: covid19-admission-location
Title: "Covid19 Service Request Location"
Description: "Covid19 Service Request Location"
* name 1..1
* address 1..1

Profile: Covid19RecoveredOrSymptomsResolved
Parent: Observation
Id: covid19-recovered-or-symptoms-resolved 
Title: "Covid19 Recovered Or Symptoms Resolved"
Description: "Covid19 Recovered Or Symptoms Resolved"
* status 1..1
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
* status 1..1
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
* status 1..1
* code = $SCT#1119303003
* subject only Reference(Patient)
* subject 1..1
* encounter 1..1
* effectiveDateTime 1..1
* note.authorReference only Reference(Organization)
* note 1..1