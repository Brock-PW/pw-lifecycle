# Prevailing Wisdom — Project Context for Claude Code

## What This Project Is

This is not just a flowchart. It is the operating system for Prevailing Wisdom — a California labor compliance company managing prevailing wage compliance for contractors on public works projects. Every file in this repo is one piece of a larger system that, when complete, allows any team member to sit down, open the dashboard, and run the business.

---

## The Business

**Company:** Prevailing Wisdom
**Tagline:** Labor Compliance Simplified
**Services:** Certified payroll (CPR) production, DAS 140/142 filing, ECPR uploads to CA DIR, fringe benefit statements, training contribution invoices, project closeout
**Live site:** pwcustomerlifecycle.netlify.app
**GitHub:** github.com/Brock-PW/pw-lifecycle

**Team:**
- Brock McCormick — Owner, strategy, lead sales and marketing, all partnership calls, face of brand
- Rachel — Owner, billing, compliance
- Francis — Owner, strategy, lead technical partner (builds all document automation and hard-side integrations)
- Megan — Owner, lead industry expert, strategy, construction industry relationship opener
- Anthy — Account manager, compliance, sales
- Bobby — EA, physical fulfillment (welcome kits), data entry support

---

## The Two Sides of the Business

**Soft side (Brock + Claude in this project):**
Everything customer-facing, relational, and lifecycle-driven. Lead generation, consultation, onboarding communication, account management, follow-up, retention, referrals, reviews, client profiling, proactive service delivery. This is what we are building in this repo and in Notion.

**Hard side (Francis):**
All document production and platform submission automation. CPR production, DAS form generation, ECPR uploads to CA DIR, LCPTracker / eComply / Elations / eMars integrations, MCP-based drop file architecture. When a soft-side flow requires a document to be produced or submitted, leave an open hook (marked ⚠ HOOK) and Francis fulfills it with a callable process.

**The rule:** Never build document production logic in the soft-side system. Always leave a hook.

---

## The Full Architecture (4 Layers)

### Layer 1 — The Process Map (this repo)
Visual HTML flowcharts showing every lifecycle stage, touchpoint, decision, and automation. Lives on Netlify. Auto-deploys from GitHub main branch via Netlify. Staged at: pwcustomerlifecycle.netlify.app

### Layer 2 — The Automation Engine (Zoho)
Every task, reminder, trigger, and notification. Contract sent → follow-up fires. Project starts → CPR due date created. Closeout confirmed → referral sequence triggers.

**Critical rule:** Humans never log into Zoho to manually complete tasks or update stages. Zoho is updated by automation and by the dashboard — never by direct human input. This is the single biggest failure mode of all previous systems. Design every automation with this constraint in mind.

### Layer 3 — The Client Brain (Notion)
A dedicated Notion page per client containing everything known about that client: project details, communication preferences, relationship notes, personality, past issues, key contacts, project history. This is institutional memory that survives consultant turnover.

**How it stays current automatically:**
- Otter.ai meeting transcripts → Claude extracts key points, questions asked, commitments made → auto-appended to client Notion page
- Inbound emails from client → Claude extracts interesting points, open questions, signals → auto-appended to client Notion page
- Account managers never log into Notion directly
- Account managers read a client brief surfaced in the dashboard — Claude compiles it from Notion before every interaction

### Layer 4 — The Dashboard (to be built)
Single interface for account managers and lead consultants. Shows all 30-50 assigned clients, current lifecycle stage, next action due, flags, and alerts. Account managers complete tasks here — the dashboard writes back to Zoho. No one goes into Zoho directly.

Per-consultant view: each consultant sees only their clients. Lead consultant view: sees all clients across their team.

---

## Design Principles

**1. Humans should do one thing: deliver exceptional relationship management.**
Everything operational — document production, task tracking, follow-up timing, status updates, content creation — should be automated or AI-assisted. Account managers review, approve, and manage relationships. They do not produce, input, or track manually.

