// Sensitive Condition Subscription
Instance: SensitiveConditionSubscription
InstanceOf: Subscription
Title: "Subscription - Sensitive Condition Updates"
Description: "Subscription for monitoring changes to condition resources related to sensitive conditions"

* status = #active
* reason = "Monitor changes to sensitive conditions for privacy protection"
* criteria = "Condition"
* channel.type = #rest-hook
* channel.endpoint = "process.env.SUBSCRIPTION_ENDPOINT/fhir-subscription"
* channel.payload = #application/fhir+json

// Rest of subscription configuration will be added later