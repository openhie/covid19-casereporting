Instance: Covid19PatientExample
InstanceOf: Covid19Patient
Usage: #example
Title: "Covid19 Patient example"
Description: "Covid19 Patient example"
* active = true
* name.use = #official
* name.given = "Jane"
* name.family = "Smith"
//* maritalStatus.coding[0].code = #M
//* maritalStatus.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus"
* gender = #female
* birthDate = "1986-06-04"
* extension[clientEstimatedAge].valueInteger = 45
* telecom.system = #phone
* telecom.value = "+27825556666"
* address.country = "South Africa"
* address.state = "Western Province"
* extension[clientWardDivision].valueString = "Division 9087"
* address.district = "City of Cape Town"
* address.city = "Cape Town"
* identifier[passport].value = "PASSPORT1234567"
* identifier[passport].system = "http://openhie.org/fhir/covid19-casereporting/identifier/passport"
* identifier[national].value = "NAT1234567"
* identifier[national].system = "http://openhie.org/fhir/covid19-casereporting/identifier/nid"
* identifier[pos].value = "EMR1234567"
* identifier[pos].system = "http://openhie.org/fhir/covid19-casereporting/identifier/facility1"
//* managingOrganization = Reference(HIVOrganizationExample)
//* extension[genderIdentity].valueCodeableConcept = #male
//* extension[keyPopulation].valueCodeableConcept = #transgender

Instance: Covid19RelatedPersonExample
InstanceOf: Covid19RelatedPerson
Title: "Related Person example"
Description: "Related Person example"
* patient = Reference(Covid19PatientExample) 
* name.given = "James"
* telecom.system = #Email

Instance: Covid19AssessmentEncounterExample
InstanceOf: Covid19AssessmentEncounter
Usage: #example
Title: "Covid19 Assessment Encounter example"
Description: "Covid19 Assessment Encounter  example"
* class = #SS                 //#TODO - Mandatory base resource field, make sure about this
* status = #finished
* period.start =  "2022-07-28"  //Date of assessment
* subject = Reference(Covid19PatientExample) //Patient reference
* extension[assessmentReason].valueCodeableConcept = #Other
* extension[otherReasonforAssessment].valueString = "Reasons not provided"
* extension[presentation].valueCodeableConcept = #Symptomatic // Presentation
* period.end  =  "2022-08-15"  //Date of death

Instance: Covid19SymptomExample
InstanceOf: Covid19Symptom
Usage: #example
Title: "Covid19 Symptom example"
Description: "Covid19 Symptom example"
* encounter = Reference(Covid19AssessmentEncounterExample) 
* subject = Reference(Covid19PatientExample) 
* status = #final
* code = $LNC#75618-9   // #todo re-check the LOINC codes
* valueCodeableConcept = #JointPain
* extension[covid19SymptomsDate].valueDate = "2022-07-28"
* extension[covid19OtherSymptoms].valueString = "none"

Instance: Covid19ConditionsComorbidityExample
InstanceOf: Covid19ConditionsComorbidity
Title: "Covid19 Conditions or comorbidity example"
Description: "Covid19 Conditions or comorbidity example"
* subject = Reference(Covid19PatientExample) 
* encounter = Reference(Covid19AssessmentEncounterExample) 
* extension[covid19ComorbidityPresent].valueCodeableConcept = #Yes  
* extension[conditionsComorbidity].valueCodeableConcept = #ChronicLungDisease
* extension[otherConditionsComorbidity].valueString = "none"

Instance: Covid19VaccineTypeAdministeredExample
InstanceOf: Covid19VaccineTypeAdministered
Title: "Covid19 Vaccine Type Administered example"
Description: "Covid19 Vaccine Type Administered example"
* patient = Reference(Covid19PatientExample) 
* encounter = Reference(Covid19AssessmentEncounterExample) 
* extension[covid19VaccineDoseReceived].valueCodeableConcept = #No
* extension[covid19VaccinceType].valueCodeableConcept = #PfizerBionTech  //#TODO - duplciate field to vaccinecode - bind vaccinecode valueset to VSVaccineTypes
* status = #not-done
* vaccineCode.coding.code = #PfizerBionTech 
* occurrenceDateTime = "2022-07-28"

