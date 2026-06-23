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
- Inbound emails from ALL client-facing team members → Claude extracts interesting points, open questions, signals → auto-appended to client Notion page
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
Actions can originate anywhere: the dashboard, Zoho directly, an inbound email, a phone call, an Otter transcript. The sync layer intercepts every action and propagates consequences to every applicable system. Zoho = real-time client status. Notion = real-time client knowledge. Dashboard = real-time action surface. All three stay in sync automatically, regardless of where the action originated.

**4. Automation triggers on events, not on human action.**
Follow-ups fire because a contract was sent, not because someone remembered to set a reminder. CPR due dates are created because a project started, not because a consultant added a task. Design every trigger around an event that already happens.

**5. Every open hook is a Francis task.**
When a soft-side workflow requires document production or platform submission, mark it clearly: ⚠ HOOK: [description of what Francis needs to build]. Do not try to build it. Do not approximate it. Leave the hook clearly labeled and move on.

**6. Leverage before revenue before completeness.**
Brock's time is the scarce resource. Every task that permanently hands control to Claude is worth doing before a task that generates one output. The system should make Brock less necessary to daily operations over time, not more. When sequencing work, always ask: does completing this free Claude to do more, or does it just check a box?

---

## Task Priority Tiers (established June 23, 2026)

Every task in the dashboard is assigned one of three tiers. The dashboard surfaces tasks in this priority order:

**Leverage** — completes once, Claude takes over permanently. Gmail connections for all team members, Otter → Notion sync, client brain auto-creation, onboarding templates, touch point automation throughout the lifecycle. These compound over time and free Brock from doing things Claude can do. Always prioritized first.

**Revenue** — directly affects pipeline, lead generation, or client acquisition. Prioritized in this sequence:
1. DIR tasks — the email scrape seeds every other revenue channel
2. Google Ads / Customer Match lookalike from DIR list
3. Social channels — Facebook, Instagram, LinkedIn content + paid
4. B2B Rocket cold outreach sequences (more effective after social brand is established)
5. Stage 2 consultation conversion tasks (pre-call briefs, follow-ups, estimate generator)

**Completeness** — necessary for the system to be whole but neither frees Claude nor directly generates revenue. Zoho status fields, naming conventions, welcome kit contents, referral tracking fields. Done last.

**Francis** — never surfaced as Brock's next move. All HOOK/COMPEX items. Visually separated in the dashboard as parked/waiting on Francis.

### Sequencing Principle
Leverage first because it compounds. DIR data second because it seeds everything else. Paid and social third because they run on autopilot once built. Cold outreach fourth. Consultation conversion fifth. Completeness last. Within Stage 4, touch points (Leverage) are Brock's work; compliance execution (HOOK/COMPEX) is always Francis's.

---

## Email Sync — Full Team Required (updated June 23, 2026)

The sync layer must connect Gmail for ALL client-facing team members. Until all are connected, the client brain is incomplete for any thread that didn't go through Brock.

- **Brock** — already connected via MCP in this project
- **Anthy** — account manager, all client day-to-day communication — HOOK/SYNC · Phase 2 · HIGHEST PRIORITY
- **Rachel** — billing and compliance threads — HOOK/SYNC · Phase 2
- **Megan** — industry relationships, consultation calls — HOOK/SYNC · Phase 2
- **Future AMs** — same pattern as each is hired

---

## Lifecycle Stages

1. **Lead Generation** — 8 channels, all AI-first, DIR email scrape seeds all paid campaigns
2. **Consultation & Close** — AI triage, consultation call, compliance estimate, contract
3. **Onboarding** — Welcome kit, project info collection, DAS forms, rate calculation
4. **Active Project Loop** — Weekly CPR cycle, monthly CAC invoices, ongoing compliance (repeats until closeout)
5. **Retention** — Day 30/90 touches, upsell, relationship deepening
6. **Project Closeout** — Final affidavit, file closeout, referral trigger, review ask

---

## Stage 4 — Two-Layer Architecture

Stage 4 has two distinct layers. This distinction drives all dashboard prioritization.

