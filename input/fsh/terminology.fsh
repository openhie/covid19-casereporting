Alias: $SCT = http://snomed.info/sct
Alias: $LNC = https://loinc.org
Alias: $ICD = http://id.who.int/icd11/mms
//Alias: $LNC-LL3044-6 = https://loinc.org/LL3044-6 

CodeSystem: CSCaseReportSections
Id: cs-case-report-sections
Title: "Covid19 Case Report Sections codesystem"
Description: ""
* #CLIENT-REGISTRATION
* #COVID-ASSESSMENT
* #LABORDER-MANAGEMENT
* #COVID-VACCINATION

CodeSystem: CSOther   //#TODO --> Other should not be an option, details specified per note
Id: cs-other
Title: "Covid19 Case Report Sections codesystem"
Description: ""
* #Other "Other (specify)"

ValueSet: VSAssessmentReason
Id: vs-assessment-reason
Title: "Assessment Reason valueset"
Description:  "Valueset - assessment reason"
* $SCT#428792000 "Contact of a case"
* $SCT#171367005 "Entry into a country"
* $SCT#308273005 "Follow-up"
* $SCT#223366009 "Health worker"
* $SCT#34325006 "Other frontline worker"
* $SCT#168260004 "Post-mortem"
* $SCT#170497006 "Quarantine"
* $SCT#273407003 "RDT confirmatory"
* $SCT#243790003 "Surveillance"
* $SCT#264931009 "Symptomatic/Illness"
* $SCT#171367005 "Travel out of country"
* $SCT#255375007 "Voluntary"
* include codes from system CSOther   //#TODO Remove as it does not have a real code and system

ValueSet: VSPresentation
Id: vs-presentation
Title: "Presentation valueset"
Description:  "Valueset - presentation"
* $SCT#84387000 "Asymptomatic"
* $SCT#264931009 "Symptomatic"

ValueSet: VSSymptoms
Id: vs-symptoms
Title: "Presenting symptoms"
Description:  "A list of symptoms"
* $SCT#21522001 "Abdominal Pain"
* $SCT#29857009 "Chest pain"
* $SCT#49727002 "Cough"
* $SCT#62315008 "Diarrhoea" 
* $SCT#3006004  "Disturbance of Consciousness" 
* $SCT#13791008 "General Weakness" 
* $SCT#25064002 "Headache" 
* $SCT#386661006 "History Of Fever Or Chills" 
* $SCT#130987000 "Irritability / Confusion" 
* $SCT#57676002 "Joint Pain" 
* $SCT#44169009 "Loss of smell" 
* $SCT#36955009 "Loss of Taste" 
* $SCT#68962001 "Muscular pain" 
* $SCT#16932000 "Nausea/vomiting" 
* $SCT#703630003 "Red eyes (Conjunctival hyperemia)" 
* $SCT#64531003 "Runny nose" 
* $SCT#373895009 "Shortness of breath (Acute respiratory distress)" 
* $SCT#76067001 "Sneezing" 
* $SCT#162397003 "Sore Throat" 
* $SCT#224960004 "Tiredness"
* include codes from system CSOther

ValueSet: VSAdmissionTypes
Id: vs-AdmissionTypes
Title: "Admission Types"
Description: "A list of Admission Types"
* $SCT#225746001 "Ward"
* $SCT#309904001 "ICU"
* $SCT#397771005 "HDU"

ValueSet: VSYesNoUnknown
Id: vs-yes-no
Title: "Yes No Unknown"
Description:  "Yes No Unknown"
* $SCT#373066001 "Yes"
* $SCT#373067005 "No"
* $SCT#261665006 "Unknown"

ValueSet: VSCovidDiagnosis
Id: vs-covid-diagnosis
Title: "COVID Diagnosis list"
Description: "COVID Diagnosis list"
* $SCT#410605003 "Confirmed"
* $SCT#2931005 "Probable"
* $SCT#415684004 "Suspect"

