
### Introduction

IN scope for this use case:
1. Behavioral Health data
2. SUD data (42 CFR part 2 protected and non-42 CFR part 2 protected)
Data shared with: portal proxy, recipient EHR, HIE for care management + de-identified data for metrics, mobile app, payer
   -Portal proxy
   -Recipient EHR (with request to restrict disclosure approved by sending CE per HIPAA)
   -HIE for care management
   -HIE (de-identified) for metric analysis
   -3rd party mobile app (non-HIPAA C/E)
   -Payer

OUT of scope:
Questions of patient capacity
Non-structured data, including incarcertation, including note
Discussions of safety, appropriateness of sharing (deferred to Delphi, Implementation)

### Story

Story:					
"Carl Fredricksen is an older adult with hypertension (HTN), bunions, depression, and a history of opiate use disorder (OUD).
Carl gets most of his care at Shift Medical Center (SMC).
His SMC PCP, Dr. Hibbert, treats his hypertension.  SMC's Psychiatrist, Dr. Funke, provides him with medication for his moderate depressive disorder.  Carl is in therapy with a therapist at SMC, Lucy van Pelt, who agrees with the diagnosis of moderate depressive disorder, and has also diagnosed Carl with obsessive compulsive personality disorder.  Carl does not agree with the OCPD diagnosis.  Dr. Hibbert, Dr. Funke, and Lucy van Pelt, all document in their records that Carl has a history of OUD and that he is receiving treatment for this elsewhere.
Carl receives medicaton-assisted treatment for his OUD in the form of buprenorphine from Dr. White at SMC's 42-CFR Part II clinic. 
Carl has all his medications from SMC sent to his local pharmacy, Best Little Pharmacy (BLP).
SMC has a very long wait list for podiatry, so Carl was referred to Outside Health System (OHS) to see podiatrist Dr. Sasquatch for his bunions.  Dr. Sasquatch works with anesthesiologist Dr. Aurora for any bunionectomies.  Dr. Sasquatch works with an independent imaging facility, RADS, where images are read by radiologist Dr. Banner.
Carl's wife, Ellie is his proxy for both SMC's and OHS' EHR patient portals.
Carl has Medicare and also an individual Medicare supplemental insurance plan (Medigap) through It's Not Easy Being Green, Inc. (Green, Inc.)
SMC participates in a Medicare Shared Savings Program (MSSP) Accountable Care Organization (ACO), which provides care management services for chronic conditions like HTN, depression, and OUD.  Nurse Ann Perkins is the ACO care manager who manages Carl's care. The ACO also collects de-identified data on these conditions to report metrics to Medicare for value-based reimbursement.
Carl has a Mapple phone.  He uses the Mapple ""Wellness"" app to track symptoms related to his depression, OUD, and to track his blood pressures via a 3rd party BP cuff that connects via bluetooth.  He reports this data to Ann Perkins during their calls and also connects his Mapple ""Wellness"" app to SMC's patient portal to upload his PGHD."					
                    


<div>
<img src="Picture2.png" caption="Carl">
</div>

                    
He wishes to share his information with his providers/entities as follows:					

TODO: The table didn't convert to markdown table automatically
                    
*Where data may be accessed but tagged as sensitive, Carl would like actor to request additional consent before redisclosing to others, even though revised 42 CFR and other current laws may not require this.					
**Note: when referral was placed to Podiatry, Carl asked NOT to share BH, personality or SUD data under HIPAA Right to Request Restrictions on Disclosure, but did not separately consent to the sharing of 42 CFR Part II data.  SMC HIM reviewed this request with his SMC providers and approved the restriction request.  Referal to podiatry PUSHES SCR to OHS EHR, which also sends PULL query for data at point of care.  When Dr. Sasquatch first sees Carl, the OHS EHR indicates that some BH-related data (which may include personality disorder data) and SUD-related is present but tagged as sensitive and therefore hidden.  Dr. Sasquatch does not believe this impacts care, so proceeds to place the imaging order, which is to RADS.  Dr. Sasquatch tries to place an prescription for ibuprofen 800mg every 8 hours, and receives a drug-drug interaction decision support intervention letting him know that Carl is on a medication that has been hidden [fluoxetine] but could interact with ibuprofen to cause an increase in bleeding.  He decides not to place the ibuprofen based on this, but does not ask to see the hidden medication.  When surgery is decided upon, Carl sees Dr. Aurora.  She does believe she needs to see redacted data in order to safely anesthetize him.  She obtains consent from Carl to see BH and SUD data (but not specifically personality d/o data); once she submits this, the hidden BH and SUD data (but not personality d/o data) is unhidden from her.  Once this data is available to Dr. Aurora, it is reconciled into the chart but tagged as sensitive to indicate it should not be re-shared without additional consent.  Dr. Aurora does, however, include it her claim to the payer.					
