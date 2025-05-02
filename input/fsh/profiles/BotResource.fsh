Resource: Bot
Parent: DomainResource
Id: Bot
Title: "Medplum Bot Resource"
Description: "Bot account for automated actions."

* ^url = "https://medplum.com/fhir/StructureDefinition/Bot"
* ^version = "4.0.1"
* ^status = #active
* ^publisher = "Medplum"
* ^purpose = "Defines a serverless function (Bot) for Medplum workflows."

* identifier 0..* Identifier "An identifier for this bot"
  * ^short = "An identifier for this bot"
* name 0..1 string "Name of the Bot"
  * ^short = "A name associated with the Bot"
* description 0..1 string "Description of the Bot"
  * ^short = "A summary, characterization or explanation of the Bot"
* runtimeVersion 0..1 code "Runtime Version"
  * ^short = "The identifier of the bot runtime environment (i.e., vmcontext, awslambda, etc)"
  * ^binding.strength = #required
  * ^binding.valueSet = "https://medplum.com/fhir/ValueSet/bot-runtime-version|4.0.1"
* timeout 0..1 integer "Timeout"
  * ^short = "The maximum allowed execution time of the bot in seconds"
* photo 0..1 Attachment "Photo"
  * ^short = "Image of the bot"
* cronTiming 0..1 Timing "Cron Schedule (Timing)"
  * ^short = "A schedule for the bot to be executed using Timing"
* cronString 0..1 string "Cron Schedule (String)"
  * ^short = "A schedule for the bot to be executed using cron syntax"
* category 0..* CodeableConcept "Category"
  * ^short = "Classification of service"
* system 0..1 boolean "System Bot"
  * ^short = "Optional flag to indicate that the bot is a system bot and therefore has access to system secrets"
* runAsUser 0..1 boolean "Run as User"
  * ^short = "Optional flag to indicate that the bot should be run as the user"
* auditEventTrigger 0..1 code "Audit Event Trigger"
  * ^short = "Criteria for creating an AuditEvent as a result of the bot invocation"
  * ^binding.strength = #required
  * ^binding.valueSet = "https://medplum.com/fhir/ValueSet/bot-audit-event-trigger|4.0.1"
* auditEventDestination 0..* code "Audit Event Destination"
  * ^short = "The destination system in which the AuditEvent is to be sent"
  * ^binding.strength = #required
  * ^binding.valueSet = "https://medplum.com/fhir/ValueSet/bot-audit-event-destination|4.0.1"
* sourceCode 0..1 Attachment "Source Code"
  * ^short = "Bot logic in original source code form written by developers"
* executableCode 0..1 Attachment "Executable Code"
  * ^short = "Bot logic in executable form as a result of compiling and bundling source code"
* code 0..1 string "Deprecated Code"
  * ^short = "@deprecated Bot logic script. Use Bot.sourceCode or Bot.executableCode instead"
* status 0..1 code "Status"
  * ^short = "Status of the bot (active, inactive, etc)"

ValueSet: BotRuntimeVersion
Id: bot-runtime-version
Title: "Bot Runtime Version"
Description: "Supported runtime versions for Bots."
* ^status = #active
* ^url = "https://medplum.com/fhir/ValueSet/bot-runtime-version|4.0.1"
* include codes from system https://medplum.com/fhir/CodeSystem/bot-runtime-version

ValueSet: BotAuditEventTrigger
Id: bot-audit-event-trigger
Title: "Bot Audit Event Trigger"
Description: "Criteria for creating an AuditEvent as a result of the bot invocation."
* ^status = #active
* ^url = "https://medplum.com/fhir/ValueSet/bot-audit-event-trigger|4.0.1"
* include codes from system https://medplum.com/fhir/CodeSystem/bot-audit-event-trigger

ValueSet: BotAuditEventDestination
Id: bot-audit-event-destination
Title: "Bot Audit Event Destination"
Description: "The destination system in which the AuditEvent is to be sent."
* ^status = #active
* ^url = "https://medplum.com/fhir/ValueSet/bot-audit-event-destination|4.0.1"
* include codes from system https://medplum.com/fhir/CodeSystem/bot-audit-event-destination

CodeSystem: BotRuntimeVersion
Id: bot-runtime-version-cs
Title: "Bot Runtime Version Code System"
Description: "Supported runtime versions for Bots."
* ^status = #active
* ^url = "https://medplum.com/fhir/CodeSystem/bot-runtime-version"
* #vmcontext "VM Context" "Bot execution in VM Context"
* #awslambda "AWS Lambda" "Bot execution in AWS Lambda"
* #node16 "Node.js 16" "Bot execution in Node.js 16"
* #node18 "Node.js 18" "Bot execution in Node.js 18"

CodeSystem: BotAuditEventTrigger
Id: bot-audit-event-trigger-cs
Title: "Bot Audit Event Trigger Code System"
Description: "Criteria for creating an AuditEvent as a result of the bot invocation."
* ^status = #active
* ^url = "https://medplum.com/fhir/CodeSystem/bot-audit-event-trigger"
* #always "Always" "Always create an audit event"
* #never "Never" "Never create an audit event"
* #on-error "On Error" "Create an audit event only on error"
* #on-output "On Output" "Create an audit event only when there's output"

CodeSystem: BotAuditEventDestination
Id: bot-audit-event-destination-cs
Title: "Bot Audit Event Destination Code System"
Description: "The destination system in which the AuditEvent is to be sent."
* ^status = #active
* ^url = "https://medplum.com/fhir/CodeSystem/bot-audit-event-destination"
* #log "Log" "Send audit event to logs"
* #resource "Resource" "Store audit event as a resource"