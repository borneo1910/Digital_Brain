## Handoff — 2026-03-05 — Claude Code (Opus 4.6)

### What we accomplished
- Refactored entire site UI to be video-first (video player hero, drawings collapsed)
- Adopted Claude Code Protocol: DEBUG.md, DECISIONS.md, CHANGES.md, ROADMAP.md
- Slimmed CLAUDE.md to lean pointers-and-instructions format
- Created comprehensive ROADMAP.md with development priorities
- Made project 1 (Harper's Big Chance) public for browser testing
- Set up Digital Brain sync for this project

### Where we stopped
- Video-first UI is live and deployed
- All protocol docs in place
- ROADMAP.md documents the full development path forward
- Site accessible at http://188.34.184.98 and https://everythingsastory.clodhost.com

### What to do next (in priority order)
1. **Wire up animator.js** — Replace old SDXL+SVD flow with working SeDream + video-01-live pattern from run-harper-test.js. This makes the "Generate Animation" button on the edit page actually work with the proven pipeline.
2. **Video re-generation** — Allow re-running pipeline on existing projects
3. **Story input improvements** — AI-assisted story expansion, scene preview before spending money
4. **Audio/narration** — TTS voiceover synced with video scenes
5. **Monetization** — Stripe integration, pricing tiers, credit system
6. See ROADMAP.md for full details

### Gotchas / things to know
- Node 18: `uuid` is ESM-only, use `crypto.randomUUID()`
- Replicate returns FileOutput objects, not strings — use `.toString()`
- SeDream `image_input` MUST be an array, not a string
- DNS managed by clodhost via Cloudflare — direct IP (188.34.184.98) works as fallback
- `animator.js` still uses OLD pipeline (SDXL/SVD) — the WORKING flow is in `run-harper-test.js`
- Project 1 was private (now set to public) — this caused confusion when trying to view without login

### Files touched this session
- `views/project-view.ejs` — video hero, collapsible drawings
- `views/dashboard.ejs` — video status badges
- `views/explore.ejs` — play overlays, updated copy
- `views/home.ejs` — play overlays, video-focused copy
- `server.js` — added video_count to home query
- `public/css/style.css` — video hero, play overlay, source materials styles
- `CLAUDE.md` — slimmed to lean format
- `DEBUG.md`, `DECISIONS.md`, `CHANGES.md`, `ROADMAP.md` — new protocol docs

### Open questions raised this session
- Should animator.js be fully rewritten or refactored incrementally?
- Pricing strategy beyond 5x markup?
- Which TTS model for kid-friendly narration?
- Should we add background music to videos?
