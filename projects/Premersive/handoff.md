# Premersive

> Immersive storyboarding and previsualization tool. Script-to-video generator for immersive/spatial filmmaking.

---

## Status — 2026-03-20

**Phase:** Audio pipeline implementation
**Repo:** github.com/borneo1910/Premersive
**Deploy:** /var/www/premersive.clodhost.com/

### Architecture
- Flask/SQLAlchemy/PostgreSQL + Celery/Redis
- Replicate API (Flux models for images, Flux Kontext for character consistency)
- OpenAI gpt-4o-mini-tts for dialogue TTS
- SadTalker (Replicate) for lip sync
- Lyria-2 (Replicate) for background music
- FFmpeg for video encoding/audio mixing
- Vanilla JS SPA frontend

### What exists (fully working)
- Screenplay parsing (Fountain/PDF/FDX/plaintext)
- AI shot list generation from scenes
- Character management with AI reference images
- 180° SBS stereoscopic video generation for Apple Vision Pro
- Procedural + AI (Flux) frame rendering
- MV-HEVC spatial video encoding
- Full video pipeline: script → scenes → shots → frames → video

### What was added this session (2026-03-20)
- **Character voice fields** — `voice_id` (nova/shimmer/alloy/echo/fable/onyx) and `voice_emotion` on Character model + Alembic migration
- **TTS generator service** (`services/tts_generator.py`) — per-line OpenAI gpt-4o-mini-tts with emotion mapping from parentheticals, per-scene audio concat
- **Lip sync service** (`services/lipsync_generator.py`) — SadTalker on Replicate, takes reference image + audio → lip-synced video
- **Music generator service** (`services/music_generator.py`) — Lyria-2 on Replicate, mood-grouped consecutive scenes → background tracks
- **Audio routes** (`routes/audio.py`) — voice preview, TTS-only generation, full audio+video pipeline endpoint
- **Frontend Characters tab** — voice dropdown + emotion selector per character, preview button plays TTS sample
- **Generate tab** — "Generate with Audio" button with checkboxes for TTS/music/lip sync options
- **Audio merging** — ffmpeg amix integration: dialogue + music mixed onto video per scene

### What to do next
1. **Run Alembic migration** — `flask db upgrade` to add voice_id/voice_emotion columns
2. **Install openai package** — `pip install openai` in the deployment environment
3. **Set OPENAI_API_KEY** — needed for TTS generation
4. **Test voice preview** — assign voices to characters, preview each
5. **Test full audio pipeline** — Generate with Audio on a short script
6. **Lip sync quality** — SadTalker may need tuning (expression_scale, preprocess mode)
7. **Audio duration sync** — if dialogue audio is longer than shot video duration, may need to extend shots or adjust pacing
8. **Per-character audio isolation** — currently generates per-scene mixed dialogue; future: split per-character for lip sync per speaker

### Gotchas
- Migration file is `a1b2c3d4e5f6_add_voice_fields_to_characters.py` — must run before app restart
- No requirements.txt exists — packages managed manually in deployment
- `.env` file loaded from `app/` directory — add OPENAI_API_KEY there
- The audio pipeline thread uses the same VideoJob model for progress tracking
- Lip sync only runs on primary speaker per scene (most dialogue lines) — multi-speaker lip sync is future work
