Alias: $SCT = http://snomed.info/sct
Alias: $LNC = http://loinc.org
Alias: $ICD = http://id.who.int/icd11/mms
Alias: $LNC-LL3044-6 = https://loinc.org/LL3044-6 
//Alias: $KEYPOPULATION = https://openhie.github.io/hiv-ig/ValueSet-vs-key-population

CodeSystem: CSCaseReportSections
Id: cs-case-report-sections
Title: "Covid19 Case Report Sections codesystem"
Description: ""
* #CLIENT-REGISTRATION
* #COVID-ASSESSMENT
* #LABORDER-MANAGEMENT
* #COVID-VACCINATION

CodeSystem: CSOther
Id: cs-other
Title: "Covid19 Case Report Sections codesystem"
Description: ""
* #Other "Other (specify)"

ValueSet: VSAssessmentReason
Id: vs-assessment-reason
Title: "Assessment Reason valueset"
Description:  "Valueset - assessment reason"
* include codes from system $SCT where concept is-a #428792000 "Contact of a case"
* include codes from system $SCT where concept is-a #171367005 "Entry into a country"
* include codes from system $SCT where concept is-a #308273005 "Follow-up"
* include codes from system $SCT where concept is-a #223366009 "Health worker"
* include codes from system $SCT where concept is-a #34325006 "Other frontline worker"
* include codes from system $SCT where concept is-a #168260004 "Post-mortem"
* include codes from system $SCT where concept is-a #170497006 "Quarantine"
* include codes from system $SCT where concept is-a #273407003 "RDT confirmatory"
* include codes from system $SCT where concept is-a #243790003 "Surveillance"
* include codes from system $SCT where concept is-a #264931009 "Symptomatic/Illness"
* include codes from system $SCT where concept is-a #171367005 "Travel out of country"
* include codes from system $SCT where concept is-a #255375007 "Voluntary"
* include codes from system CSOther

ValueSet: VSPresentation
Id: vs-presentation
Title: "Presentation valueset"
Description:  "Valueset - presentation"
* include codes from system $SCT where concept is-a #84387000 "Asymptomatic"
* include codes from system $SCT where concept is-a #264931009 "Symptomatic"

ValueSet: VSSymptoms
Id: vs-symptoms
Title: "Presenting symptoms"
Description:  "A list of symptoms"
* include codes from system $SCT where concept is-a #21522001 "Abdominal Pain"
* include codes from system $SCT where concept is-a #29857009 "Chest pain"
* include codes from system $SCT where concept is-a #49727002 "Cough"
* include codes from system $SCT where concept is-a #62315008 "Diarrhoea" 
* include codes from system $SCT where concept is-a #3006004  "Disturbance of Consciousness" 
* include codes from system $SCT where concept is-a #13791008 "General Weakness" 
* include codes from system $SCT where concept is-a #25064002 "Headache" 
* include codes from system $SCT where concept is-a #386661006 "History Of Fever Or Chills" 
* include codes from system $SCT where concept is-a #130987000 "Irritability / Confusion" 
* include codes from system $SCT where concept is-a #57676002 "Joint Pain" 
* include codes from system $SCT where concept is-a #44169009 "Loss of smell" 
* include codes from system $SCT where concept is-a #36955009 "Loss of Taste" 
* include codes from system $SCT where concept is-a #68962001 "Muscular pain" 
* include codes from system $SCT where concept is-a #16932000 "Nausea/vomiting" 
* include codes from system $SCT where concept is-a #703630003 "Red eyes (Conjunctival hyperemia)" 
* include codes from system $SCT where concept is-a #64531003 "Runny nose" 
* include codes from system $SCT where concept is-a #373895009 "Shortness of breath (Acute respiratory distress)" 
* include codes from system $SCT where concept is-a #76067001 "Sneezing" 
* include codes from system $SCT where concept is-a #162397003 "Sore Throat" 
* include codes from system $SCT where concept is-a #224960004 "Tiredness"
* include codes from system CSOther

