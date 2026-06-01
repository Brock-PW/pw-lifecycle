# Prevailing Wisdom — Technology Architecture
## Master Guide · Updated May 27, 2026

This document defines every tool, what it owns, and how they connect.
Use this as the decision guide for every build going forward.
If a new tool or workflow is proposed, it must fit into this framework first.

---

## THE STACK AT A GLANCE

```
INCOMING LEADS          →  Claude (AI) + Marketing Tools
CLIENT LIFECYCLE        →  Zoho (task + status engine)
BILLING                 →  QuickBooks (invoicing + payments)
KNOWLEDGE BASE          →  Notion (living brain) + Google Drive (library)
SOP CREATION            →  Scribe → Drive → Notion
CONSULTANT INTERFACE    →  Dashboard (Claude agent = The Wizard of PW)
SYNC LAYER              →  Connects everything bidirectionally
```

---

## LAYER 1 — INCOMING FUNNEL
**Owner: Claude + Marketing Tools**

Claude is connected to every inbound channel and manages all outbound sequences.
Nothing is manual. Every lead that touches PW flows through this layer.

### Connected Channels:
- **Facebook** — AI manages content, DMs, group presence, Meta Ads
- **Instagram** — AI manages Reels, Stories, DMs, Meta Ads lookalike
- **LinkedIn** — AI manages content, connection outreach, Matched Audiences
- **Google Ads** — AI manages PPC campaigns, ad copy rotation, keyword strategy
- **Website** — AI manages blog content, SEO, AEO schema, review requests
- **B2B Rocket** — AI manages cold email sequences, reply triage
- **Brock's Gmail** — AI monitors inbound, triages replies, drafts responses
- **Otter.ai** — AI reads all call transcripts, extracts key points, routes to client brain

### What Claude does here:
- Identifies leads and categorises intent
- Manages all outbound sequences and follow-up cadences
- Triages all inbound replies across every channel
- Routes hot leads to Brock / Anthy for consultation booking
- Logs every interaction to Zoho and Notion automatically
- ⚠ HOOK/SYNC: bidirectional sync between all channels and Zoho + Notion

---

## LAYER 2 — CLIENT LIFECYCLE ENGINE
**Owner: Zoho CRM**

Zoho is the record of truth for where every client is in the lifecycle.
It holds pipeline stage, task status, project details, billing triggers, and automation rules.

### What Zoho owns:
- **Pipeline stages** — Lead → Consultation → Contract Sent → Active → Retention → Closed
- **Client records** — contact info, DIR #, contract dates, assigned consultant, project list
- **Task management** — every task created, assigned, and tracked (via automation, not humans)
- **Automation triggers** — contract signed → onboarding fires; closeout → referral sequence fires
- **Project records** — each public works project tied to a client record
- **Billing triggers** — monthly invoice events, retainer status, payment received flags
- **Referral tracking** — referring client, referred client, credit status
- **Partner records** — payroll firms, construction orgs, platform partners

### Zoho is NOT:
- A UI that consultants log into to complete tasks manually
- A place where humans update fields by hand
- A replacement for Notion as the knowledge layer

### Zoho integrates with:
- **QuickBooks** — billing events trigger invoice creation; payment received syncs back to Zoho
- **Dashboard** — task completion in dashboard writes back to Zoho automatically
- **Claude sync layer** — stage changes in Zoho fire downstream consequences automatically
- **Gmail** — all client email threads logged against Zoho client record
- ⚠ HOOK/API: Zoho → QuickBooks billing integration (Francis)
- ⚠ HOOK/SYNC: Zoho bidirectional sync with Dashboard + Notion

---

## LAYER 3 — BILLING
**Owner: QuickBooks**

QuickBooks handles all invoicing and payment processing.
It receives triggers from Zoho and reports payment status back.

### What QuickBooks owns:
- Monthly invoice generation (fired by Zoho trigger on the 1st of each month)
- Retainer invoices (fired by Zoho trigger on contract signed)
- Payment receipt and tracking
- Revenue reporting

### QuickBooks integrates with:
- **Zoho** — billing events flow from Zoho; payment received flows back
- ⚠ HOOK/API: QuickBooks ↔ Zoho billing automation (Francis)

---

## LAYER 4 — KNOWLEDGE BASE
**Two components working together**

### Google Drive — The Library
**Owner: Megan (primary curator)**

Drive stores all source documents. Nothing gets deleted from Drive.
It is the authoritative home for every document PW has ever created.

#### What lives in Drive:
- **Prevailing Wisdom SOP** — the master operations document
- **New Employee Training Materials** — onboarding curriculum
- **Compliance reference library** — by topic (SUB OVERSIGHT, IRA, LETF, SURGE, STATE REQUIREMENTS, etc.)
- **Client training materials** — webinars, guides, how-to docs
- **Scribe SOPs** — step-by-step visual workflow guides (created in Scribe, stored here)
- **Rate sheets and wage determinations** — by project/county
- **Templates** — CPR templates, estimate templates, proposal templates
- **Recorded webinars and training videos**

