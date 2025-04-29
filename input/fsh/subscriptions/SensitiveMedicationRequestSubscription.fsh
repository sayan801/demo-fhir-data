// Sensitive MedicationRequest Subscription
Instance: SensitiveMedicationRequestSubscription
InstanceOf: Subscription
Title: "Subscription - Sensitive Medication Request Updates"
Description: "Subscription for monitoring changes to medication request resources related to sensitive conditions"

* status = #active
* reason = "Monitor changes to medication requests related to sensitive conditions for privacy protection"
* criteria = "MedicationRequest"
* channel.type = #rest-hook
* channel.endpoint = "https://hearth-batch.fly.dev/fhir-subscription"
* channel.payload = #application/fhir+json

// Rest of subscription configuration will be added later