// Sensitive Observation Subscription
Instance: SensitiveObservationSubscription
InstanceOf: Subscription
Title: "Subscription - Sensitive Observation Updates"
Description: "Subscription for monitoring changes to observation resources related to sensitive conditions"

* status = #active
* reason = "Monitor changes to observations related to sensitive conditions for privacy protection"
* criteria = "Observation"
* channel.type = #rest-hook
* channel.endpoint = "process.env.HEARTH_BATCH_URL/fhir-subscription"
* channel.payload = #application/fhir+json

// Rest of subscription configuration will be added later