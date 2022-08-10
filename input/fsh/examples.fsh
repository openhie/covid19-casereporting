Instance: Covid19BundleExample
InstanceOf: Bundle
Usage: #example
Title: "Covid19 Case Report - Full Bundle Example"
Description: "Example of a clinical bundle representing a case report"
* type = #document
* entry[+].fullUrl = "Composition/Covid19CompositionExample"
* entry[=].resource = Covid19CompositionExample
* entry[+].fullUrl = "Composition/Covid19PatientExample"
* entry[=].resource = Covid19PatientExample
* entry[+].fullUrl = "Composition/Covid19RelatedPersonExample"
* entry[=].resource = Covid19RelatedPersonExample
* entry[+].fullUrl = "Composition/Covid19AssessmentEncounterExample"
* entry[=].resource = Covid19AssessmentEncounterExample
* entry[+].fullUrl = "Composition/Covid19SymptomExample"
* entry[=].resource = Covid19SymptomExample
* entry[+].fullUrl = "Composition/Covid19ConditionsComorbidityExample"
* entry[=].resource = Covid19ConditionsComorbidityExample
* entry[+].fullUrl = "Composition/Covid19VaccineTypeAdministeredExample"
* entry[=].resource = Covid19VaccineTypeAdministeredExample
* entry[+].fullUrl = "Composition/Covid19PatientOutcomeExample"
* entry[=].resource = Covid19PatientOutcomeExample
* entry[+].fullUrl = "Composition/Covid19LabOrderExample"
* entry[=].resource = Covid19LabOrderExample
* entry[+].fullUrl = "Composition/Covid19SpecimenExample"
* entry[=].resource = Covid19SpecimenExample
* entry[+].fullUrl = "Composition/Covid19SpecimenCollectionExample"
* entry[=].resource = Covid19SpecimenCollectionExample
* entry[+].fullUrl = "Composition/Covid19LabOrderCancellationExample"
* entry[=].resource = Covid19LabOrderCancellationExample
* entry[+].fullUrl = "Composition/Covid19LabResultsExample"
* entry[=].resource = Covid19LabResultsExample
* entry[+].fullUrl = "Composition/Covid19ImmunizationExample"
* entry[=].resource = Covid19ImmunizationExample


Instance: Covid19CompositionExample
InstanceOf: Covid19Composition
Usage: #example
Title: "Covid19 Case Report Composition Example"
Description: "Basic Composition example"
* status = #final
* identifier.system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-case-report"
* identifier.value = "1111"
* date = "2022-08-04"
* author = Reference(Covid19OrganizationExample)
* title = "Covid19 Case Report"

* section[+].title = "Client registration"
* section[=].code = CSCaseReportSections#CLIENT-REGISTRATION
* section[=].entry[+] = Reference(Covid19PatientExample)
* section[=].entry[+] = Reference(Covid19RelatedPersonExample)  //next of Kin

* section[+].title = "Covid19 Assessment Encounter"
* section[=].code = CSCaseReportSections#ASSESSMENT
* section[=].entry[+] = Reference(Covid19SymptomExample)
* section[=].entry[+] = Reference(Covid19ConditionsComorbidityExample)  
* section[=].entry[+] = Reference(Covid19VaccineTypeAdministeredExampleministered) 
* section[=].entry[+] = Reference(Covid19PatientOutcomeExample) 

* section[+].title = "Lab Order Management"
* section[=].code = CSCaseReportSections#LABORDER
* section[=].entry[+] = Reference(Covid19LabOrderExample)
* section[=].entry[+] = Reference(Covid19SpecimenExample)  
* section[=].entry[+] = Reference(Covid19SpecimenCollectionExample) 
* section[=].entry[+] = Reference(Covid19LabOrderCancellationExample ) 
* section[=].entry[+] = Reference(Covid19LabResultsExamples) 

* section[+].title = "Covid 19 Immunization"
* section[=].code = CSCaseReportSections#IMMUNIZATION
* section[=].entry[+] = Reference(IMMUNIZATION)

Instance: Covid19OrganizationExample
InstanceOf: Covid19Organization
Usage: #example
Title: "Covid19 Organization example"
Description: "Covid19 Organization example"
* address[+].country = "CARES country"
* address[=].state = "CARES state 1"
* address[=].district = "CARES district 1"
* address[=].city = "CARES city 1"
* address[=].line[+] = "CARES line 1"
* address[=].line[+] = "CARES line 2"
* address[=].line[+] = "CARES line 3"
* address[=].postalCode = "CARES postal code"
* name = "Covid19 Organization"
* identifier[+].system = "http://openhie.org/fhir/covid19-casereporting/identifier/covid19-organization"
* identifier[=].value = "facility1"


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
* managingOrganization = Reference(Covid19OrganizationExample)

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
* code = #ChronicLungDisease
* extension[otherConditionsComorbidity].valueString = "none"

Instance: Covid19VaccineTypeAdministeredExample
InstanceOf: Covid19VaccineTypeAdministered
Title: "Covid19 Vaccine Type Administered example"
Description: "Covid19 Vaccine Type Administered example"
* patient = Reference(Covid19PatientExample) 
* encounter = Reference(Covid19AssessmentEncounterExample) 
* extension[covid19VaccineDoseReceived].valueCodeableConcept = #No
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
* status = #Pending
* code = $LNC#75618-9   // #todo re-check the LOINC codes

Instance: Covid19SpecimenExample
InstanceOf: Covid19Specimen
Title: "Covid19 Specimen example"
Description: "Covid19 Specimen example"
* collection.collectedDateTime = "2022-07-28"
* type = #Serum  
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

Instance: Covid19LabOrderCancellationExample
InstanceOf: Covid19LabOrderCancellation
Title: "Covid19 Lab Order Cancellation  example"
Description: "Covid19 Lab Order Cancellation Task example"
* focus = Reference(Covid19LabOrderExample)
* for   = Reference(Covid19PatientExample)
* encounter  = Reference(Covid19AssessmentEncounterExample) 
* status = #requested
* authoredOn = "2022-07-28"
* reasonCode = #Duplicate

Instance: Covid19LabResultsExample
InstanceOf: Covid19LabResults
Title: "Covid19 Lab Results example"
Description: "Covid19 Lab Results example"
* code = $LNC#100156-9 
* code.coding.system = $LNC
* code.coding.code = $LNC#100156-9    /// #TODO --> Identify correct LOINC code
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
* protocolApplied.doseNumber[x].extension[covid19DoseNumberCode].valueCodeableConcept = #First
* expirationDate = "2022-12-28"
* extension[covid19NextVaccinationDate].valueDate = "2022-12-28"
* vaccineCode =   #Astrazeneca
* extension[covid19OtherVaccine].valueString = "n/a"
* lotNumber = "1"