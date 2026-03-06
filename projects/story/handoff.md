## Handoff — 2026-03-06 — Claude Code (Opus 4.6)

### What we accomplished
- **Character consistency fix:** Root cause was SeDream prompts not describing the character. Added Gemini Flash vision analysis to auto-detect character appearance from drawing. Description gets baked into every prompt (matching the proven Harper test pattern).
- **Video model upgrade:** Replaced minimax/video-01-live ($0.10/clip) with Runway Gen-4.5 ($0.50/clip) for significantly better quality
- **Two-phase pipeline:** Phase 1 generates keyframes (cheap), user reviews and tweaks, Phase 2 animates (expensive). Prevents wasting money on bad keyframes.
- **Individual keyframe regeneration:** Users can tweak a single scene with custom prompts (e.g. "no blue on face, wearing a red dress")
- **OCR for handwritten stories:** Upload photos of handwritten pages, Gemini Flash transcribes, parent proofs the text
- **Scalability plan:** Comprehensive 6-phase plan from current single-server to production-ready infrastructure (SCALABILITY.md)
- **Regenerate button:** Owners can re-generate videos from project view page

### Where we stopped
- All code committed and pushed (commit 8c73581)
- User is testing the generation pipeline right now
- Service is running and active

### What to do next (in priority order)
1. **Evaluate Gen-4.5 output quality** — user is testing now, may need model tuning
2. **Phase 1 stabilization** (SCALABILITY.md) — SQLite sessions, SQLite job queue, PM2, rate limiting, EXIF stripping (~9 hours)
3. **Audio/narration** — TTS voiceover for videos
4. **Monetization** — Stripe integration, pricing model (user explicitly wants transparent, no-upsell pricing)
5. **Story input UX** — AI-assisted story expansion, scene preview before generation
6. See ROADMAP.md for full priority list

### Gotchas / things to know
- Gen-4.5 API uses `image` (not `first_frame_image`) and doesn't have `prompt_optimizer`
- Gen-4.5 costs 5x more than video-01-live — 5-scene project is ~$2.69 API cost
- Gemini Flash on Replicate: `images` param is an array of URIs
- `character_description` column added via migration in database.js (runs on startup)
- Two-phase pipeline: project status goes draft -> processing -> review -> processing -> animated
- The `parseStoryScenes()` function now takes `characterDescription` as second arg
- User does NOT want to lock in pricing yet — keep pricing display informational only
- User wants pricing to be transparent, no hidden fees, no upsell patterns

### Files touched this session
- `pipeline/step0-analyze-drawing.js` — NEW: Gemini Flash vision analysis + OCR
- `pipeline/animator.js` — Gen 3 rewrite: vision step, Gen-4.5, two-phase, character desc in prompts
- `pipeline/replicate-client.js` — updated costs for Gen-4.5
- `models/database.js` — keyframes table, character_description migration
- `routes/projects.js` — analyze-drawing, ocr-story, generate-keyframes, animate-keyframes, keyframe regen routes
- `views/project-edit.ejs` — keyframe review UI, OCR upload, character description field, two-phase options
- `views/project-view.ejs` — regenerate video button
- `public/css/style.css` — keyframe grid, generate options, cost summary styles
- `SCALABILITY.md` — NEW: 6-phase infrastructure scaling plan
- `CHANGES.md`, `DECISIONS.md`, `ROADMAP.md`, `CLAUDE.md` — updated