Instance: Covid19PatientOutcomeExample
InstanceOf: Covid19PatientOutcome
Title: "Covid19 Patient Outcome example"
Description: "Covid19 Patient Outcome example"
* encounter = Reference(Covid19AssessmentEncounterExample) 
* subject = Reference(Covid19PatientExample) 
* status = #final
* code = $LNC#75618-9   // #todo re-check the LOINC codes
* valueCodeableConcept = #Recovered
* extension[covid19DateRecovered].valueDateTime = "2022-07-28"
* extension[covid19LongCOVIDDescription].valueString = "none"
* note.text = "patient recovered"

Instance: Covid19LabOrderExample
InstanceOf: Covid19LabOrder
Title: "Covid19 Lab Order example"
Description: "Covid19 Lab Order example"
* encounter = Reference(Covid19AssessmentEncounterExample) 
* subject = Reference(Covid19PatientExample) 
* reasonCode  = #Surveillance
* extension[otherReasonforTesting].valueString = "none"
* authoredOn  = "2022-07-28"
* extension[covid19TestRequested].valueCodeableConcept = #Rapid
* status = #active

Instance: Covid19SpecimenExample
InstanceOf: Covid19Specimen
Title: "Covid19 Specimen example"
Description: "Covid19 Specimen example"
* collection.collectedDateTime = "2022-07-28"
* extension[covid19SpecimenType].valueCodeableConcept = #Serum  
* extension[otherSpecimenType].valueString   = "none"

Instance: Covid19Laboratory
InstanceOf: Organization
Title: "Covid19 Laboratory"
Description: "Covid19 Laboratory testing the specimen"
* identifier.id = "Lab001"

Instance: Covid19SpecimenCollectionExample
InstanceOf: Covid19SpecimenCollection
Title: "Covid19 Specimen Collection"
Description: "Covid19 Specimen Collection"
* status = #final
* code = $LNC#100156-9
* encounter = Reference(Covid19AssessmentEncounterExample) 
* subject = Reference(Covid19PatientExample) 
* specimen = Reference(Covid19SpecimenExample)
* identifier.id = "12341324"
* extension[covid19SpecimenForwarded].valueCodeableConcept = #Yes
* extension[referenceLab].valueReference = Reference(Covid19Laboratory) 

Instance: Covid19OrderCancellationExample
InstanceOf: Covid19LabOrderCancellation
Title: "Covid19 Lab Order Cancellation  example"
Description: "Covid19 Lab Order Cancellation Task example"
* focus = Reference(Covid19LabOrderExample)
* for   = Reference(Covid19PatientExample)
* encounter  = Reference(Covid19AssessmentEncounterExample) 
* status = #requested
* authoredOn = "2022-07-28"
* extension[covid19CancellationReason].valueCodeableConcept = #Duplicate

Instance: Covid19LabResultsExample
InstanceOf: Covid19LabResults
Title: "Covid19 Lab Results example"
Description: "Covid19 Lab Results example"
* code = $LNC#100156-9    /// #TODO --> Identify correct LOINC code
* encounter = Reference(Covid19AssessmentEncounterExample) 
* subject = Reference(Covid19PatientExample) 
* identifier.id = "12341324"
* effectiveDateTime = "2022-07-28"
* conclusionCode.coding.code =  #Positive
* extension[testCompleted].valueCodeableConcept = #Yes
* status = #final //#TODO - change to specific VS in spreadsheet
* extension[reasonTestNotPerformed].valueCodeableConcept = #Other

Instance: Covid19ImmunizationExample
InstanceOf: Covid19Immunization
Title: "Covid19 Immunization example"
Description: "Covid19 Immunization"
* status = #final
* patient = Reference(Covid19PatientExample)
* occurrenceDateTime = "2022-07-28"
* protocolApplied.doseNumberString = "first" 
* expirationDate = "2022-12-28"
* extension[covid19NextVaccinationDate].valueDate = "2022-12-28"
* vaccineCode =   $LNC#1234   //#TODO
* extension[covid19OtherVaccine].valueString = "n/a"
* lotNumber = "1"