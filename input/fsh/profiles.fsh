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

//* extension contains KeyPopulation named keyPopulation 0..1 MS

* managingOrganization 1..1

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
* extension contains ExtNextVisit named nextVisit 0..1 MS

Profile: Covid19Symptom
Parent: ClinicalImpression
Id: covid19-symptom
Title: "Covid19 Symptom"
Description: "Covid19 Symptom"
* investigation.code from VSSymptoms
* investigation.code MS
* note MS // other presenting symptoms

Profile: Covid19ConditionsComorbidity
Parent: Condition
Id: covid19-conditions-comorbidity
Title: "Covid19 Conditions or comorbidity"
Description: "Covid19 Conditions or comorbidity"
* code MS
* code from VSConditionsComorbidity 
* note MS  //OtherConditions   #TODO: Conditional rule: mandatory if code = #Other

Extension: ExtVaccineDoseReceived
Id: ever-received-dose-of-vaccine
Title: "Covid19 Vaccine Dose Received Extension"
Description: "Covid19 Vaccine Dose Extension"
* value[x] only CodeableConcept
* valueCodeableConcept from VSYesNoUnknown

Profile: Covid19VaccineDoseEverReceived
Parent: Observation
Id: covid19-vaccine-dose-received
Title: "Covid19 Vaccine Dose Received"
Description: "Covid19 Vaccine Dose Received"
* extension contains ExtVaccineDoseReceived named vaccineDoseEverReceived 1..1 MS  //ever-received-dose-of-vaccine

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
* reportOrigin 1..1 MS 
* reportOrigin from VSSourceOfInfo  // source of information
* reportOrigin.text MS // Other Source of info details

Profile: Covid19Diagnosis
Parent: Condition
Id: covid19-diagnosis
Title: "Covid19 Diagnosis"
Description: "Covid19 Diagnosis"
* recordedDate MS // Date of Diagnosis
* verificationStatus 1..1 MS
* verificationStatus from VSCovidDiagnosis //Covid Diagnosis
* clinicalStatus from VSPatientOutcome
* clinicalStatus 1..1 MS // Patient Outcome
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
* reasonCode from VSAssessmentReason 
* note MS // for capturing other reasons for testing
* encounter 1..1 MS  
* requester MS // Provider name
* occurrenceDateTime 1..1
* code from VSTestTypes
* code 1..1 MS // Test request Code
* locationReference MS //Reference Lab sample send to
* status MS // Status of Lab Order
* occurrenceDateTime MS // sample forwarded to reference lab; Yes = if there is a dateTime when sample was sent
* specimen 1..1 MS //sample

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

Profile: Covid19ReasonTestNotPerformed
Parent: Observation
Id: covid19-reason-test-not-performed
Title: "Covid19 Reason Test Not Performed"
Description: "Covid19 reason test not peformed"
* dataAbsentReason from VSReasonTestNotPerformed   
* dataAbsentReason MS //Reason test not performed

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
* vaccineCode.text MS //other vaccine details
* lotNumber  1..1 MS  //Vaccine lot number
* note MS // notes
* reportOrigin 1..1 MS 
* reportOrigin from VSSourceOfInfo  // source of information
* reportOrigin.text MS // Other Source of info details

Extension: ExtNextVisit
Id: next-visit
Title: "Covid19 date of next vaccination"
Description: "Covid19 date of next vaccination"
* value[x] only dateTime  //// date of next vaccination


Profile: Covid19ServiceRequestLocation
Parent: Location
Id: covid19-service-request-location
Title: "Covid19 Service Request Location"
Description: "Covid19 Service Request Location"
* name MS
* address MS