**2. The system is the memory, not the person.**
If knowledge about a client lives only in a consultant's head, it will be lost. Every client interaction, every preference, every nuance goes into the Notion client brain automatically. The goal is 100 clients per consultant, not 30-40.

**3. Bidirectional sync — source of action does not matter.**
Actions can originate anywhere: the dashboard, Zoho directly, an inbound email, a phone call, an Otter transcript. The sync layer intercepts every action and propagates consequences to every applicable system. Zoho = real-time client status. Notion = real-time client knowledge. Dashboard = real-time action surface. All three stay in sync automatically, regardless of where the action originated. Never use "always" or "never" about any specific system — design for sync, not for restriction.

**4. Automation triggers on events, not on human action.**
Follow-ups fire because a contract was sent, not because someone remembered to set a reminder. CPR due dates are created because a project started, not because a consultant added a task. Design every trigger around an event that already happens — but any system can be the source of that event.

**5. Every open hook is a Francis task.**
When a soft-side workflow requires document production or platform submission, mark it clearly: ⚠ HOOK: [description of what Francis needs to build]. Do not try to build it. Do not approximate it. Leave the hook clearly labeled and move on.

---

## Lifecycle Stages

1. **Lead Generation** — 8 channels, all AI-first, DIR email scrape seeds all paid campaigns
2. **Consultation & Close** — AI triage, consultation call, compliance estimate, contract
3. **Onboarding** — Welcome kit, project info collection, DAS forms, rate calculation
4. **Active Project Loop** — Weekly CPR cycle, monthly CAC invoices, ongoing compliance (repeats until closeout)
5. **Retention** — Day 30/90 touches, upsell, relationship deepening
6. **Project Closeout** — Final affidavit, file closeout, referral trigger, review ask

---

## File Structure

```
pw-lifecycle/
  index.html              ← main lifecycle flowchart (all 6 stages)
  CLAUDE.md               ← this file
  watch.ps1               ← auto-push watcher (watches root + channels/ subfolder)
  _redirects              ← Netlify routing for channel subpages
  pw_nodes.py             ← shared node/arrow/layout library for all channel pages
  channels/
    dir-website.html
    national-outreach.html
    social-media.html
    google-ads.html         ← named google-ads, titled "Website / Google Ads"
    referrals.html
    payroll-firms.html
    construction-orgs.html
    industry-titans.html
```

---

## Notion Structure

Main lifecycle page: notion.so/35e2e7f35b1f812d8e7cec432f027512

Sub-pages:
- Stage 1 — Lead Generation: 35e2e7f3-5b1f-8146-9208-cb4c1865995b
- Stage 2 — Consultation & Close: 35e2e7f3-5b1f-81a8-b680-caf9216c7e13
- Stage 3 — Onboarding: 35e2e7f3-5b1f-81cb-83fc-cd6a411e957b
- Stage 4 — Active Project Loop: 35e2e7f3-5b1f-81f1-9fee-f1e359a303ab
- Stage 5 — Retention: 35e2e7f3-5b1f-8187-af04-c114cb6339fd
- Stage 6 — Project Closeout: 35e2e7f3-5b1f-8121-b3b8-f18c8415b130

**Notion update rule:** Every time an HTML page is updated, the corresponding Notion sub-page must be updated in the same session. Never push an HTML change without updating Notion.

**Notion confirmation rule:** At the end of every session, confirm Notion was updated with a one-line summary:
✅ Notion updated: [sub-page name] — [what changed]
If multiple sub-pages were updated, list each one. This allows Brock to spot-check by opening the relevant page.

---

## Key Tools

- **Zoho CRM** — client records, pipeline, automation triggers, task management (via API only — humans never log in directly)
- **Notion** — client brain pages, lifecycle documentation, operational playbooks
- **Otter.ai** — meeting transcripts → auto-extracted to client Notion pages
- **Gmail** — client email → key points auto-extracted to client Notion pages
- **B2B Rocket** — outbound cold email sequences (5 Gmail sending accounts — consolidate to single monitored inbox)
- **LCPTracker / eComply / Elations / eMars** — CPR submission platforms (Francis manages integrations)
- **Netlify** — hosts live site, auto-deploys from GitHub main branch
- **GitHub** — github.com/Brock-PW/pw-lifecycle (main branch = live)

