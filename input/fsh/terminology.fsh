Alias: $SCT = http://snomed.info/sct
Alias: $LNC = http://loinc.org
Alias: $LNC-LL3044-6 = https://loinc.org/LL3044-6   //yes no unkw
//Alias: $LNC-75618-9 = https://loinc.org/75618-9/


CodeSystem: CSCaseReportSections
Id: cs-case-report-sections
Title: "Covid19 Case Report Sections codesystem"
Description: ""
* #CLIENT-REGISTRATION
* #COVID-ASSESSMENT
* #LABORDER-MANAGEMENT
* #COVID-VACCINATION

CodeSystem: CSAssessmentReason
Id: cs-assessment-reason
Title: "Assessment Reason codes"
Description: "A list of assessment reasons"
* #CaseContact  "Contact of a case"
* #Entry "Entry into a country"
* #FO "Follow-up"
* #HW "Health worker"
* #OtherFrontlineWorker "Other frontline worker"
* #Post "Post-mortem"
* #Quarantine "Quarantine"
* #RDT "RDT confirmatory"
* #Surveillance "Surveillance"
* #Symptomatic "Symptomatic/Illness"
* #Travel "Travel out of country"
* #Voluntary "Voluntary"
* #Other "Other (specify)"

ValueSet: VSAssessmentReason
Id: vs-assessment-reason
Title: "Assessment Reason valueset"
Description:  "Valueset - assessment reaason"
* include codes from system CSAssessmentReason

CodeSystem: CSPresentation
Id: cs-presentation
Title: "Assessment Reason codes"
Description: "A list of assessment reasons"
* #Asymptomatic  "Asymptomatic"
* #Symptomatic "Symptomatic"

ValueSet: VSPresentation
Id: vs-presentation
Title: "Presentation valueset"
Description:  "Valueset - presentation"
* include codes from system CSPresentation

CodeSystem: CSSymptoms
Id: cs-symptoms
Title: "Presenting symptoms"
Description: "A list of symptoms"
* #AbdominalPain "Abdominal Pain"
* #Chestpain "Chest pain"
* #Cough "Cough"  
* #Diarrhoea "Diarrhoea"
* #DisturbanceOfConsciousness "Disturbance of Consciousness"
* #GeneralWeakness "General Weakness"
* #Headache "Headache"
* #HistoryOfFeverOrChills "History Of Fever Or Chills"
* #IrritabilityConfusion "Irritability / Confusion" 
* #JointPain "Joint Pain"
* #LossOfSmell "Loss of smell"
* #LossOfTaste "Loss of Taste"
* #MuscularPain "Muscular pain"
* #Nausea/vomiting "Nausea/vomiting"
* #Redeyes "Red eyes (Conjunctival hyperemia)"
* #RunnyNose "Runny nose" 
* #ShortnessOfBreath "Shortness of breath (Acute respiratory distress)"
* #Sneezing "Sneezing"
* #SoreThroat "Sore Throat"
* #Tiredness "Tiredness"
* #Other "Other (specify)"

ValueSet: VSSymptoms
Id: vs-symptoms
Title: "Presenting symptoms"
Description:  "A list of symptoms"
* include codes from system CSSymptoms

CodeSystem: CSAdmissionTypes
Id: cs-admission-types
Title: "Admission Types"
Description: "A list of Admission Types"
* #Ward "Ward"
* #HDU "HDU"
* #ICU "ICU"

ValueSet: VSAdmissionTypes
Id: vs-AdmissionTypes
Title: "Admission Types"
Description: "A list of Admission Types"
* include codes from system CSAdmissionTypes

ValueSet: VSYesNoUnknown
Id: vs-yes-no
Title: "Yes No Unknown"
Description:  "Yes No Unknown"
* include codes from system $LNC-LL3044-6