ValueSet: VSAdmissionTypes
Id: vs-AdmissionTypes
Title: "Admission Types"
Description: "A list of Admission Types"
* include codes from system $SCT where concept is-a #225746001 "Ward"
* include codes from system $SCT where concept is-a #309904001 "ICU"
* include codes from system $SCT where concept is-a #397771005 "HDU"

ValueSet: VSYesNoUnknown
Id: vs-yes-no
Title: "Yes No Unknown"
Description:  "Yes No Unknown"
* include codes from system $LNC-LL3044-6

ValueSet: VSCovidDiagnosis
Id: vs-covid-diagnosis
Title: "COVID Diagnosis list"
Description: "COVID Diagnosis list"
// * include codes from system $SCT where concept is-a #410605003 "Confirmed"
// * include codes from system $SCT where concept is-a #2931005 "Probable"
// * include codes from system $SCT where concept is-a #415684004 "Suspect"
* include codes from system $SCT

ValueSet: VSConditionsComorbidity
Id: vs-conditions-comorbidity
Title: "List of Conditions / Comorbidity"
Description:  "List of Conditions / Comorbidity"
* include codes from system $SCT where concept is-a #49601007 "Cardiovascular disease e.g heart failure"
* include codes from system $SCT where concept is-a #13645005 "Chronic Lung Disease"
* include codes from system $SCT where concept is-a #118940003 "Chronic neurological or neuromuscular disease"
* include codes from system $SCT where concept is-a #77176002 "Current smoker"
* include codes from system $SCT where concept is-a #46635009 "Diabetes type 1" 
* include codes from system $SCT where concept is-a #44054006 "Diabetes type 2" 
* include codes from system $SCT where concept is-a #73211009 "Diabetes Type other or unspecified" 
* include codes from system $SCT where concept is-a #165816005 "HIV /AIDS"
* include codes from system $SCT where concept is-a #38341003 "Hypertension"
* include codes from system $SCT where concept is-a #234532001 "Immunodeficiency"
* include codes from system $SCT where concept is-a #76783007 "Liver disease"
* include codes from system $SCT where concept is-a #363346000 "Malignancy"
* include codes from system $SCT where concept is-a #709044004 "Renal disease"
* include codes from system $SCT where concept is-a #56717001 "TB"
* include codes from system CSOther

CodeSystem: CSTreatMentDispensedPrescribed
Id: cs-treatment-dispensed-prescribed
Title: "COVID Treatmens dispensed or prescribed"
Description: "COVID Treatmens dispensed or prescribed"
* #Paxlovid "Paxlovid"
* #Other "Other (specify)"

ValueSet: VSTreatMentDispensedPrescribed
Id: vs-treatment-dispensed-prescribed
Title: "COVID Treatmens dispensed or prescribed"
Description: "COVID Treatmens dispensed or prescribed"
* include codes from system CSTreatMentDispensedPrescribed

ValueSet: VSVaccineTypes
Id: vs-vaccine-types
Title: "Vaccine Types"
Description: "A list of Vaccine Types"
* include codes from system $ICD where concept is-a #XM4YL8 "AstraZeneca/Oxford vaccine"
* include codes from system $ICD where concept is-a #XM6QV1 "Johnson and Johnson"
* include codes from system $ICD where concept is-a #XM3DT5 "Moderna"
* include codes from system $ICD where concept is-a #XM8NQ0 "Pfizer/BionTech"
* include codes from system $ICD where concept is-a #XM8866 "Sinopharm"
* include codes from system $ICD where concept is-a #XM7HT3 "Sinovac"
* include codes from system $ICD where concept is-a #XM1G90 "COVAXIN"
* include codes from system $ICD where concept is-a #XM9T65  "Covovax"
* include codes from system $ICD where concept is-a #XM5JC5 "Nuvaxovid"
* include codes from system $ICD where concept is-a #XM1AG7 "CanSino "

ValueSet: VSPatientOutcome
Id: vs-patient-outcome
Title: "Patient Outcome"
Description: "A list of Patient Outcomes"
* include codes from system $SCT where concept is-a #370996005 "Recovered (Symptoms resolved)"
* include codes from system $SCT where concept is-a #419099009 "Died"
* include codes from system $SCT where concept is-a #1119303003 "Long COVID /Post-COVID"