---

## Shared Node Library

All channel HTML pages use pw_nodes.py for consistent rendering:
- `node()` — auto-height node with wrapping subtitle via foreignObject
- `wide_node()` — full-width node (default 700px)
- `diamond()` — decision diamond (label max 4 words, pure SVG polygon)
- `stage2_contractor()` — shared Stage 2 contractor close block
- `stage2_partnership()` — shared Stage 2 partnership close block
- `section_header()`, `col_label()`, `arrow_down()`, `line_across()` etc.

Color system:
- AI = purple (#EEEDFE / #AFA9EC)
- Human = green (#E1F5EE / #5DCAA5)
- Client action = red/orange (#FAECE7 / #F0997B)
- Automated trigger = amber (#FAEEDA / #EF9F27)
- Neutral / info = grey (#F1EFE8 / #B4B2A9)
- Stage 1 channel cards = slate blue (#EDF0F7 / #4A5F8A) — no owner key association

---

## Key Integration Components

Full integration roadmap lives in Notion:
notion.so/3742e7f35b1f81e0acb5f10de32cca8a

Organized by phase, type, status, and owner. Check this page before starting any new integration work.

---

## Open Hooks (items awaiting Francis / future build)

- B2B Rocket sequence rebuild (all CA sequences in Brock's voice)
- Gmail inbox consolidation: 5 B2B Rocket sending accounts → single monitored inbox
- Zoho referral credit tracking: "Referred By" field + "Credit Applied Date" field
- Zoho automation: referred client pays first invoice → flag Rachel to apply $250 credit
- Zoho partner module for payroll firm referral tracking
- Google review attribution: attribute reviews within 14 days of ask to requesting client
- Google Ads Customer Match lookalike from DIR email scrape
- AI compliance estimator tool (separate Claude project — feeds Stage 2 estimate node)
- Client Notion brain pages (one per client — structure to be designed in Stage 3)
- Otter.ai → Notion auto-extraction pipeline
- Email → Notion auto-extraction pipeline
- Dashboard (Layer 4 — built after Stages 2-6 are fully mapped)
- Zoho → Dashboard API connection

---


---

## Hook Taxonomy

Not all hooks are the same. Use the correct type when marking a hook:

- ⚠ HOOK/AGENT — a Claude-callable MCP endpoint Francis exposes when ready
- ⚠ HOOK/API — an API call that triggers a Francis-built workflow
- ⚠ HOOK/SYNC — requires the Zoho ↔ Notion ↔ Gmail ↔ Otter sync layer to be built first

Format for all hooks:
⚠ HOOK/[TYPE]: `name_or_description` — what it does · what inputs it needs · what it returns

Never approximate what a hook does. Leave it named, typed, and described. Move on.

---

## Build Phases (agreed May 27, 2026 — Brock + Francis)

**Phase 1 — Complete the map (current)**
Finish Stages 2-6 on the flowchart. Every stage fully documented: all touchpoints, hooks named and typed, Zoho fields identified, Notion client brain structure defined. This is the blueprint. Nothing gets built yet. Everything gets named and placed correctly.

**Phase 2 — Solve the sync layer**
Before any document automation or agent calls matter, the core sync must work:
Zoho ↔ Otter.ai ↔ Gmail ↔ Notion ↔ Claude
Email arrives → parsed → Notion updated, Zoho updated if status change.
Otter transcript available → parsed → key points + action items → Notion updated.
Zoho stage changes → downstream tasks cascade → Notion updated.
This is the nervous system. Everything else depends on it. Solve it thoroughly before moving on.

**Phase 3 — Hook up Francis's workflows one at a time**
Starting with highest-volume, highest-value:
1. CPR production (core weekly loop)
2. DAS forms (DAS 140 + DAS 142)
3. CAC monthly invoices
4. Fringe benefit statements
5. Additional workflows in priority order
Each solved thoroughly before moving to the next.

**Phase 4 — Build the dashboard**
Once sync layer is working and core document workflows are hooked in, build the Claude conversation interface — one window per client, connected to everything.

Francis's principle: step-by-step · bite off small chunks · solve thoroughly before moving on.

---

## Francis Integration Notes (from May 27, 2026 alignment)

- Not all hooks are "agents" — Francis builds a mix of MCP endpoints and API calls that trigger workflows. Call them hooks, not agents, until Francis names them.
- Francis will not expose existing workflows yet — hooks remain typed and named but uncalled until Francis opens them.
- General architecture alignment confirmed. Edge cases will surface and be solved as encountered.
- The sync layer (Phase 2) is identified as the hardest single piece and must be solved before anything else is built on top of it.

---

---

## Stage 4 — Active Project Loop: Key Architecture Decisions

### Data Source
All project-level compliance data lives in Zoho Projects (portal ID: 829542738).
Every project has a task list (e.g. "CA STATE PROJECT") with individual tasks for:
CPR (weekly, one task per week period) · eCPR (paired with each CPR) · DAS 140/142 · 
Prevailing Wages · Fringe Benefit Statement · Digital File Setup · Training Contributions

Claude reads all of this via Zoho Projects MCP — no manual data entry needed.
100+ active projects accessible. Task dates, completion status, assigned owner, 
quantity, and billing details (Performing/Non Performing) all readable.

### Dashboard Operating Modes

**Mode 1 — Automated execution (Compex available):**
Claude detects need → surfaces in dashboard → AM approves → ⚠ HOOK/COMPEX fires →
Compex executes → completion signal → Claude marks complete in Zoho Projects →
syncs to Notion client brain → alert clears from dashboard.

**Mode 2 — Human-assisted execution (no Compex automation yet):**
Claude detects need → surfaces in dashboard → AM does the work manually →
AM marks complete (in dashboard chat, or directly in Zoho Projects) →
Claude detects completion via Zoho MCP → syncs to Notion → alert clears.
Source of "done" signal does not matter — Claude picks it up wherever it happens.

This two-mode model means the dashboard is fully usable TODAY for all tasks,
regardless of which Compex automations exist. Mode 2 is the bridge until Phase 4 is complete.

### Dashboard Display Requirements
The dashboard must have two layers:

**Layer 1 — The Overview (what you see first):**
All assigned clients/projects · status indicators · alert counts · color-coded urgency.
Late CPRs · expiring PWCRs · pending DAS forms · rate increases due · open tasks.
Same data Megan's spreadsheet tracks — but pulled live from Zoho Projects, not manually.
Per-consultant view: each AM sees only their assigned projects.
Lead view: sees all projects across the team.

**Layer 2 — The Action Layer (drill into a project/client):**
Claude conversation interface for that client/project.
All open tasks listed with due dates and urgency.
Every task is actionable from here — AM never needs to log into Zoho separately.
"Mark complete" fires Mode 1 or Mode 2 depending on whether Compex automation exists.
The Wizard of PW is accessible from this same window.

### Megan's Spreadsheet Role
Megan's Labor Compliance Command Center (Google Sheets) is a manually maintained mirror
of data that already exists in Zoho Projects. It is a valuable reference for:
- The correct alert logic (what to flag, what thresholds to use)
- The field mapping (CPR date, eCPR date, DAS status, PWCR expiration, rate increase date)
- The dashboard layout and visual design to replicate/improve upon

The destination is Claude reading Zoho Projects directly and surfacing the same alerts
automatically. The spreadsheet stays as-is until the dashboard replaces it.
Do not try to sync the spreadsheet — build on top of Zoho Projects directly.

---

---

---

## Stage 4 — Lead Consultant Client Profile

### The 20-Question Profile
Filled out by the lead consultant when assigned to a new client at Stage 3 handoff.
Stored in Notion client brain. Feeds all dashboard automation from Stage 4 onward.

Questions cover:
- Weekly rhythm: payroll day, timesheet submission day, signature turnaround expectation
- Communication: preferred channel, best time, primary vs day-to-day contact, tech-savviness
- Relationship: how they came to PW, experience level, what they care about most, what would make them leave, personal notes
- The work: typical classifications, CPR platforms, apprentice frequency, project type, single vs multiple simultaneous projects
- Risk & flags: compliance history, non-standard handling needs, consultation call notes

### Profile Refresh Triggers (Claude surfaces prompt to update)
- 90 days into active relationship
- At every project closeout
- When significant event detected (compliance issue, personnel change, flag in Otter or email)
- Annually for long-running relationships
Not a full re-do — Claude surfaces "here's what we have, anything to update?" in dashboard.

### All Communication Auto-Summarized to Notion Client Brain
Every interaction feeds the client brain automatically:
- Otter call transcript → Claude extracts key points, decisions, personal mentions, action items → appended to client brain
- Inbound client emails → Claude extracts signals, questions, concerns, relationship notes → appended
- Outbound emails by lead consultant → Claude notes what was communicated + when → appended
- Zoho Projects task completions → Claude notes completion + date → appended to project history

Result: a complete, chronological, auto-built record of the entire client relationship.
Lead consultant never manually updates it. It builds itself.

All of these are ⚠ HOOK/SYNC items requiring the Phase 2 sync layer.
See Key Integration Components Notion page for full details.

---

## Sub Oversight — Subcontractor Drip Sequence (to build in Stage 4)

Added June 11, 2026. Prime contractors pay PW to collect compliance documents from subs.
Subs are not always responsive. No structured follow-up system exists today.

Required build:
- Automated 3-touch drip sequence per non-responsive sub, per project
- Touch 1: initial document request
- Touch 2: follow-up if no response  
- Touch 3: final notice
- If no response after Touch 3: dashboard notifies lead consultant to call sub directly
- Claude drafts all three emails · AM reviews and approves before sequence fires
- Tracked per sub per project in dashboard
- Do not build emails yet — placeholder for Stage 4 Sub Oversight workflow

This belongs in the Wizard FAQ Bank (Sub Oversight Gap #6) and Stage 4 Sub Oversight flow.
Notion update pending — add to Wizard page next session.

---

## Deploy Workflow

1. HTML files updated in this chat (Claude.ai)
2. Files downloaded and dropped into C:\Users\brock\pw-lifecycle\ (root or channels/ subfolder)
3. watch.ps1 detects changes → git add -A → git commit → git push origin main
4. Netlify auto-deploys within ~60 seconds
5. If watcher is not running: cd C:\Users\brock\pw-lifecycle && git add -A && git commit -m "message" && git push origin main

Commit message format: [scope]: [what changed] [version]
Example: channels/referrals: $250 credit Day 0-7 sequence v1.2

---

## Domain Glossary

- DIR — CA Department of Industrial Relations
- PWCR — Public Works Contractor Registration (annual, required for all CA public works contractors)
- CPR — Certified Payroll Report (weekly, submitted per project)
- ECPR — Electronic CPR (submitted to CA DIR website)
- DAS 140 — Apprentice notification form (due within 10 days of contract execution)
- DAS 142 — Apprentice dispatch request (due 72 hours before requested date)
- CAC — CA Apprenticeship Council (monthly training contribution invoices)
- Fringe benefit statement — document declaring where fringe benefits are paid
- Davis-Bacon — Federal prevailing wage law (applies to federally-funded construction)
- Sub Oversight — PW service for prime contractors monitoring their subcontractors' compliance
- LCPTracker / eComply / Elations / eMars / Prism / LAUSD — CPR submission platforms
