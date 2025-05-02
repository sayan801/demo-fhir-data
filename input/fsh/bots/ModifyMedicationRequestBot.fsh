Instance: ModifyMedicationRequestBot
InstanceOf: Bot
Usage: #example
Title: "Modify MedicationRequest Bot"
Description: "A Medplum Bot that modifies MedicationRequest payloads for Subscriptions by replacing medicationReference with the full Medication resource."

* identifier[0].system = "http://example.org/fhir/bot-identifier"
* identifier[0].value = "BOT-MRX-MODIFIER-001"
* name = "ModifyMedicationRequestBot"
* description = "Bot to modify MedicationRequest payload for Subscriptions"
* runtimeVersion = #vmcontext
* auditEventTrigger = #always
* auditEventDestination[0] = #resource
* sourceCode.id = "ModifyMedicationRequestBot"
* sourceCode.contentType = #text/typescript
* runAsUser = true