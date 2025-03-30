// OUD Thought Record (CBT tool)
Instance: CarlFredericksonOUDThoughtRecord
InstanceOf: Observation
Title: "Mapple CBT Tool - OUD Thought Record"
Description: "Cognitive Behavioral Therapy thought record for Opiate Use Disorder"
Usage: #example

* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#survey "Survey"
* category[1] = http://terminology.hl7.org/CodeSystem/observation-category#mental-health "Mental Health"
* code = http://snomed.info/sct#444175001 "Cognitive behavioral therapy intervention (procedure)"
* code.text = "Mapple CBT Tool - OUD self-help thought record"
* subject.reference = "Patient/CarlFrederickson"
* effectiveDateTime = "2023-08-05T14:45:00Z"
* performer.reference = "Patient/CarlFrederickson"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActCode#42CFRPart2 "42 CFR Part 2 restrictions apply"

// Use valueString to capture the thought record content
* valueString = "Situation: Felt strong urge to use when passing by old neighborhood. Automatic thought: 'I can't handle this stress without using.' Emotions: Anxiety (80%), hopelessness (70%). Alternative thought: 'I have managed stress before without using and have resources to help me now.' Outcome: Used deep breathing techniques, called sponsor, urge decreased to manageable level."

// Structured data for the thought record components
* component[0].code.text = "Situation"
* component[0].valueString = "Felt strong urge to use when passing by old neighborhood"

* component[1].code.text = "Automatic Thoughts"
* component[1].valueString = "I can't handle this stress without using"

* component[2].code.text = "Emotions"
* component[2].valueString = "Anxiety (80%), hopelessness (70%)"

* component[3].code.text = "Alternative Thoughts"
* component[3].valueString = "I have managed stress before without using and have resources to help me now"

* component[4].code.text = "Outcome"
* component[4].valueString = "Used deep breathing techniques, called sponsor, urge decreased to manageable level"

* note.text = "Patient completed this thought record as part of self-help CBT exercises. Discussed in follow-up session with counselor and identified additional coping strategies." 