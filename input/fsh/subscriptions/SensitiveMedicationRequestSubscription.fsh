// Sensitive MedicationRequest Subscription
Instance: SensitiveMedicationRequestSubscription
InstanceOf: Subscription
Title: "Subscription - Sensitive Medication Request Updates"
Description: "Subscription for monitoring changes to medication request resources related to sensitive conditions"

* status = #active
* reason = "Monitor changes to medication requests related to sensitive conditions for privacy protection"
* criteria = "MedicationRequest"
* channel.type = #rest-hook
* channel.endpoint = "urn:uuid:ModifyMedicationRequestBot"
* channel.payload = #application/fhir+json
* channel.header[0] = "Authorization: Bearer process.env.FHIR_BACKEND_ACCESS_TOKEN"

// Rest of subscription configuration will be added later