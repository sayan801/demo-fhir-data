// @ts-nocheck
import { BotEvent, MedplumClient } from "@medplum/core";

export async function handler(
  medplum: MedplumClient,
  event: BotEvent
): Promise<void> {
  const medicationRequest = event.input;
  if (medicationRequest.resourceType !== "MedicationRequest") {
    throw new Error("Expected MedicationRequest");
  }
  const medicationReference = medicationRequest.medicationReference?.reference;
  if (!medicationReference) {
    throw new Error("No medicationReference");
  }
  const medication = await medplum.readReference({
    reference: medicationReference,
  });
  const modifiedPayload = {
    ...medicationRequest,
    medicationReference: undefined,
    medication: medication,
  };
  await fetch("process.env.HEARTH_BATCH_URL/fhir-subscription", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(modifiedPayload),
  });
}
