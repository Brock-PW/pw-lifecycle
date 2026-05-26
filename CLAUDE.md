# Prevailing Wisdom — pw-lifecycle CLAUDE.md

## What this repo is
Single-file HTML flowchart (index.html) for the Prevailing Wisdom customer lifecycle.
Live site: https://spectacular-lamington-e7c676.netlify.app
Netlify auto-deploys on every push to main branch — no build step needed.

## The team
- Brock McCormick — owner, strategy, lead sales & marketing
- Anthy — account manager, compliance, sales
- Rachel — owner, billing, compliance
- Francis — strategy, owner, lead technical partner
- Megan — owner, lead industry expert, strategy

## Key external links
- Notion lifecycle page: https://notion.so/35e2e7f35b1f812d8e7cec432f027512
- Notion Stage 1 sub-page: https://notion.so/35e2e7f35b1f81469208cb4c1865995b
- GitHub repo: https://github.com/Brock-PW/pw-lifecycle
- Live site: https://spectacular-lamington-e7c676.netlify.app

## The standard update workflow
When Brock or the team updates the flowchart in the Claude.ai chat:
1. A new index.html is produced in that chat and downloaded
2. That file gets dropped into this repo folder (replacing the existing index.html)
3. Claude Code is told: "push the updated index.html to main"
4. Claude Code runs: git add index.html, git commit, git push origin main
5. Netlify deploys automatically within ~60 seconds

## Git commit message format
Use this format: "Stage X updated — [brief description] (vX.X)"
Example: "Stage 1 updated — 5 lead source workflows rebuilt (v2.0)"

## What never changes
- File structure: always a single index.html, no dependencies, no build process
- The SVG viewBox is currently 0 0 900 3420
- Node color system: purple=AI, green=human, red/orange=client, amber=trigger, grey=decision
- All clickable panels use id format: n-[nodeid] for SVG node, [nodeid] for panel div

## Domain glossary
- DIR: California Department of Industrial Relations
- PWCR: Public Works Contractor Registration
- CPR: Certified Payroll Report
- ECPR: Electronic CPR (uploaded to CA DIR website)
- DAS 140/142: Apprentice notification forms
- CAC: California Apprenticeship Council (training contribution invoices)
- Fringe benefit statement: document declaring where fringe benefits are paid
- LCPTracker / eComply / Elations / eMars / Prism: CPR submission platforms used by various agencies

## Lifecycle stages
1. Lead Generation — 5 sources: DIR website, B2B Rocket, Social Media, Google Ads, Referrals
2. Consultation & Close — inbound inquiry → consult → price flyer → contract
3. Onboarding — project info form → scope review → DAS 140 → fringe statement
4. Active Project Loop — weekly CPR → ECPR upload → DAS 142 → monthly CAC invoice
5. Retention — gone-cold checks, compliance risk nudges, anniversary emails
6. Stagnant Client Recovery — re-engagement campaigns for dormant clients

## Current version
index.html is v2.0 — last updated May 26, 2026
