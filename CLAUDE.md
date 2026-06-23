# Prevailing Wisdom — Project Context for Claude Code

## What This Project Is

The operating system for Prevailing Wisdom — a California labor compliance company
managing prevailing wage compliance for contractors on public works projects.
Every file in this repo is one piece of a larger system that, when complete, allows
any team member to sit down, open the dashboard, and run the business.

Live site: pwcustomerlifecycle.netlify.app
Dashboard: pwdashboard.netlify.app (in /dashboard subfolder)
GitHub: github.com/Brock-PW/pw-lifecycle

---

## The Business

**Company:** Prevailing Wisdom — Labor Compliance Simplified
**Services:** CPR production · DAS 140/142 filing · ECPR uploads to CA DIR · fringe benefit statements · training contribution invoices · project closeout

**Team:**
- Brock McCormick — Owner, strategy, lead sales + marketing, face of brand
- Rachel — Owner, billing, compliance, Sub Oversight lead
- Francis — Owner, strategy, lead technical partner (Compex — all hard-side execution)
- Megan — Owner, lead industry expert, strategy, construction industry opener
- Anthy — Lead consultant, compliance, sales, Standard PW lead
- Bobby — EA, physical fulfillment, data entry support

---

## The Two Sides

**Soft side (Brock + Claude — this project):**
Everything customer-facing and relational. Lead generation, consultation, onboarding,
account management, follow-up, retention, referrals, client profiling, proactive service.

**Hard side (Francis / Compex):**
All document production and platform submission. CPR, DAS forms, ECPR uploads,
LCPTracker / eComply / Elations / eMars integrations, MCP-based drop file architecture.
When soft-side needs a document → leave ⚠ HOOK/COMPEX. Never approximate it.

---

## The Full Architecture (4 Layers)

### Layer 1 — Process Map (this repo)
Visual HTML flowcharts for all 6 lifecycle stages. Lives on Netlify.
Auto-deploys from GitHub main branch.

### Layer 2 — Automation Engine (Zoho CRM + Zoho Projects)
**Zoho CRM:** client records, pipeline stage, billing triggers, referral tracking.
**Zoho Projects (portal 829542738):** ALL project-level compliance tasks.
Every project has a task list (CA STATE / Mixed Funded) with tasks for:
CPR (weekly) · eCPR · DAS 140/142 · Prevailing Wages · FBS · Digital File Setup · CAC
100+ active projects. All readable via Zoho Projects MCP today.

### Layer 3 — Client Brain (Notion)
One page per client. Auto-updated from Otter + Gmail + Zoho events.
Lead consultants never log into Notion — they read a dashboard brief Claude compiles.

### Layer 4 — Dashboard (to be built — Phase 5)
Claude conversation interface. One window per client.
Surfaces what's happening, what's due, what needs approval.
The Wizard of PW lives here. Reads from Notion + Zoho + Gmail + Otter.

---

## Design Principles

1. **Humans do one thing: exceptional relationship management.** Everything else is automated.
2. **System is the memory, not the person.** Every client insight auto-captured in Notion.
3. **Bidirectional sync — source of action does not matter.** Dashboard, Zoho, email, Otter, phone — all propagate to every applicable system.
4. **Automation triggers on events, not human action.**
5. **Compex is Francis's execution engine.** Claude triggers and tracks. Compex executes. Francis defines method.
6. **Never use absolute language** (always/never) about any specific system — design for sync.

---

## Hook Taxonomy (UPDATED June 2026)

Five hook types — use the correct one every time:

### ⚠ HOOK/COMPEX
**Francis's domain. Compex executes. Claude triggers, tracks, follows up.**
Format: `⚠ HOOK/COMPEX: task_name — what needs to happen`
Claude's three jobs: BEFORE (detect, notify, hand off) · DURING (track start) · AFTER (track completion, sync, follow-up)
Used for: all document production, platform submission, hard-side automation.
Examples: cpr_production · das_140_production · ecpr_upload · cac_invoice_production

### ⚠ HOOK/SYNC
**Requires the Phase 2 sync layer. Blocked until Phase 2 complete.**
Format: `⚠ HOOK/SYNC: description — what needs to sync between which systems`
Used for: Zoho ↔ Notion ↔ Gmail ↔ Otter ↔ Claude bidirectional data flows.
**Cowork can bridge many HOOK/SYNC items today — see Automation Roadmap below.**

### ⚠ HOOK/ZOHO
**Native Zoho automation. No custom development needed.**
Format: `⚠ HOOK/ZOHO: description — what Zoho trigger + what Zoho action`
Used for: status changes, task creation, field updates, native Zoho workflows.
Examples: stage change triggers · task list template population · Bobby task creation

### ⚠ HOOK/CLAUDE
**Claude handles today via connected MCPs. Buildable now.**
Format: `⚠ HOOK/CLAUDE: description — what Claude does via which MCP`
Used for: anything Claude can do with Zoho CRM, Zoho Projects, Notion, Gmail, Otter, Drive MCPs.
Examples: pre-call brief · client brain creation · Zoho Projects task list creation · PWCR alerts