**Layer 1 — Touch Points (Brock's domain, all Leverage):**
The alerts, confirmations, nudges, follow-ups, profile questions, drip sequences — everything that happens around the compliance work. Claude owns these permanently once built. They are what makes clients feel taken care of.

**Layer 2 — Compliance Execution (Francis/Compex domain, all HOOK/COMPEX):**
CPR production, DAS forms, eCPR upload, CAC invoices, fringe statements. Never surface as Brock's task. Brock's role is: detect need → surface in dashboard → AM approves → hook fires → track completion → sync to Notion.

---

## File Structure

```
pw-lifecycle/
  index.html              ← main lifecycle flowchart (all 6 stages)
  CLAUDE.md               ← this file
  watch.ps1               ← auto-push watcher (watches root + channels/ subfolder)
  _redirects              ← Netlify routing for channel subpages
  pw_nodes.py             ← shared node/arrow/layout library for all channel pages
  netlify/
    functions/
      claude.js           ← Anthropic API proxy function (injects API key server-side)
  dashboard/
    index.html            ← PW Command Center (Phase 1 Implementation Tracker)
  channels/
    dir-website.html
    national-outreach.html
    social-media.html
    google-ads.html
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

---

## Key Tools

- **Zoho CRM** — client records, pipeline, automation triggers, task management (via API only — humans never log in directly)
- **Notion** — client brain pages, lifecycle documentation, operational playbooks
- **Otter.ai** — meeting transcripts → auto-extracted to client Notion pages
- **Gmail** — ALL client-facing team members (Brock, Anthy, Rachel, Megan) → key points auto-extracted to client Notion pages
- **B2B Rocket** — outbound cold email sequences (5 Gmail sending accounts — consolidate to single monitored inbox)
- **LCPTracker / eComply / Elations / eMars** — CPR submission platforms (Francis manages integrations)
- **Netlify** — hosts live site + dashboard, auto-deploys from GitHub main branch
- **GitHub** — github.com/Brock-PW/pw-lifecycle (main branch = live)

---

## Dashboard

**Phase 1 — Implementation Tracker:** pwdashboard.netlify.app
Deployed from /dashboard subfolder. Anthropic API proxied via netlify/functions/claude.js.
Uses ANTHROPIC_API_KEY environment variable set in Netlify dashboard.
Task tier field values: "leverage" · "revenue" · "completeness" · "francis"
Revenue order field (revOrder): 1=DIR · 2=Google Ads · 3=Social · 4=B2B Rocket · 5=Consultation

**The full vision:** Eventually runs the entire business. All Gmail, all Google Drive, all Zoho contacts, all Asana tasks, all client communication driven through one interface.

---

## Shared Node Library

All channel HTML pages use pw_nodes.py for consistent rendering:
- `node()` — auto-height node with wrapping subtitle via foreignObject
- `wide_node()` — full-width node (default 700px)
- `diamond()` — decision diamond (label max 4 words, pure SVG polygon)
- `stage2_contractor()` — shared Stage 2 contractor close block
- `stage2_partnership()` — shared Stage 2 partnership close block

Color system:
- AI = purple (#EEEDFE / #AFA9EC)
- Human = green (#E1F5EE / #5DCAA5)
- Client action = red/orange (#FAECE7 / #F0997B)
- Automated trigger = amber (#FAEEDA / #EF9F27)
- Neutral / info = grey (#F1EFE8 / #B4B2A9)
- Stage 1 channel cards = slate blue (#EDF0F7 / #4A5F8A)

---

## Key Integration Components

Full integration roadmap lives in Notion:
notion.so/3742e7f35b1f81e0acb5f10de32cca8a

---

## Open Hooks (items awaiting Francis / future build)

**Sync layer (Phase 2 — all blocked until webhook infrastructure exists):**
- Zoho webhook infrastructure — BLOCKER — Francis
- Anthy Gmail → Notion auto-extraction — HOOK/SYNC — Francis + Claude — HIGHEST PRIORITY
- Rachel Gmail → Notion auto-extraction — HOOK/SYNC — Francis + Claude
- Megan Gmail → Notion auto-extraction — HOOK/SYNC — Francis + Claude
- Otter.ai → Notion auto-extraction pipeline — HOOK/SYNC — Francis + Claude
- Zoho Projects task complete → Notion — HOOK/SYNC
- Zoho stage change → Notion — HOOK/SYNC
- Zoho → QuickBooks billing integration — HOOK/COMPEX — Francis

**Revenue channels (Phase 1 — Brock + Claude):**
- DIR email scrape execution and list cleaning — HOOK/CLAUDE — Revenue tier 1
- Google Ads Customer Match upload from DIR list — HOOK/CLAUDE — Revenue tier 2
- Lookalike campaign build from Customer Match — HOOK/CLAUDE — Revenue tier 2
- Google Ads campaign structure and keyword strategy — HOOK/CLAUDE — Revenue tier 2
- Facebook page setup and content cadence — HOOK/CLAUDE — Revenue tier 3
- Instagram profile setup and Reels cadence — HOOK/CLAUDE — Revenue tier 3
- LinkedIn company page + Brock personal outreach cadence — HOOK/CLAUDE — Revenue tier 3
- Meta Ads lookalike audience from existing client list — HOOK/CLAUDE — Revenue tier 3
- Social content calendar and voice guide — HOOK/CLAUDE — Revenue tier 3
- B2B Rocket sequence rebuild in Brock's voice — HOOK/COMPEX — Revenue tier 4
- Gmail inbox consolidation: 5 sending accounts → single monitored inbox — HOOK/SYNC

**Hard-side (Francis / Compex — Phase 4):**
- CPR production
- DAS 140 / DAS 142 production
- eCPR upload to CA DIR (partial — some platforms live)
- CAC invoice production
- Fringe benefit statement production
- Prevailing wage rate calculation
- Project closeout documents
- Restitution calculation

---

## Hook Taxonomy

Not all hooks are the same. Use the correct type when marking a hook:

- ⚠ HOOK/COMPEX — a Claude-callable MCP endpoint Francis exposes when ready (hard-side execution)
- ⚠ HOOK/API — an API call that triggers a Francis-built workflow
- ⚠ HOOK/SYNC — requires the Zoho ↔ Notion ↔ Gmail ↔ Otter sync layer to be built first
- ⚠ HOOK/ZOHO — native Zoho automation (no Francis or Claude needed, configurable directly)
- ⚠ HOOK/CLAUDE — Claude handles this via MCP connection today (buildable now)

Format for all hooks:
⚠ HOOK/[TYPE]: `name_or_description` — what it does · what inputs it needs · what it returns

---

## Build Phases (agreed May 27, 2026 — updated June 23, 2026)

**Phase 1 — Complete the map (current)**
Finish Stages 2-6 on the flowchart. Every stage fully documented: all touchpoints, hooks named and typed, Zoho fields identified, Notion client brain structure defined. Also includes all Leverage and Revenue tasks Brock can action now via HOOK/CLAUDE.

**Phase 2 — Solve the sync layer**
Zoho ↔ Otter.ai ↔ Gmail (all four team members) ↔ Notion ↔ Claude.
This is the nervous system. Everything else depends on it.

**Phase 3 — Build the Knowledge Base**
Drive → Notion indexing. FAQ bank from Otter calls. Wizard of PW.

**Phase 4 — Hook up Francis workflows one at a time**
CPR production first → DAS forms → CAC invoices → rest in priority order.

**Phase 5 — Build the full dashboard**
Live ops interface. One conversation window per client. Connected to everything.

---

## Sub Oversight — Subcontractor Drip Sequence

Added June 11, 2026. Prime contractors pay PW to collect compliance documents from subs.
Required build: automated 3-touch drip sequence per non-responsive sub, per project.
- Touch 1: initial document request
- Touch 2: follow-up if no response (5 days)
- Touch 3: final notice (10 days)
- No response after Touch 3: dashboard alert → lead consultant calls directly
Claude drafts all three emails · AM reviews before sequence fires · tracked per sub per project.

---

## Deploy Workflow

1. HTML files updated in this chat (Claude.ai)
2. Files downloaded and dropped into C:\Users\brock\pw-lifecycle\ (root, channels/, or dashboard/)
3. watch.ps1 detects changes → git add -A → git commit → git push origin main
4. Netlify auto-deploys within ~60 seconds
5. If watcher not running: cd C:\Users\brock\pw-lifecycle && git add -A && git commit -m "message" && git push origin main

Commit message format: [scope]: [what changed] [version]
Example: dashboard: tier-based prioritization + social/ads tasks v2.0

**Future goal:** eliminate manual download/drop step. Claude pushes directly via GitHub API.

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
