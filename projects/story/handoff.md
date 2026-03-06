## Handoff — 2026-03-06 (session 2) — Claude Code (Opus 4.6)

### What we accomplished
- **Keyframe regen bugfixes:** Fixed network timeout (added 2-min AbortSignal) and lightbox showing stale images after regen (now updates kfData array)
- **Storyboard UI:** Redesigned keyframe review as a landscape storyboard paper layout — white paper with ruled lines, 4-col grid, scene numbers, click-to-lightbox
- **Storyboard-first edit page:** When keyframes exist, 2-column layout: storyboard (65% left, sticky) + collapsible sidebar (35% right) with Story Details, Drawings, Generate. Storyboard is the main focus.
- **Collapsible sections:** Story Details and Drawings panels collapse/expand with toggle arrows. Auto-collapsed when storyboard exists.
- **Moondream2 for character description:** Replaced Gemini Flash with Moondream2 (much better at isolating character from scene)
- **Video model A/B test:** Ran Gen-4.5 vs p-video vs video-01-live on scene 7. Gen-4.5 failed (base64 too large). p-video fast (16s) but user preferred video-01-live motion quality.
- **A/B test script:** `pipeline/test-video-models.js` — runs all 3 models in parallel on a keyframe

### Where we stopped
- Storyboard layout deployed and working
- Video model decision deferred — user is thinking about it
- Currently on video-01-live for animation
- Gen-4.5 needs fix to use URL instead of base64 for image input

### What to do next (in priority order)
1. **Fix Gen-4.5 test** — host image as URL instead of base64 to avoid E006 error, re-run comparison
2. **Video model decision** — user comparing video-01-live vs p-video quality
3. **Phase 1 stabilization** (SCALABILITY.md) — SQLite sessions, job queue, PM2, rate limiting
4. **Audio/narration** — TTS voiceover for videos
5. **Monetization** — Stripe integration (user wants transparent, no-upsell pricing — not locked in yet)
6. See ROADMAP.md for full priority list

### Gotchas / things to know
- `step0-analyze-drawing.js` now uses Moondream2, NOT Gemini Flash
- Gen-4.5 rejects large base64 data URIs (7-8MB PNGs) with E006 error — needs URL hosting
- video-01-live is current default in animator.js (`VIDEO_MODEL = 'minimax/video-01-live'`)
- p-video at $0.10 is 10x faster than video-01-live but motion quality TBD
- Storyboard layout uses `editor-layout.has-storyboard` CSS class for 65/35 grid
- Collapsible sections use `toggleSection()` JS + `.collapsed` class on toggle icon
- Cache-bust on CSS: `?v=20260306d` in header.ejs
- A/B test results at: `uploads/pipeline/video_test_1772786848455/`

### Files touched this session
- `views/project-edit.ejs` — storyboard layout, collapsible sections, regen bugfixes, tweak panel
- `public/css/style.css` — storyboard paper styles, editor-layout grid, collapsible section styles
- `views/partials/header.ejs` — cache-bust version updates
- `pipeline/step0-analyze-drawing.js` — Moondream2 integration (from prior session)
- `pipeline/test-video-models.js` — A/B comparison script
- `CHANGES.md`, `DEBUG.md`, `DECISIONS.md` — updated
