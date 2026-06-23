# PW Dashboard — Project Context

This file provides focused context for building the PW Operations Dashboard.
Read CLAUDE.md and PW_ARCHITECTURE.md first — this file assumes full knowledge of both.

Last updated: June 19, 2026

---

## What We Are Building

A React-based interactive dashboard that serves as the operational interface for
Prevailing Wisdom. It has two audiences and two phases:

**Audience 1 — Lead Consultants**
See all assigned clients, current lifecycle stage, next action due, alerts, flags.
Every task is actionable from here — no logging into Zoho directly.
The Wizard of PW is accessible from the same window.

**Audience 2 — Brock (Owner/Operator)**
See all clients across all consultants, all open hooks, all build progress,
all pending tasks by owner. Drill down by consultant, by stage, by task type.
Running task list of owner-level items Brock needs to complete.

---

## Two Phases

**Phase 1 — Implementation Tracker (build now)**
A dashboard showing all open hooks, pending tasks, and build progress across
all 6 lifecycle stages. Organized by owner (Brock, Francis, Megan, Anthy, Bobby).
This is what gets presented and used while the operating system is being built.
Data source: hardcoded from the open hooks lists in CLAUDE.md and stage pages,
plus live reads from Zoho Projects and Notion via MCP where available.

**Phase 2 — Live Operations Dashboard (after Phase 2 sync layer is built)**
The full client management interface. Reads live from Zoho Projects (portal 829542738),
Notion client brain pages, Gmail, Otter. Claude agent embedded — one conversation
window per client. The Wizard of PW lives here.

---

## File Location

All dashboard files live in: `/dashboard/` subfolder of the `pw-lifecycle` GitHub repo
Deployed to: `pwdashboard.netlify.app`
GitHub repo: `github.com/Brock-PW/pw-lifecycle`
Publish directory (Netlify): `dashboard`

---

## Tech Stack

- React (functional components + hooks)
- Tailwind CSS (utility classes only — no compiler)
- Anthropic API (claude-sonnet-4-6) for the Claude agent interface
- Recharts for any data visualizations
- Lucide React for icons
- Available MCPs: Zoho CRM, Zoho Projects (portal 829542738), Notion, Google Drive,
  Gmail, Otter.ai, Google Calendar

---

## Phase 1 — Implementation Tracker: What to Show

### Dashboard Overview (top level)
- Progress bar per lifecycle stage (Stage 1-6): % of tasks complete
- Task count by owner: Brock / Francis / Megan / Anthy / Bobby
- Open hooks count by type: HOOK/COMPEX / HOOK/SYNC / HOOK/ZOHO / HOOK/CLAUDE
- Urgent items (things with deadlines or blockers)

### Stage Cards (clickable)
One card per lifecycle stage showing:
- Stage name and status (Complete / In Progress / Not Started)
- Open task count for that stage
- Who owns most of the open tasks
- Link to the live stage page on pwcustomerlifecycle.netlify.app

### Task List (filterable)
Full list of all open hooks and pending tasks across all stages.
Filter by: Owner / Stage / Hook Type / Status
Columns: Task · Stage · Owner · Hook Type · Status · Notes

### Brock's Personal Task List
Tasks specifically owned by Brock that need to be done to move the build forward.
Separate from the full task list — Brock's view only.

---

## Phase 1 — Complete Task Inventory

### STAGE 1 — Lead Generation
Owner: Brock / Claude
- [ ] B2B Rocket sequence rebuild in Brock's voice · Owner: Brock · HOOK/COMPEX
- [ ] Gmail inbox consolidation: 5 B2B Rocket accounts → single monitored inbox · Owner: Brock · HOOK/SYNC
- [ ] Zoho referral credit tracking fields: "Referred By" + "Credit Applied Date" · Owner: Brock · HOOK/ZOHO
- [ ] Zoho automation: referred client pays first invoice → flag Rachel to apply $250 credit · Owner: Brock · HOOK/ZOHO
- [ ] Zoho partner module for payroll firm referral tracking · Owner: Brock · HOOK/ZOHO
- [ ] Google review attribution within 14 days of ask · Owner: Brock · HOOK/ZOHO
- [ ] Google Ads Customer Match lookalike from DIR email scrape · Owner: Brock · HOOK/CLAUDE

