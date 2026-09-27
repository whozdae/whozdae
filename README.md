# Alex Adewoyin

**Security Engineer · Identity & Access Management**<br>
Microsoft Entra ID · Azure RBAC · Okta · Identity Governance

I build identity controls in Entra ID, Azure, and Okta with PowerShell and Microsoft Graph, then prove they work with evidence: audit logs, before/after state diffs, and decoded tokens, not screenshots of settings. Day to day at Log(N) Pacific I work vulnerability management and SecOps: Tenable scanning, PowerShell remediation, and DISA STIG hardening.

**Certifications:** CompTIA Security+ · Google Cybersecurity Certificate<br>
**In progress:** Microsoft SC-200, then SC-300 · TryHackMe SAL1 · B.S. Cybersecurity & Information Assurance (WGU)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-alexadewoyin-0A66C2?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alexadewoyin/)
[![TryHackMe](https://img.shields.io/badge/TryHackMe-whozdae-C11111?logo=tryhackme&logoColor=white)](https://tryhackme.com/p/whozdae)

---

## Featured IAM Projects

### [Automated Joiner-Mover-Leaver Lifecycle in Entra ID](https://github.com/whozdae/Identity-lifecycle-walkthrough-JML-)
I automated the three moments where access is created, changed, and revoked, triggered by HR attributes instead of tickets.
- **Leaver run:** a departing vendor went from 3 group memberships to 0, the account was disabled, and refresh tokens were revoked. The audit log attributes every change to Lifecycle Workflows, not to an admin.
- Resolved task IDs from the tenant's live Graph catalog instead of hardcoding GUIDs, so a bad task fails at deploy time instead of mid-run.
- Built a snapshot-and-diff tool so every run is proven with before/after access state.

`Entra ID Governance` `Lifecycle Workflows` `Microsoft Graph` `PowerShell 7` `NIST 800-53 AC-2`

### [Automated Vendor Access Recertification in Entra ID](https://github.com/whozdae/entra-identity-governance-access-reviews)
I built a fail-closed access review that removes vendor access nobody is reviewing, plus a governed path for requesting it back.
- **Result:** 2 of 2 dormant vendor accounts were denied and removed from a sensitive group by the Access Reviews service, with no administrator action at removal time.
- Set the review to default Deny with auto-apply, so a reviewer who never responds removes access instead of keeping it.
- Built an access package with two-stage approval, approver justification, and 90-day expiry, all scripted against Microsoft Graph with `-WhatIf`, idempotent reruns, and a rollback script.

`Entra ID Governance` `Access Reviews` `Entitlement Management` `Microsoft Graph` `PowerShell` `NIST 800-53 AC-2`

### [Entra ID → Okta SAML Federation with Layered MFA](https://github.com/whozdae/entra-okta-saml-federation)
I federated Entra ID (identity provider) into Okta (service provider) over SAML 2.0, with MFA enforced on both sides.
- Debugged 7 distinct failures across both directories (AADSTS errors, NameID format, JIT provisioning vs. account linking) by cross-checking both sign-in logs against the decoded assertion.
- Showed from decoded assertions that the ACR and AMR claims disagree about MFA, and that neither proves MFA happened for *this* sign-in.
- Wrote a PowerShell assertion decoder that reads both claims, flags when they disagree, and redacts identifiers for evidence.

`Entra ID` `Okta` `SAML 2.0` `SSO` `MFA` `Microsoft Graph PowerShell`

### [Azure Least-Privilege RBAC + PIM Remediation](https://github.com/whozdae/AZURE-IAM)
I replaced broad built-in roles with two narrowly scoped custom roles, then removed the standing Owner access my own audit found.
- Proved enforcement with 4 tests run as non-admin users: 2 allowed, 2 denied with `AuthorizationFailed`.
- Converted a standing subscription Owner to PIM-eligible access (4-hour activations, MFA and justification required), kept a break-glass account, and reran the audit to confirm the standing grant was gone.
- Wrote a KQL detection for new role assignments, a common privilege escalation path (MITRE T1098.003).

`Azure RBAC` `PIM` `Custom Roles` `PowerShell (Az)` `KQL` `NIST 800-53 AC-6`

---

## Skills

| Area | Tools and techniques |
| :--- | :--- |
| **Identity & Access Management** | Microsoft Entra ID, Lifecycle Workflows (JML), access reviews, entitlement management, Privileged Identity Management, Azure RBAC and custom roles, SAML 2.0 SSO, MFA, Okta |
| **Automation** | PowerShell 7, Microsoft Graph PowerShell SDK and REST API, Az module |
| **Security Operations** | Microsoft Sentinel, Microsoft Defender for Endpoint, KQL, MITRE ATT&CK |
| **Vulnerability Management** | Tenable/Nessus, DISA STIG hardening, PowerShell remediation |
| **Frameworks** | NIST SP 800-53 (AC-2, AC-6), MITRE ATT&CK |

---

## More Projects

Security operations and vulnerability management: where I started, and what I do day to day.

| Project | What I did | Stack |
| :--- | :--- | :--- |
| [Threat Hunt: AZUKI-SL Compromise](https://github.com/whozdae/Azuki-SL-Threat-Hunt-Report-) | Worked a 20-flag compromise investigation across 5 attack phases, from initial RDP access to lateral movement | MDE, KQL, ATT&CK |
| [Threat Hunt: Unauthorized TOR Usage](https://github.com/whozdae/threat-hunting-scenario-tor) | Traced a Tor download, silent install, execution, and outbound connections, then built the timeline and response | MDE, KQL |
| [Home SOC + Honeynet in Azure](https://github.com/whozdae/Home-SOC-in-Azure) | Exposed a honeypot VM, forwarded its logs to Sentinel, and analyzed real-world attack traffic | Azure, Sentinel, KQL |
| [Vulnerability Management Program](https://github.com/whozdae/Vulnerability-Managment-Program) | Took a simulated org from no policy to a completed scan-and-remediate cycle | Tenable, PowerShell, Bash |
| [DISA STIG Remediation Scripts](https://github.com/whozdae/whozdae/tree/main/STIGS) | PowerShell remediations for 10 Windows 11 STIG findings | PowerShell, DISA STIG |
| [AWS IAM Lab](https://github.com/whozdae/AWS-IAM-) | Built users, groups, roles, and least-privilege policies in AWS | AWS IAM, CloudTrail |
