## Handoff — 2026-03-20 — Claude Code (Opus 4.6)

### What we accomplished

#### Script Mode — New Project Type
Added a full "Script / Screenplay" project type alongside the existing storybook workflow:

**New files:**
- `pipeline/script-parser.js` — Fountain/plaintext screenplay parser. Extracts scenes (heading, INT/EXT, location, time of day, description), dialogue (character, line, parenthetical), characters, mood auto-detection, duration estimation. Also generates shot lists via Llama 3 LLM.
- `pipeline/script-narration.js` — Multi-character dialogue TTS. Per-character OpenAI voice assignment (nova/shimmer/alloy/echo/fable/onyx) with emotion mapping from parentheticals (whispering, angry, sad, etc.). Generates per-line audio and concatenates per-scene.
- `pipeline/script-animator.js` — Script mode pipeline orchestrator. Phase 1: SeDream keyframes per shot with multi-character reference images. Phase 2: Video animation (configurable model) + multi-char TTS + Lyria-2 music + ffmpeg composition.

**Database changes (models/database.js):**
- `projects.project_type` — 'storybook' (default) or 'script'
- `projects.video_model` — which Replicate model for video gen (default: minimax/video-01-live)
- `projects.script_text` — raw screenplay text
- `projects.script_parsed` — JSON of parsed screenplay structure
- `script_characters` table — multi-character management (name, description, visual_traits, reference_image_path, voice_id, voice_emotion)
- `script_shots` table — per-scene shots (shot_size, camera_angle, camera_movement, subject, action, dialogue_excerpt, duration, mood, keyframe_id)

**Routes added (routes/projects.js):**
- `POST /projects/:id/script/upload` — Upload + parse screenplay
- `POST /projects/:id/script/generate-shots` — LLM shot list generation
- `POST /projects/:id/script/shots/:shotId/update` — Edit shot details
- `GET/POST /projects/:id/script/characters/*` — Character CRUD + voice settings
- `POST /projects/:id/script/characters/:charId/reference` — Upload reference image
- `GET /projects/:id/script/voice-preview` — Per-character TTS preview
- `POST /projects/:id/script/generate-keyframes` — Phase 1: SeDream per shot
- `POST /projects/:id/script/animate` — Phase 2: animate + TTS + music

**Frontend (views/project-edit.ejs):**
- Conditional rendering: `project_type === 'script'` shows entirely different UI
- Script upload + parse area
- Multi-character panel with ref image upload, voice/emotion dropdowns, preview button
- Scene/shot list display
- Video model selector (video-01-live, Wan 2.1, Kling 2.0)
- Generate keyframes + Animate with Dialogue buttons
- Job progress polling

**Project creation (views/project-new.ejs):**
- New "Project Type" selector: Storybook/Drawing vs Script/Screenplay
- Animation style options only show for storybook mode

**Also:**
- Exported `updateJobStatus` from `pipeline/animator.js` for use by script-animator.js
- Created `uploads/characters/` and `uploads/scripts/` directories

### Where we stopped
- All code committed, pushed, service restarted and running
- Script mode UI renders and routes are wired up
- NOT yet user-tested with an actual screenplay (no test run performed)

### What to do next
1. **Test script upload** — Paste a short screenplay, verify parsing extracts scenes/characters/dialogue correctly
2. **Test character voice preview** — Assign voices, click preview, verify audio plays
3. **Test shot list generation** — Verify LLM generates reasonable shots from scenes
4. **Test keyframe generation** — Upload character ref images, generate keyframes, check consistency
5. **Test full animation** — Run Phase 2, verify multi-character TTS + music + video compose
6. **Lip sync** — SadTalker integration is designed but NOT yet implemented (was in plan)
7. **Shot detail editing UI** — Basic display exists but no inline edit fields yet
8. **CSS** — Script mode uses inline styles; should be moved to style.css
9. **PDF parsing** — Currently only plaintext/Fountain; PDF screenplay parsing not implemented

### Gotchas
- Script mode is gated on `project_type === 'script'` — storybook projects are completely unaffected
- `script_parsed` stores the full parsed structure as JSON in the projects table
- Characters auto-created from script parsing; user can then assign voices/images
- The `require('path')` call in project-edit.ejs template works because Express passes `require` to EJS
- video_model column defaults to 'minimax/video-01-live' — other models may have different input schemas
- Premersive (separate Flask app) also got audio pipeline code in a prior commit — that's unrelated to EaS

### Files touched this session
- `models/database.js` — New columns + tables for script mode
- `pipeline/animator.js` — Export updateJobStatus
- `pipeline/script-parser.js` — NEW: screenplay parser
- `pipeline/script-narration.js` — NEW: multi-character TTS
- `pipeline/script-animator.js` — NEW: script animation pipeline
- `routes/projects.js` — Script mode routes + character CRUD
- `views/project-edit.ejs` — Script mode conditional UI
- `views/project-new.ejs` — Project type selector
