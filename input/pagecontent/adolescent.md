### Introduction

IN scope for this use case:
1. Reproductive health data
       Note: Once a patient becomes pregnant, they are a mature minor in many states  so separating pregnancy/TAB data from other adolescent reproductive health data (e.g. STI treatment)
2. Gender identity, sexual orientation
3. Including immigration because of the way the use case shaped up (intra-state, and urgency of issue
Data shared with: portal proxy (guardian), recipient EHR, ancillary services, payer; expanding to:
   -Portal proxy (guardian)
   -Recipient EHR across state lines
   -HIE for care management
   -HIE (de-identified) for metric analysis
   -3rd party mobile app (non-HIPAA C/E)
   -Ancillary services (outside lab, pharmacy)
   -Payer

OUT of scope:
Questions of patient capacity
Unstructured data, including note
Discussions of safety, appropriateness of sharing (deferred to Delphi, Implementation)

### Data Granularity Constraints

Data granularity constraints - needs further vetting by Terminology workstream and Advisory Groups

Reproductive Health (high level), must include:
    STI data, must include:
              -HIV testing & treatment data, requires separate consent in some states
     OB Hx, intrapartum and postpartum care must include:
               -Therapeautic abortion hx (including in GTPALs that may indicate this, other) - separate concern for criminalization
      Contraception
      Fertility
      Reproductive health screenings and pathology (e.g. Pap smears, dysmenorrhea, may include mammography, prostate cancer, ED); some overlap with STI
      Genetic screening of mom and baby - special protections in some states

Sex/Gender (high level):
     Legal sex - this is required by law/billing, and may need to be dealt with separately
     Recorded gender or sex (gender harmony)
     Sex assigned at birth -> sex for clinical use)
     Sex for clinical use
     Gender identity

Identification:
     Name to use/preferred name
     Pronouns
     
Sexual orientation
Partners

### Story

                        
"19 y/o Wanda Maximoff: born in Slovakia, came to US (Boston, MA) at age 2.  Currently at school at MouseHouse U in Orlando.  Established FL residence with father/wife for in-state tuition, and is on her father's employer-sponsored health insurance (It's not Easy Being Green, Inc. or ""Green"") under the ACA.  Wanda receives her healthcare at a number of different entities: her school health center, a private PCP in FL, and MA Community Health Center when she is with her mother in MA.  Wanda's medical history is notable for chronc constipation, for which she takes Miralax, and an allergy to amoxicillin (hives).  Wanda became sexually active with M partners at age 15.  OB Hx: G2P0002.  She had a D&C abortion at 18 weeks gestation at age 18 in MA and a medical abortion at 9 weeks gestation in MA (mifepristone + misoprostol) earlier this year at age 19, after which she started Depo Provera, which are continued at her university health service.  With her first pregnancy, she wasn't sure if she wanted to keep the baby, so she had a normal 1st trimester ultrasound at 10 weeks and a normal quad screen at 14 weeks, before deciding on termination when her boyfriend broke up with her.  Wanda does not want either parent to know about her abortions or Depo.  All reproductive care took place in MA.  She does not want healthcare providers in FL to know about the abortions in MA due to concern for criminalization.  Wanda paid for the first abortion out of pocket but feared that bill was submitted to the payer anyway due to an administrative error; the second (medical) abortion was part of a more comprehensive medical visit that was billed to her father's insurance; she requests that information about the abortion not be shared with the payer.  She has no portal proxies set up.

<div>
<img src="Picture1.png" caption="Wanda and Petra">
</div>

When Wanda starts Depo, she begins having spotting and irregular bleeding.  In order to better track her symptoms, she downloads a period tracker app.  This app asks to receive data, including her OB history and current medications, from her medical record.  She does not wish to share her OB History or Depo with the app due to privacy concerns.  She does want it to receive her LMP from her medical record, and is okay with it receiving information about her other medications and allergies.