CodeSystem: CSConditionsComorbidity
Id: cs-conditions-comorbidity
Title: "Conditions or comorbidity"
Description: "Conditions or comorbidity"
* #CardiovascularDisease  "Cardiovascular disease e.g heart failure"
* #ChronicLungDisease "Chronic Lung Disease"
* #ChronicNeurological "Chronic neurological or neuromuscular disease"
* #Smoker" "Current smoker"
* #Diabetes "Diabetes"
* #FormerSmoker" "Former smoker"
* #HIVAids" "HIV /AIDS"
* #Hypertension" "Hypertension" 
* #Immunodeficiency "Immunodeficiency"
* #Liver "Liver disease"
* #Malignancy "Malignancy"
* #Renal "Renal disease"
* #TB "TB" 
* #Other "Other (specify)"

ValueSet: VSConditionsComorbidity
Id: vs-conditions-comorbidity
Title: "List of Conditions / Comorbidity"
Description:  "List of Conditions / Comorbidity"
* include codes from system CSConditionsComorbidity

CodeSystem: CSVaccineTypes
Id: cs-vaccine-types
Title: "Vaccine Types"
Description: "A list of Vaccine Types"
* #AstraZenecaOxford "AstraZeneca/Oxford vaccine"
* #J&J "Johnson and Johnson"
* #Moderna "Moderna"
* #PfizerBionTech "Pfizer/BionTech"
* #Sinopharm "Sinopharm"
* #Sinovac "Sinovac"
* #COVAXIN "COVAXIN"
* #Covovax "Covovax"
* #Nuvaxovid "Nuvaxovid"
* #CanSino "Nuvaxovid"

ValueSet: VSVaccineTypes
Id: vs-vaccine-types
Title: "Vaccine Types"
Description: "A list of Vaccine Types"
* include codes from system CSVaccineTypes

CodeSystem: CSPatientOutcome
Id: cs-patient-outcome
Title: "Patient Outcomes"
Description: "A list of Patient Outcomes"
* #Recovered "Recovered (Symptoms resolved)"
* #Died "died"
* #LongCOVID "Long COVID /Post-COVID"  

ValueSet: VSPatientOutcome
Id: vs-patient-outcome
Title: "Patient Outcome"
Description: "A list of Patient Outcomes"
* include codes from system CSPatientOutcome

CodeSystem: CSTestTypes
Id: cs-test-requested
Title: "Test Types"
Description: "A list of Test Types"
* #Rapid "Rapid Antigen Test"
* #PCR "Diagnostic PCR Test"

ValueSet: VSTestTypes
Id: vs-test-types
Title: "Test Types"
Description: "A list of Test Types"
* include codes from system CSTestTypes

CodeSystem: CSCancellationReason
Id: cs-cancellation-reason
Title: "Cancellation Reasons"
Description: "A list of Cancellation Reasons"
* #Duplicate "duplicate orders"
* #PCR "Improperly ordered"
* #VOID "No longer required"
* #NoSample "No sample collected"
* #Old "Old order, Wrong entry"

ValueSet: VSCancellationReason
Id: vs-cancellation-reason
Title: "Test Types"
Description: "A list of Cancellation Reasons"
* include codes from system CSCancellationReason

CodeSystem: CSCovid19SpecimenType
Id: cs-covid19-specimen-type
Title: "Covid19 Specimen Type"
Description: "A list of Covid19 Specimen Type"
* #Nasopharyngeal "Nasopharyngeal" 
* #OropharyngealSwab "Oropharyngeal swab" 
* #Serum "Serum"
* #Sputum "Sputum"
* #TrachealAspirate "Tracheal Aspirate"
* #Unknown "Unknown"
* #Other "Other (specify)"

ValueSet: VSCovid19SpecimenType
Id: vs-covid19-specimen-type
Title: "Covid19 Specimen Type"
Description: "A list of Covid19 Specimen Type"
* include codes from system CSCovid19SpecimenType