#### What Drive is NOT:
- A queryable knowledge base (it's too unstructured for fast AI retrieval)
- A task manager
- A client brain

### Notion — The Living Brain
**Owner: Claude (auto-updated) + Team (curated)**

Notion is the structured, queryable intelligence layer built on top of Drive content.
It does not duplicate Drive — it indexes, summarises, and cross-references it.
It also captures dynamic knowledge that doesn't belong in a static document.

#### What lives in Notion:
- **PW Knowledge Base** — structured answers to every compliance question, indexed by topic
  - Compliance Library (CA state PW, Davis-Bacon, SUB OVERSIGHT, IRA, LETF, etc.)
  - FAQ Bank (every question ever asked + PW's documented answer)
  - Tone & Voice Guide (how PW speaks, what PW's stances are)
  - Sales Call Insights (patterns from Otter consultation calls)
  - Decision Trees (classification questions, project type routing)
  - Links to authoritative Drive documents (not copies — pointers)
- **Customer Lifecycle** — the 6-stage lifecycle map (this project)
- **Client Brain pages** — one per client (dynamic, auto-updated)
  - Contact and relationship notes
  - Communication preferences
  - Project history
  - Key questions and concerns
  - Otter transcript extracts (auto-appended)
  - Gmail extracts (auto-appended)
  - Compliance history and issues
- **Operational playbooks** — stage-by-stage operational detail for each lifecycle stage

#### How Notion stays current automatically:
- Otter transcript → Claude extracts key points → appended to client Notion page
- Inbound client email → Claude extracts signals → appended to client Notion page
- New Drive document added → Claude indexes it into the Knowledge Base
- New FAQ answered by team → Claude documents it in the FAQ Bank
- ⚠ HOOK/SYNC: Otter → Notion auto-extraction pipeline
- ⚠ HOOK/SYNC: Gmail → Notion auto-extraction pipeline
- ⚠ HOOK/SYNC: Drive → Notion indexing pipeline

---

## LAYER 5 — SOP CREATION PIPELINE
**Scribe → Drive → Notion**

Scribe is not a storage tool. It is a creation tool.
It records your screen and auto-generates step-by-step visual SOPs with screenshots.
Drive cannot create SOPs — it can only store them.

### The SOP pipeline:
1. **Scribe** — team member records the workflow → Scribe auto-generates the visual SOP
2. **Google Drive** — SOP saved to the appropriate folder (e.g. New Employee Training Materials)
3. **Notion** — Claude indexes the new SOP into the Knowledge Base with a link back to Drive
4. **Wizard** — when a consultant asks "how do I do X?" the Wizard finds it in Notion and links to the Scribe SOP in Drive

### What Scribe owns:
- Visual step-by-step guides for every repeatable workflow
- Platform walkthroughs (LCPTracker, eComply, Elations, eMars, Zoho, QuickBooks)
- Onboarding procedures
- Client-facing training guides

---

## LAYER 6 — THE DASHBOARD + THE WIZARD OF PW
**Owner: Claude agent**

The Dashboard is not a traditional app with buttons and forms.
It is a Claude conversation interface — one window per client.

### What the Dashboard does:
- Shows each consultant their assigned clients with current stage, next action, flags
- Claude surfaces what's happening, what's due, what it already handled, what needs approval
- Consultant approves, redirects, or adds context
- Claude executes and syncs to every applicable system

### The Wizard of PW:
The Wizard is the same Claude agent, but answering knowledge questions.
It reads from the Notion Knowledge Base first — not the web.
Every answer is in PW's voice, based on PW's documented stances and experience.

**Example:**
> Consultant: "Client is asking if they need a DAS 142 for a painter who's also doing some drywall work."
> Wizard: Searches Notion FAQ Bank → finds Megan's documented answer on dual-classification → returns answer in PW's voice → cites the source document in Drive.

### What the Dashboard/Wizard connects to:
- **Notion** — client brain pages + Knowledge Base (primary read source)
- **Zoho** — client status, task completion, pipeline stage (read + write)
- **Gmail** — client email threads (read + write via AI)
- **Otter** — call transcripts (read)
- **Google Drive** — document retrieval (read)
- **QuickBooks** — billing status (read)
- **Francis agents** — document production and platform submission (call via hooks)

### Hook model:
When the Wizard needs to produce a document or submit to a platform:
> Claude (soft) → consultant approval → ⚠ HOOK/COMPEX → Compex executes (Francis's method) → completion signal → Claude syncs everywhere

Claude owns: detection, notification, approval, tracking start, tracking completion, follow-up, sync.
Compex owns: everything in between — the actual execution.
Francis defines: how Compex connects and operates (his preferred method, not prescribed by this system).

---

## SYNC PRINCIPLE
**Source of action does not matter. Everything syncs everywhere.**

Actions can originate from:
- The Dashboard (consultant approves something)
- Zoho directly (Brock closes a task)
- Gmail (client sends an email)
- Otter (a call is recorded)
- A phone call (manually logged)

In every case, the sync layer intercepts the action and propagates consequences
to every applicable system. Zoho stays in real-time sync with client status.
Notion client brain pages stay current with relationship context.
The Dashboard always reflects current truth.

⚠ HOOK/SYNC: The full sync layer is Phase 2 of the build plan.

---

## HOOK TAXONOMY

### ⚠ HOOK/COMPEX — Francis's domain, Compex is the execution engine
Format: ⚠ HOOK/COMPEX: `task_name` — what needs to happen · Claude triggers, tracks, and follows up · Compex executes · Francis defines the method (API, MCP, webhook, automation — his choice)

This is the primary hook type for all hard-side work:
- Document production (CPR, DAS forms, fringe benefit statements, CAC invoices, etc.)
- Platform submission (LCPTracker, eComply, Elations, eMars, DIR ECPR upload)
- Any downstream automation triggered by a compliance event

Claude's role at a HOOK/COMPEX:
1. Detect that the task needs to happen (from lifecycle stage, trigger event, or schedule)
2. Notify the consultant if approval is needed
3. Hand off to Compex
4. Track that Compex started the task
5. Track that Compex completed the task
6. Trigger the next downstream action (follow-up, status update, sync to Notion + Zoho)

Claude never builds what Compex does. Claude never approximates it.
Claude only manages the before (trigger + notify) and the after (track + follow-up).

### ⚠ HOOK/SYNC — requires the sync layer to be built first
Zoho ↔ Otter ↔ Gmail ↔ Notion ↔ Claude bidirectional sync.
Phase 2 work. Everything that says HOOK/SYNC is blocked until Phase 2 is complete.

### ⚠ HOOK/ZOHO — native Zoho automation (no Francis or Claude needed)
Simple Zoho workflow rules: field changes, stage transitions, date-based triggers.
These can be configured directly in Zoho without any custom development.

### ⚠ HOOK/CLAUDE — Claude handles this via MCP connection today
Claude can execute this directly using connected MCPs (Zoho, Notion, Gmail, Otter, Drive).
No Francis involvement needed. Can be built now.

---

## BUILD PHASES
**Phase 1 — Complete the lifecycle map** ← WE ARE HERE
Finish Stages 2-6 on the flowchart. Every touchpoint documented,
every hook named and typed, every Zoho field identified,
Notion client brain structure defined.

**Phase 2 — Build the sync layer**
Zoho ↔ Otter ↔ Gmail ↔ Notion ↔ Claude
This is the nervous system. Everything else depends on it.

**Phase 3 — Build the Knowledge Base**
Read and index Drive content into Notion.
Extract FAQ Bank from Otter consultation calls.
Build the Wizard of PW on top of the structured Knowledge Base.

**Phase 4 — Hook up Francis workflows one at a time**
CPR production first → DAS forms → CAC invoices → rest in priority order.

**Phase 5 — Build the Dashboard**
Claude conversation interface per client.
Connected to everything. The Wizard lives here.

---

## TOOL SUMMARY TABLE

| Tool | Role | Owner | Phase |
|------|------|-------|-------|
| Claude | AI layer, Wizard, orchestration | Brock | All phases |
| Zoho CRM | Task + status engine, pipeline | Brock / automation | Phase 1+ |
| QuickBooks | Billing + invoicing | Rachel | Phase 2 |
| Google Drive | Document library | Megan | Now |
| Notion | Living brain, client pages, KB | Claude + team | Phase 3 |
| Scribe | SOP creation | Team | Phase 3 |
| Otter.ai | Call transcription | All | Now |
| Gmail | Client email | All | Phase 2 |
| B2B Rocket | Cold outreach sequences | Claude / Brock | Phase 1 |
| Facebook/Instagram | Social media + paid | Claude / Brock | Phase 1 |
| LinkedIn | B2B social + outreach | Claude / Brock | Phase 1 |
| Google Ads | Paid search + SEO | Claude / Francis | Phase 1 |
| Scribe | Visual SOP creation | Megan / team | Phase 3 |
| Dashboard | Consultant interface + Wizard | Claude (to build) | Phase 5 |
| Compex (Francis) | All hard-side execution — doc production, platform submission, downstream automation | Francis | Phase 4 |

---

## KEY DECISIONS LOCKED IN

1. Google Drive = library (stores documents, never replaced)
2. Notion = living brain (structured knowledge, auto-updated by Claude)
3. Scribe creates SOPs → Drive stores them → Notion indexes them
4. Zoho = task and status engine (updated by automation, not humans)
5. QuickBooks = billing layer (triggered by Zoho, reports back)
6. Dashboard = Claude conversation interface, not a traditional app
7. The Wizard of PW = same Claude agent as the Dashboard, reads Notion first
8. Sync layer is bidirectional — source of action does not matter
9. Hard side (Francis / Compex) = all document production, platform submission, and downstream automation. Hook format: ⚠ HOOK/COMPEX. Francis defines the execution method.
10. Soft side (Claude + Brock) = all customer interaction + relationship management