The state of FL asks about a patient's immigration status; the state of MA does not have these questions in its EHR.  As Wanda has been seeing the PCP in FL occasionally since age 11, that PCP has her listed as ""Not Lawfully Present in the US"".  When her school health center asks, she selects ""Decline to answer.""   These questions are reported to the state of FL under law.  Although Wanda wishes to opt out of this reporting, she is told the best she can do is decline to answer."						
                        
                        
"16 y/o Pietro ""Petra"" Maximoff, born in Boston, MA.  Petra gets her healthcare at MA Community Health Center and is on her mother's insurance (Mellow Yellow, ""Yellow"").  Both of Petra's parents have access to her MA health provider online portal, though access is limited by vendor-specific controls for adolescents.  Petra is generally healthy except for moderate persistent asthma for which she uses an Pulmicort Flexhaler 180mcg 2 puffs BID and albuterol PRN.  Petra began questioning her gender identity (sex assigned at birth = M) at age 12.  She disclosed this to her physician, her sister, and her mother, but does not want her father or his wife to know.  She is attracted to both males and females, though is only sexually active with multiple male partners, only sometimes using condoms; she wants to keep this information private from both her mother and her father.  She has gone on PrEP and also does not want her mother or father to know about this.  Petra occasionally needs urgent care for her asthma when she is FL, for which she sees her father's private PCP, but is hesitant to tell this doctor about her PrEP or other SOGI history because their Portal gives full access to her mother, father, and stepmother.  Yesterday, she presented to the health system in MA where she is tested for gonorrhea, chlamydia, and HIV; testing is sent to a 3rd party lab.  Gonorrhea and HIV are negative.  MA has a state law requiring additional consent related to HIV (which some entities interpret as any HIV testing and some entities interpret as positive HIV results only).  Chlamydia came back positive today; Azithromycin for the patient as well as Expedited Partner Therapy are sent to pharmacy.  

Chlaymida is a reportable disease in MA and a public health worker follows up with all patients to make sure they have taken their antibiotics and that EPT has been completed.  Petra wishes to not share her data with the public health department but is told this is not optional.  Petra states that she at least wants DPH to only be given the minimum necessary information and to not have any information about her gender identity, in case they speak with her parents.

In MA, an ACO care manager typically follows patients on PrEP to check in on their treatment.  Petra wishes to opt out of this due to concerns her parents may discover she is on PrEP.  Additionally, the state collects deidentified data on transgender patients to report to a Health Equity task force.  Petra wishes to opt out of this as well due to concerns about reidentification.  The clinic staff advises her that this could impact the Commonwealth's ability to provide equitable care to transgender patients such as herself, but she is adament that she does not want to share this data, even in a deidentified manner.

As for immigration status, the FL PCP has Petra listed as ""U.S. Citizen or Lawfully Present in the U.S.""  The MA Health System does not have a field in its EHR for these questions."						
                        
                        
Background: Family moved from Slovakia to Boston, MA when Wanda was 2.  Petra was born in US a year later.  Both parents have greencards but are not naturalized.  Parents divorced when Wanda was 9 and Petra was 6 years old.  Mother (Natalya) stayed in Boston, Father (Django) moved to Orlando, FL.  Mom had primary custody.  Father got remarried an Orlando, FL.  Wife (Marya) is American, but did not adopt fathers' children, and Wanda never became naturalized.  Petra spends some holidays with father and his wife in Orlando.  Wanda is in school in Orlando, but spends most school vacations back in MA. 						

### Details

#### Wanda

                                
"19 y/o Wanda Maximoff: born in Slovakia, came to US (Boston, MA) at age 2.  Currently at school at MouseHouse U in Orlando.  Established FL residence with father/wife for in-state tuition, and is on her father's employer-sponsored health insurance (It's not Easy Being Green, Inc. or ""Green"") under the ACA.  Wanda receives her healthcare at a number of different entities: her school health center, a private PCP in FL, and MA Community Health Center when she is with her mother in MA.  Wanda's medical history is notable for chronc constipation, for which she takes Miralax, and an allergy to amoxicillin (hives).  Wanda became sexually active with M partners at age 15.  OB Hx: G2P0002.  She had a D&C abortion at 18 weeks gestation at age 18 in MA and a medical abortion at 9 weeks gestation in MA (mifepristone + misoprostol) earlier this year at age 19, after which she started Depo Provera, which are continued at her university health service.  With her first pregnancy, she wasn't sure if she wanted to keep the baby, so she had a normal 1st trimester ultrasound at 10 weeks and a normal quad screen at 14 weeks, before deciding on termination when her boyfriend broke up with her.  Wanda does not want either parent to know about her abortions or Depo.  All reproductive care took place in MA.  She does not want healthcare providers in FL to know about the abortions in MA due to concern for criminalization.  Wanda paid for the first abortion out of pocket but feared that bill was submitted to the payer anyway due to an administrative error; the second (medical) abortion was part of a more comprehensive medical visit that was billed to her father's insurance; she requests that information about the abortion not be shared with the payer.  She has no portal proxies set up.