CodeSystem: CSReasonTestNotPerformed
Id: cs-covid19-reason-test-not-performed
Title: "Covid19 Reason Test not performed"
Description: "Covid19 Reason Test not performed"
* #BloodSampleCoagulated "Blood sample coagulated" 
* #ContaminsatedSpecimen "Contaminated specimen" 
* #EquipmentFailure "Equipment failure"
* #InappropriateSampleContainer "Inappropriate sample container used"
* #InsufficientSample "Insufficient sample"
* #SpecimenNotlabeled "Specimen not labeled"
* #SuppliesNotAvailable "Supplies not available"
* #Other "Other"

ValueSet: VSReasonTestNotPerformed
Id: vs-covid19-reason-test-not-performed
Title: "Covid19 Specimen Type"
Description: "A list of Covid19 Specimen Type"
* include codes from system CSCovid19SpecimenType

CodeSystem: CSCovid19VaccineCodes
Id: cs-covid19-vaccine-codes
Title: "Covid19 Vaccine Code List"
Description: "Covid19 Vaccine Code List"
* #Astrazeneca "Astrazeneca COVID-19 vaccine"
* #BharatBiotech  "Bharat Biotech Covaxin COVID-19 vaccine" 
* #CansinoBiologics "Cansino Biologics Convidicea COVID-19 vaccine"
* #Chumakov "Chumakov Center Covivac COVID-19 vaccine" 
* #convalescent "COVID-19 convalescent plasma"
* #CureVacCVnCoV "CureVac CVnCoV COVID-19 vaccine" 
* #GamaleyaSputnik "Gamaleya Sputnik v COVID-19 vaccine"
* #Janssen "Janssen COVID-19 vaccine" 
* #Moderna "Moderna COVID-19 vaccine" 
* #Novavax "Novavax NVX-COV2373 COVID-19 vaccine" 
* #Pfizer-BioNtech "Pfizer-BioNtech COVID-19 vaccine"
* #SinopharmBBIBP-CorV "Sinopharm BBIBP-CorV COVID-19 vaccine"
* #Sinopharm-Wuhan  "Sinopharm-Wuhan COVID-19 vaccine"
* #Sinovac "Sinovac COVID-19 vaccine"
* #VectorInstituteEpivacCorona "Vector Institute EpivacCorona COVID-19 vaccine"

ValueSet: VSCovid19VaccineCodes
Id: vs-covid19-vaccine-codes
Title: "Covid19 Vaccine Code List"
Description: "Covid19 Vaccine Code List"
* include codes from system CSCovid19VaccineCodes

CodeSystem: CSDoseNumber
Id: cs-covid19-dose-number
Title: "Covid19 Vaccination Dose Number"
Description: "Covid19 Vaccination Dose Number"
* #first "First" 
* #second "Second" 
* #booster "booster" 

ValueSet: VSDoseNumber
Id: vs-covid19-dose-number
Title: "Covid19 Vaccination Dose Number"
Description: "Covid19 Vaccination Dose Number"
* include codes from system CSDoseNumber

CodeSystem: CSTestResult
Id: cs-covid19-test-result
Title: "Covid19 Test Result"
Description: "Covid19 Test Result"
* #Positive "Positive" 
* #Negative "Negative" 
* #inconclusive "Inconclusive" 

ValueSet: VSTestResult
Id: vs-covid19-test-result
Title: "Covid19 Test Result"
Description: "Covid19 Test Result"
* include codes from system CSTestResult

CodeSystem: CSLabOrderStatus
Id: cs-covid19-lab-order-status
Title: "Covid19 Lab Order Status"
Description: "Covid19 Test Result"
* #Pending "Pending" 
* #Complete "Complete" 
* #Cancelled "Cancelled" 
* #NotDone "not done" 

ValueSet: VSLabOrderStatus
Id: vs-covid19-lab-order-status
Title: "Covid19 Lab Order Status"
Description: "Covid19 Test Result"
* include codes from system  CSLabOrderStatus
