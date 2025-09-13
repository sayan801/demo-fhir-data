Profile: SensitiveCareTeamProfile
Parent: CareTeam
Id: sensitive-care-team-profile
Title: "Sensitive Care Team Profile"
Description: """
A profile for care teams that are managing sensitive conditions, with specific constraints on team categories and roles.

JFM: 20250913: Note that this profile is unclear what it is trying to do. Is the intent that if a CareTeam has ANY member that has a sensitive role, then the entire CareTeam is considered sensitive? Or is the intent to say that a CareTeam of sensitive content can not include anyone that is also not of a sensitive role? If so, that should be documented in the description. If this is the intent, then slices and/or invariants would be used. Given that the definition is not well defined, I have removed all constraints. We need a definition clarity in order to define a useful profile.
"""
* ^status = #active
//* category from sensitive-care-team-codes (required)
//* reasonCode from sensitive-care-team-codes (required)
//* participant.role from sensitive-care-team-codes (required)