### ⚠ HOOK/COWORK
**Cowork desktop agent handles as persistent background automation.**
Format: `⚠ HOOK/COWORK: description — trigger condition + what Claude does when triggered`
Used for: scheduled monitoring, event detection, background sync that doesn't need a webhook.
**This is the bridge layer — fills HOOK/SYNC gaps before Phase 2 webhook infrastructure is built.**
Examples: Otter transcript detected → extract to Notion · daily Zoho Projects morning briefing · Gmail monitoring

---

## Automation Roadmap (Three-Phase)

### Phase A — Cowork Now (available today, no Francis needed)
Start with these three — highest value, no infrastructure required:

1. **Otter → Notion** ⚠ HOOK/COWORK
   Cowork detects new Otter transcript → Claude reads → extracts key points, decisions,
   personal mentions, action items → appends to correct Notion client brain page.
   This is the single most valuable automation. Replaces the most painful manual work.

2. **Gmail → Notion** ⚠ HOOK/COWORK
   Cowork monitors Brock's Gmail (then Anthy's) for significant client emails →
   Claude extracts signals, questions, relationship notes → appends to client brain.
   Available now for Brock's Gmail. Anthy's Gmail requires MCP connection first.

3. **Morning Briefing** ⚠ HOOK/COWORK
   Cowork runs daily at 7am → Claude reads all active Zoho Projects →
   identifies late CPRs, expiring PWCRs, rate increases due, DAS pending →
   surfaces consolidated briefing to Brock's dashboard.
   This is Megan's spreadsheet — automated, live, zero manual effort.

### Phase B — Sync Layer (Francis builds webhook infrastructure)
Formal bidirectional sync. All ⚠ HOOK/SYNC items unblock here.
- Zoho webhook infrastructure (Francis — BLOCKER for all Phase B items)
- Zoho Projects task complete → Notion client brain
- Zoho stage change → Notion
- Otter → Zoho activity log
- All AM Gmail → Notion (formal, not Cowork-bridged)
- Zoho → QuickBooks billing (⚠ HOOK/COMPEX)

### Phase C — Compex Workflows (Francis builds one at a time)
Hard-side document automation. Start with highest volume:
1. CPR production
2. DAS 140 / DAS 142
3. CAC invoice production
4. Fringe benefit statement
5. eCPR upload (partial — some platforms live already ✅)
6. Prevailing wage rate calculation
7. Project closeout documents
8. Restitution calculation
9. Compliance estimate generator (Megan building — in progress 🔧)

### Phase D — Dashboard (Phase 5)
Claude conversation interface per client. Wizard of PW embedded.
Connected to everything. Replaces Megan's spreadsheet entirely.

---

## Build Phases (Lifecycle Map)

**Phase 1 — Complete the lifecycle map ✅ COMPLETE**
All 6 stages documented. All hooks named and typed.

**Phase 2 — Sync layer** ← NEXT
Cowork bridges the most critical gaps immediately.
Francis builds webhook infrastructure for formal sync.

**Phase 3 — Knowledge Base + Wizard of PW**
Drive → Notion indexing. FAQ Bank from Otter calls. Wizard of PW built.

**Phase 4 — Compex workflows one at a time**
CPR first. Each solved thoroughly before moving to next.

**Phase 5 — Dashboard**
Claude conversation interface. One window per client. Wizard lives here.

---

## Lifecycle Stages (all complete — dedicated HTML pages)

1. **Lead Generation** — 8 channels, all AI-first · stage1 in index.html
2. **Consultation & Close** — Pre-call brief · estimate · contract · stage2.html
3. **Onboarding** — Relationship handshake · welcome kit · client brain · stage3.html
4. **Active Project Loop** — Weekly CPR · proactive triggers · closeout · stage4.html
5. **Retention & Recovery** — Job Pending · Warm · Recovery (30/60 days) · stage5.html
6. **Contract Terminated** — Follow-Up (12mo) · No Contact · stage6.html

**Account Statuses (Zoho — update needed):**
Active · Job Pending · Warm · Recovery · Terminated — Follow-Up · Terminated — No Contact

---

## Stage 4 Key Decisions

**Data source:** Zoho Projects portal 829542738 — all project-level compliance tasks.
Megan's spreadsheet = reference only. Build on Zoho Projects directly.

**Dashboard modes:**
- Mode 1: Compex available → Claude detects → AM approves → Compex executes → Claude syncs
- Mode 2: No Compex yet → Claude detects → AM does work manually → marks complete anywhere → Claude syncs
Both modes fully usable today. Mode 1 activates as Compex workflows are built.

**Lead Consultant Client Profile — 20 questions:**
Filed at Stage 3 handoff. Covers: payroll day · communication preferences · relationship context · typical work · risk flags.
Refreshed at: 90 days · every project closeout · significant events · annually.

**All communication auto-summarizes to Notion client brain:**
Otter calls + inbound emails + outbound emails + Zoho task completions → all appended automatically.
⚠ HOOK/COWORK bridges this until Phase B sync layer is built.