### STAGE 2 — Consultation & Close
Owner: Brock / Megan
- [ ] Compliance estimate generator tool · Owner: Megan + Francis · HOOK/COMPEX · In Progress
- [ ] Pre-call brief automation (Zoho + Gmail + web search) · Owner: Claude · HOOK/CLAUDE · Buildable now
- [ ] T+2 / T+5 auto follow-up sequence build · Owner: Brock · HOOK/CLAUDE
- [ ] T+14 Brock personal follow-up draft system · Owner: Brock · HOOK/CLAUDE

### STAGE 3 — Onboarding
Owner: Brock / Anthy
- [ ] Onboarding email template in AM voice · Owner: Anthy · HOOK/CLAUDE
- [ ] "Working With PW" document template · Owner: Brock + Anthy · HOOK/CLAUDE
- [ ] Welcome kit contents + budget defined · Owner: Brock · Decision needed
- [ ] Bobby welcome kit task auto-creation in Zoho · Owner: Brock · HOOK/ZOHO
- [ ] Notion client brain page auto-creation at Stage 3 · Owner: Claude · HOOK/CLAUDE · Buildable now

### STAGE 4 — Active Project Loop
Owner: Brock / Anthy / Francis
- [ ] Lead Consultant Client Profile — 20 questions · implement in dashboard · Owner: Brock · HOOK/CLAUDE
- [ ] Project Information Form auto-send on project start · Owner: Claude · HOOK/CLAUDE
- [ ] Zoho Projects task list auto-creation via MCP · Owner: Claude · HOOK/CLAUDE · Buildable now
- [ ] Timesheet late alert threshold — decision needed per client · Owner: Lead Consultants · Pending decision
- [ ] Signature nudge at 7 days unsigned · Owner: Claude · HOOK/CLAUDE
- [ ] Client confirmation after eCPR upload · Owner: Claude · HOOK/CLAUDE
- [ ] PWCR renewal alert at 45 days · Owner: Claude · HOOK/CLAUDE
- [ ] Rate increase alert at 30 days · Owner: Claude · HOOK/CLAUDE
- [ ] CAC invoice reminder on 1st of month · Owner: Claude · HOOK/CLAUDE
- [ ] Sub Oversight 3-touch drip sequence · Owner: Claude · HOOK/CLAUDE
- [ ] 90-day profile refresh prompt · Owner: Claude · HOOK/CLAUDE
- [ ] Project wrap-up summary draft at closeout · Owner: Claude · HOOK/CLAUDE
- [ ] Referral ask at project closeout · Owner: Claude · HOOK/CLAUDE
- [ ] CPR production · Owner: Francis · HOOK/COMPEX
- [ ] DAS 140 production · Owner: Francis · HOOK/COMPEX
- [ ] DAS 142 production · Owner: Francis · HOOK/COMPEX
- [ ] eCPR upload · Owner: Francis · HOOK/COMPEX · Partial (some platforms live)
- [ ] CAC invoice production · Owner: Francis · HOOK/COMPEX
- [ ] Fringe benefit statement production · Owner: Francis · HOOK/COMPEX
- [ ] Prevailing wage rate calculation · Owner: Francis · HOOK/COMPEX
- [ ] Project closeout documents · Owner: Francis · HOOK/COMPEX
- [ ] Restitution calculation · Owner: Francis · HOOK/COMPEX

### STAGE 5 — Retention & Recovery
Owner: Brock / Lead Consultants
- [ ] Job Pending status auto-detection from client history · Owner: Claude · HOOK/CLAUDE
- [ ] Day 30 warm check-in draft system · Owner: Claude · HOOK/CLAUDE
- [ ] Day 60 recovery sequence · Owner: Claude · HOOK/CLAUDE
- [ ] 12-month follow-up timer for Terminated — Follow-Up accounts · Owner: Claude · HOOK/CLAUDE
- [ ] DNC flag preventing all outreach for Terminated — No Contact · Owner: Claude · HOOK/CLAUDE

