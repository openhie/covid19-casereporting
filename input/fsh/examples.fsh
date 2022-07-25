Instance: Covid19PatientExample
InstanceOf: Covid19Patient
Usage: #example
Title: "Covid19 Patient example"
Description: "."

* active = true
* name.use = #official
* name.given = "Jane"
* name.family = "Smith"
//* maritalStatus.coding[0].code = #M
//* maritalStatus.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus"
* gender = #female
* birthDate = "1986-06-04"
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