**Project wrap-up summary:** Claude drafts from project data → lead consultant approves → sends at closeout.
**Referral ask:** Claude drafts at every positive project close → lead consultant approves → sends.
**Project Information Form:** Auto-sent for every new project — no exceptions.

---

## File Structure

```
pw-lifecycle/
  index.html              ← main lifecycle flowchart (all 6 stages, summary cards)
  stage2.html             ← Stage 2 dedicated page
  stage3.html             ← Stage 3 dedicated page
  stage4.html             ← Stage 4 dedicated page
  stage5.html             ← Stage 5 dedicated page
  stage6.html             ← Stage 6 dedicated page
  CLAUDE.md               ← this file
  DASHBOARD.md            ← dashboard project context
  PW_ARCHITECTURE.md      ← master tool guide
  watch.ps1               ← auto-push watcher (all file types, all subfolders)
  _redirects              ← Netlify routing
  pw_nodes.py             ← shared node library for channel pages
  channels/
    dir-website.html · national-outreach.html · social-media.html
    google-ads.html · referrals.html · payroll-firms.html
    construction-orgs.html · industry-titans.html
  dashboard/
    index.html            ← PW Dashboard (deploys to pwdashboard.netlify.app)
```

---

## Notion Structure

Main lifecycle page: notion.so/35e2e7f35b1f812d8e7cec432f027512

Sub-pages:
- Stage 1: 35e2e7f3-5b1f-8146-9208-cb4c1865995b
- Stage 2: 35e2e7f3-5b1f-81a8-b680-caf9216c7e13
- Stage 3: 35e2e7f3-5b1f-81cb-83fc-cd6a411e957b
- Stage 4: 35e2e7f3-5b1f-81f1-9fee-f1e359a303ab
- Stage 5: 35e2e7f3-5b1f-8187-af04-c114cb6339fd
- Stage 6: 35e2e7f3-5b1f-8121-b3b8-f18c8415b130
- PW Technology Architecture: 3722e7f3-5b1f-81b0-89a3-e20843163a47
- Wizard of PW Knowledge Base: 3722e7f3-5b1f-8100-bbf5-e9ab55035a39
- Active Clients: 3742e7f3-5b1f-8130-aa09-f8616efb29f5
- Key Integration Components: 3742e7f3-5b1f-81e0-acb5-f10de32cca8a
- Standard Construction Client Brain: 3742e7f3-5b1f-8157-b403-d9161d1703cd

**Notion update rule:** Every HTML change → update corresponding Notion sub-page same session.
**Notion confirmation rule:** End of every session → ✅ Notion updated: [page] — [what changed]

---

## Connected MCPs (available now)

- Zoho CRM — client records, contacts, pipeline
- Zoho Projects — portal 829542738 — all compliance tasks
- Notion — client brains, lifecycle pages, knowledge base
- Google Drive — client folders, training materials
- Gmail (Brock) — inbound/outbound emails
- Otter.ai — call transcripts

---

## Open Items (quick wins — no code needed)

- [ ] Add "Terminated — Follow-Up" status to Zoho · ⚠ HOOK/ZOHO
- [ ] Add "Terminated — No Contact" status to Zoho · ⚠ HOOK/ZOHO
- [ ] Add "Job Pending" status to Zoho if not present · ⚠ HOOK/ZOHO
- [ ] Add "Warm" status to Zoho if not present · ⚠ HOOK/ZOHO
- [ ] Add "Recovery" status to Zoho if not present · ⚠ HOOK/ZOHO
- [ ] Connect Anthy Gmail via MCP — highest value Phase A action
- [ ] Communicate Otter naming convention to team: [Client Name] — [Topic] — [YYYY-MM-DD]
- [ ] Audit Zoho account names for consistency with Drive folder names
- [ ] Define welcome kit contents + budget (Bobby executes, Brock defines)

---

## Deploy Workflow

1. Files updated in Claude.ai chat
2. Drop into C:\Users\brock\pw-lifecycle\ (root or subfolders)
3. watch.ps1 auto-pushes all file types including /channels and /dashboard
4. Netlify auto-deploys within ~60 seconds
   - Root → pwcustomerlifecycle.netlify.app
   - /dashboard → pwdashboard.netlify.app

Commit format: [scope]: [what changed] [version]

---

## Domain Glossary

- DIR — CA Department of Industrial Relations
- PWCR — Public Works Contractor Registration (annual, required)
- CPR — Certified Payroll Report (weekly, per project)
- ECPR — Electronic CPR (submitted to CA DIR website)
- DAS 140 — Apprentice notification form (due within 10 days of contract execution)
- DAS 142 — Apprentice dispatch request (due 72 hours before requested date)
- CAC — CA Apprenticeship Council (monthly training contribution invoices)
- FBS — Fringe Benefit Statement
- Sub Oversight — PW service for prime contractors monitoring subcontractor compliance
- LCPTracker / eComply / Elations / eMars / Prism / LAUSD — CPR submission platforms
- Compex — Francis's execution engine for all hard-side automation
- Cowork — Anthropic desktop agent, used as bridge automation layer