### STAGE 6 — Contract Terminated
Owner: Brock
- [ ] Add "Terminated — Follow-Up" status to Zoho · Owner: Brock · HOOK/ZOHO · Quick win
- [ ] Add "Terminated — No Contact" status to Zoho · Owner: Brock · HOOK/ZOHO · Quick win

### PHASE 2 — SYNC LAYER (all blocked until built)
Owner: Francis + Claude
- [ ] Zoho webhook infrastructure · Owner: Francis · HOOK/SYNC · BLOCKER for all sync
- [ ] Anthy Gmail → Notion auto-extraction · Owner: Francis + Claude · HOOK/SYNC · HIGHEST PRIORITY
- [ ] Rachel Gmail → Notion auto-extraction · Owner: Francis + Claude · HOOK/SYNC
- [ ] All AM Gmail → Notion · Owner: Francis + Claude · HOOK/SYNC
- [ ] Otter transcript → Notion auto-extraction · Owner: Francis + Claude · HOOK/SYNC
- [ ] Otter API/webhook research · Owner: Francis · HOOK/SYNC · Research needed
- [ ] Zoho Projects task complete → Notion · Owner: Francis + Claude · HOOK/SYNC
- [ ] Zoho stage change → Notion · Owner: Francis + Claude · HOOK/SYNC
- [ ] Zoho → QuickBooks billing integration · Owner: Francis · HOOK/COMPEX

### NAMING CONVENTIONS (no code needed — process changes)
Owner: Brock
- [ ] Communicate Otter naming convention to team: [Client Name] — [Topic] — [YYYY-MM-DD] · Owner: Brock · Quick win
- [ ] Audit Zoho account names for consistency · Owner: Brock · Quick win
- [ ] Audit Google Drive client folder names to match Zoho Account_Name · Owner: Brock · Quick win

### KNOWLEDGE BASE (Phase 3)
Owner: Brock / Megan / Claude
- [ ] Review "Ask Prevailing Wisdom" Claude project with Megan · Owner: Brock + Megan
- [ ] Drive training folder → Notion Knowledge Base indexing · Owner: Claude · Phase 3
- [ ] Otter consultation calls → FAQ Bank extraction · Owner: Claude (Brock approves) · Phase 3
- [ ] Build Tone & Voice Guide · Owner: Megan + Brock · Phase 3
- [ ] Build Decision Trees with Megan · Owner: Brock + Megan · Phase 3
- [ ] Anthy touchpoints questionnaire — pending answers · Owner: Anthy
- [ ] Rachel touchpoints questionnaire — pending answers · Owner: Rachel

### ZOHO SETUP
Owner: Brock
- [ ] Add "Terminated — Follow-Up" status · Quick win
- [ ] Add "Terminated — No Contact" status · Quick win
- [ ] Add "Job Pending" status · Quick win (may already exist)
- [ ] Add "Warm" status · Quick win (may already exist)
- [ ] Add "Recovery" status · Quick win
- [ ] Connect Anthy Gmail via MCP · Owner: Brock · Highest value Phase 2 action

---

## Connected MCPs (available in this project)

- Zoho CRM — client records, contacts, pipeline
- Zoho Projects — portal 829542738 — all project-level compliance tasks
- Notion — client brains, lifecycle pages, knowledge base
- Google Drive — client folders, training materials
- Gmail (Brock) — inbound/outbound emails
- Otter.ai — call transcripts

---

## Key Design Principles for the Dashboard

1. Humans do one thing: approve and act. Claude does everything else.
2. Every task is actionable from the dashboard — no navigating to Zoho directly.
3. The overview gives the full picture at a glance. Drill down for detail.
4. Color-coded urgency: red (overdue/critical), amber (due soon), green (on track), grey (not started).
5. Brock's owner view shows the whole business. Consultant view shows only their clients.
6. The Claude agent window is always accessible — ask it anything about any client or task.
7. Mobile-friendly enough to check on a phone between meetings.

---

## Netlify Deploy Notes

- Site name: pwdashboard (or similar)
- Publish directory: dashboard
- Same GitHub repo as lifecycle map: Brock-PW/pw-lifecycle
- Auto-deploys on push to main branch
- watch.ps1 in repo root already watches all file types including /dashboard subfolder
