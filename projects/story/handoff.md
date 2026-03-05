## Handoff — 2026-03-05 — Claude Code (Opus 4.6)

### What we accomplished
- Refactored entire site UI to be video-first instead of drawing slideshow
- Video player is now hero content on project view page
- Drawings demoted to collapsible "Original Drawings" section
- Dashboard cards show video status badges (Video Ready / Generating...)
- Explore and home pages show play overlays on video-ready project cards
- Home page copy updated to emphasize video output
- Adopted Claude Code Protocol: created DEBUG.md, DECISIONS.md, CHANGES.md
- Slimmed CLAUDE.md to lean pointers-and-instructions format
- Set up Digital Brain sync for this project

### Where we stopped
- Video-first UI refactor is complete and deployed
- Service is running and serving the updated views
- Previous session completed: full pipeline test (Harper's Big Chance - 5 scenes, 28s, $0.675)

### What to do next
1. Test the video-first UI in browser at http://188.34.184.98/projects/1
2. Wire up the production animation pipeline (animator.js currently uses old SDXL/SVD flow, needs updating to match run-harper-test.js which uses SeDream + video-01-live)
3. Add video re-generation capability (allow re-running pipeline on existing projects)
4. Consider adding narration/voiceover (TTS) to the video pipeline
5. Pricing/billing system for end users

### Gotchas / things to know
- Node 18: `uuid` is ESM-only, use `crypto.randomUUID()`
- Replicate returns FileOutput objects, not strings — use `.toString()`
- SeDream `image_input` MUST be an array, not a string
- DNS is managed by clodhost via Cloudflare — direct IP access works as fallback
- The `animator.js` orchestrator still references old pipeline steps — needs updating to match the working `run-harper-test.js` flow

### Files touched
- `views/project-view.ejs` — video hero, collapsible drawings
- `views/dashboard.ejs` — video status badges
- `views/explore.ejs` — play overlays, updated copy
- `views/home.ejs` — play overlays, video-focused copy
- `server.js` — added video_count to home query
- `public/css/style.css` — video hero, play overlay, source materials styles
- `CLAUDE.md` — slimmed to lean format with doc references
- `DEBUG.md` — new, known issues and environment notes
- `DECISIONS.md` — new, architecture choices
- `CHANGES.md` — new, session changelog

### Open questions raised this session
- Should animator.js be fully rewritten to use the run-harper-test.js pattern, or refactored incrementally?
- What's the plan for pricing/billing beyond the 5x markup?
- Should we add audio/narration to the video pipeline?
