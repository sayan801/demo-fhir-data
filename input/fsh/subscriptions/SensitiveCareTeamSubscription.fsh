// Sensitive CareTeam Subscription
Instance: SensitiveCareTeamSubscription
InstanceOf: Subscription
Title: "Subscription - Sensitive CareTeam Updates"
Description: "Subscription for monitoring changes to care team resources treating sensitive conditions"

* status = #active
* reason = "Monitor changes to care teams handling sensitive conditions for privacy protection"
* criteria = "CareTeam"
* channel.type = #rest-hook
* channel.endpoint = "process.env.SUBSCRIPTION_ENDPOINT/fhir-subscription"
* channel.payload = #application/fhir+json

// Rest of subscription configuration will be added later