When Wanda starts Depo, she begins having spotting and irregular bleeding.  In order to better track her symptoms, she downloads a period tracker app.  This app asks to receive data, including her OB history and current medications, from her medical record.  She does not wish to share her OB History or Depo with the app due to privacy concerns.  She does want it to receive her LMP from her medical record, and is okay with it receiving information about her other medications and allergies.

The state of FL asks about a patient's immigration status; the state of MA does not have these questions in its EHR.  As Wanda has been seeing the PCP in FL occasionally since age 11, that PCP has her listed as ""Not Lawfully Present in the US"".  When her school health center asks, she selects ""Decline to answer.""   These questions are reported to the state of FL under law.  Although Wanda wishes to opt out of this reporting, she is told the best she can do is decline to answer."								
                                
Background: Family moved from Slovakia to Boston, MA when Wanda was 2.  Petra was born in US a year later.  Both parents have greencards but are not naturalized.  Parents divorced when Wanda was 9 and Petra was 6 years old.  Mother (Natalya) stayed in Boston, Father (Django) moved to Orlando, FL.  Mom had primary custody.  Father got remarried an Orlando, FL.  Wife (Marya) is American, but did not adopt fathers' children, and Wanda never became naturalized.  Petra spends some holidays with father and his wife in Orlando.  Wanda is in school in Orlando, but spends most school vacations back in MA. 								
                                
TODO: The tables didn't convert to markdown tables automatically

#### Petra

                                            
"16 y/o Pietro ""Petra"" Maximoff, born in Boston, MA.  Petra gets her healthcare at MA Community Health Center and is on her mother's insurance (Mellow Yellow, ""Yellow"").  Both of Petra's parents have access to her MA health provider online portal, though access is limited by vendor-specific controls for adolescents.  Petra is generally healthy except for moderate persistent asthma for which she uses an Pulmicort Flexhaler 180mcg 2 puffs BID and albuterol PRN.  Petra began questioning her gender identity (sex assigned at birth = M) at age 12.  She disclosed this to her physician, her sister, and her mother, but does not want her father or his wife to know.  She is attracted to both males and females, though is only sexually active with multiple male partners, only sometimes using condoms; she wants to keep this information private from both her mother and her father.  She has gone on PrEP and also does not want her mother or father to know about this.  Petra occasionally needs urgent care for her asthma when she is FL, for which she sees her father's private PCP, but is hesitant to tell this doctor about her PrEP or other SOGI history because their Portal gives full access to her mother, father, and stepmother.  Yesterday, she presented to the health system in MA where she is tested for gonorrhea, chlamydia, and HIV; testing is sent to a 3rd party lab.  Gonorrhea and HIV are negative.  MA has a state law requiring additional consent related to HIV (which some entities interpret as any HIV testing and some entities interpret as positive HIV results only).  Chlamydia came back positive today; Azithromycin for the patient as well as Expedited Partner Therapy are sent to pharmacy.  

Chlaymida is a reportable disease in MA and a public health worker follows up with all patients to make sure they have taken their antibiotics and that EPT has been completed.  Petra wishes to not share her data with the public health department but is told this is not optional.  Petra states that she at least wants DPH to only be given the minimum necessary information and to not have any information about her gender identity, in case they speak with her parents.

In MA, an ACO care manager typically follows patients on PrEP to check in on their treatment.  Petra wishes to opt out of this due to concerns her parents may discover she is on PrEP.  Additionally, the state collects deidentified data on transgender patients to report to a Health Equity task force.  Petra wishes to opt out of this as well due to concerns about reidentification.  The clinic staff advises her that this could impact the Commonwealth's ability to provide equitable care to transgender patients such as herself, but she is adament that she does not want to share this data, even in a deidentified manner.

As for immigration status, the FL PCP has Petra listed as ""U.S. Citizen or Lawfully Present in the U.S.""  The MA Health System does not have a field in its EHR for these questions."											
                                            
Background: Family moved from Slovakia to Boston, MA when Wanda was 2.  Petra was born in US a year later.  Both parents have greencards but are not naturalized.  Parents divorced when Wanda was 9 and Petra was 6 years old.  Mother (Natalya) stayed in Boston, Father (Django) moved to Orlando, FL.  Mom had primary custody.  Father got remarried an Orlando, FL.  Wife (Marya) is American, but did not adopt fathers' children, and Wanda never became naturalized.  Petra spends some holidays with father and his wife in Orlando.  Wanda is in school in Orlando, but spends most school vacations back in MA. 											
                                            
TODO: The tables didn't convert to markdown tables automatically