ValueSet: VSConditionsComorbidity
Id: vs-conditions-comorbidity
Title: "List of Conditions / Comorbidity"
Description:  "List of Conditions / Comorbidity"
* $SCT#49601007 "Cardiovascular disease e.g heart failure"
* $SCT#13645005 "Chronic Lung Disease"
* $SCT#118940003 "Chronic neurological or neuromuscular disease"
* $SCT#77176002 "Current smoker"
* $SCT#46635009 "Diabetes type 1" 
* $SCT#44054006 "Diabetes type 2" 
* $SCT#73211009 "Diabetes Type other or unspecified" 
* $SCT#165816005 "HIV /AIDS"
* $SCT#38341003 "Hypertension"
* $SCT#234532001 "Immunodeficiency"
* $SCT#76783007 "Liver disease"
* $SCT#363346000 "Malignancy"
* $SCT#709044004 "Renal disease"
* $SCT#56717001 "TB"
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
* $ICD#XM4YL8 "AstraZeneca/Oxford vaccine"
* $ICD#XM6QV1 "Johnson and Johnson"
* $ICD#XM3DT5 "Moderna"
* $ICD#XM8NQ0 "Pfizer/BionTech"
* $ICD#XM8866 "Sinopharm"
* $ICD#XM7HT3 "Sinovac"
* $ICD#XM1G90 "COVAXIN"
* $ICD#XM9T65  "Covovax"
* $ICD#XM5JC5 "Nuvaxovid"
* $ICD#XM1AG7 "CanSino"

ValueSet: VSPatientOutcome
Id: vs-patient-outcome
Title: "Patient Outcome"
Description: "A list of Patient Outcomes"
* $SCT#370996005 "Recovered (Symptoms resolved)"
* $SCT#419099009 "Died"
* $SCT#1119303003 "Long COVID /Post-COVID"

ValueSet: VSTestTypes
Id: vs-test-types
Title: "Test Types"
Description: "A list of Test Types"
* $LNC#94558-4 "SARS-CoV-2 (COVID-19) Ag [Presence] in Respiratory specimen by Rapid immunoassay"   
* $LNC#94745-7 "SARS-CoV-2 (COVID-19) RNA [Cycle Threshold #] in Respiratory specimen by NAA with probe detection"

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
Title: "Cancellation Reasons"
Description: "A list of Cancellation Reasons"
* $SCT#281264009 "Improperly ordered" //need to double check the code from with CDC
* $SCT#281266006 "No sample collected"
* $SCT#135839007  "Sample rejected"

ValueSet: VSCovid19SpecimenType
Id: vs-covid19-specimen-type
Title: "Covid19 Specimen Type"
Description: "A list of Covid19 Specimen Type"
* $SCT#258500001 "Nasopharyngeal"
* $SCT#461911000124106 "Oropharyngeal swab" //TODO: replaced with the correct code. MDS uses the wrong one: 461911000000000
* $SCT#119324002 "unknown"
* include codes from system CSOther

ValueSet: VSReasonTestNotPerformed
Id: vs-covid19-reason-test-not-performed
Title: "Covid19 Specimen Type"
Description: "A list of Covid19 Specimen Type"
* $SCT#441510007 "Blood sample coagulated" //TODO: CDC to clarify
* $SCT#123840003 "Contaminated specimen"
* $SCT#397933008 "Equipment failure"
* $SCT#281264009 "Inappropriate sample container used"
* $SCT#281268007 "Insufficient sample"
* $SCT#281265005 "Specimen not labeled"
* $SCT#419182006 "Supplies not available"
* include codes from system CSOther

ValueSet: VSTestResult
Id: vs-covid19-test-result
Title: "Covid19 Test Result"
Description: "Covid19 Test Result"
* $SCT#10828004 "Positive"
* $SCT#260385009 "Negative"
* $SCT#419984006 "Inconclusive"

ValueSet: VSLabOrderStatus
Id: vs-covid19-lab-order-status
Title: "Covid19 Lab Order Status"
Description: "Covid19 Lab Order Status"
* $SCT#255594003 "Pending" //no code provided in the google sheet. added a duplication of complete code
* $SCT#255594003 "Complete"
* $SCT#89925002 "Cancelled"
* $SCT#385660001 "Not done"

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