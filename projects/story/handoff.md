## Handoff — 2026-03-05 — Claude Code (Opus 4.6)

### What we accomplished
- Rewrote `pipeline/animator.js` to use proven SeDream + video-01-live flow
- Removed old SDXL/SVD/FILM pipeline code from animator
- Pipeline: rembg extract -> SeDream frame per scene -> video-01-live animate -> ffmpeg compose
- Added rich scene parsing with 11 pose/emotion categories + generic fallback
- Updated `pipeline/replicate-client.js` cost estimates to match actual pipeline
- Removed LoRA checkbox from edit page (not needed with SeDream)
- Updated cost breakdown labels in edit page
- Module loading verified, cost estimate verified ($0.685 for 5 scenes)
- Added StoryTube kid-safe gallery to ROADMAP.md (Priority 7)
- Complete "Warm Paper Studio" design revamp (previous in session)

### Where we stopped
- Pipeline is wired up and code-verified but NOT yet tested with real Replicate API calls
- All changes committed and pushed (commit 0c277c6)
- Service restarted and running

### What to do next (in priority order)
1. **Test pipeline end-to-end** — run "Generate Animation" on a project (~$0.70 in Replicate credits)
2. **Video re-generation** — allow re-running pipeline on existing projects
3. **Audio/narration** — TTS voiceover for videos
4. **Story input improvements** — AI-assisted story expansion, scene preview
5. **Monetization** — Stripe, pricing tiers
6. See ROADMAP.md for full details (Priorities 1-7)

### Gotchas / things to know
- Node 18: use `crypto.randomUUID()` not uuid package
- Replicate FileOutput: use `.toString()` for URLs
- SeDream `image_input` MUST be array
- `animator.js` NOW uses the correct pipeline (was old SDXL flow, fixed this session)
- Project 1 is public for testing
- Design uses Nunito weight 800 (check header.ejs if fonts look wrong)
- Pipeline runs async from POST /projects/:id/animate, polls via /projects/:id/job-status

### Files touched this session
- `pipeline/animator.js` — complete rewrite (SeDream + video-01-live)
- `pipeline/replicate-client.js` — updated cost model
- `views/project-edit.ejs` — removed LoRA, updated labels
- `CHANGES.md`, `ROADMAP.md` — updated