ValueSet: VSTestTypes
Id: vs-test-types
Title: "Test Types"
Description: "A list of Test Types"
* include codes from system $LNC where concept is-a #94558-4 "Rapid Antigen Test"
* include codes from system $LNC where concept is-a #94745-7 "Diagnostic PCR Test"

//double check with Marius
CodeSystem: CSCancellationReason
Id: cs-cancellation-reason
Title: "Cancellation Reasons"
Description: "A list of Cancellation Reasons"
* #Duplicate "duplicate orders" //find out from CDC the snomed code
* #PCR "Improperly ordered" //find out from CDC the snomed code
* #VOID "No longer required" //find out from CDC the snomed code
* #NoSample "No sample collected"
* #Old "Old order, Wrong entry" //find out from CDC the snomed code

ValueSet: VSCancellationReason
Id: vs-cancellation-reason
Title: "Test Types"
Description: "A list of Cancellation Reasons"
* include codes from system $SCT where concept is-a #281264009 "Improperly ordered" //need to double check the code from with CDC
* include codes from system $SCT where concept is-a #281266006 "No sample collected"
* include codes from system $SCT where concept is-a #135839007  "Sample rejected"

ValueSet: VSCovid19SpecimenType
Id: vs-covid19-specimen-type
Title: "Covid19 Specimen Type"
Description: "A list of Covid19 Specimen Type"
* include codes from system $SCT where concept is-a #258500001 "Nasopharyngeal"
* include codes from system $SCT where concept is-a #461911000124106 "Oropharyngeal swab" //TODO: replaced with the correct code. MDS uses the wrong one: 461911000000000
* include codes from system $SCT where concept is-a #119324002 "unknown"
* include codes from system CSOther

ValueSet: VSReasonTestNotPerformed
Id: vs-covid19-reason-test-not-performed
Title: "Covid19 Specimen Type"
Description: "A list of Covid19 Specimen Type"
* include codes from system $SCT where concept is-a #441510007 "Blood sample coagulated" //TODO: CDC to clarify
* include codes from system $SCT where concept is-a #123840003 "Contaminated specimen"
* include codes from system $SCT where concept is-a #397933008 "Equipment failure"
* include codes from system $SCT where concept is-a #281264009 "Inappropriate sample container used"
* include codes from system $SCT where concept is-a #281268007 "Insufficient sample"
* include codes from system $SCT where concept is-a #281265005 "Specimen not labeled"
* include codes from system $SCT where concept is-a #419182006 "Supplies not available"
* include codes from system CSOther

ValueSet: VSTestResult
Id: vs-covid19-test-result
Title: "Covid19 Test Result"
Description: "Covid19 Test Result"
* include codes from system $SCT where concept is-a #10828004 "Positive"
* include codes from system $SCT where concept is-a #260385009 "Negative"
* include codes from system $SCT where concept is-a #419984006 "Inconclusive"

ValueSet: VSLabOrderStatus
Id: vs-covid19-lab-order-status
Title: "Covid19 Lab Order Status"
Description: "Covid19 Lab Order Status"
* include codes from system $SCT where concept is-a #255594003 "Pending" //no code provided in the google sheet. added a duplication of complete code
* include codes from system $SCT where concept is-a #255594003 "Complete"
* include codes from system $SCT where concept is-a #89925002 "Cancelled"
* include codes from system $SCT where concept is-a #385660001 "Not done"

CodeSystem: CSSourceOfInfo
Id: cs-source-of-info
Title: "Source of information - codes"
Description: "Source of information - codes"
* #PatientRecall "Patient Recall"
* #VaccineCard "Vaccine Card"
* #MobilePhoneNotification "Mobile Phone Notification"
* #VaccineAdministeredFromFacility "Vaccine Administered from this facility"
* #Other "Other"

ValueSet: VSSourceOfInfo
Id: vs-source-of-info
Title: "Source of information - codes"
Description: "Source of information - codes"
* include codes from system CSSourceOfInfo
/*
ValueSet: VSKeyPopulation
Id: vs-key-population
Title: "Key population"
Description: "A list of key population types"
* include codes from system $KEYPOPULATION
*/