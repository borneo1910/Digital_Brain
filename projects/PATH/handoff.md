# PATH — Practice, Attunement, Tools, Habits

> Communication skills training app. Three modules: DEI (intimate partner), Neurodivergent Parenting, RULER Emotional Intelligence. AI-coached deliberate practice — like Duolingo for relational skills, grounded in peer-reviewed clinical frameworks.

---

## Concept

PATH is a mobile-first communication skills training app. Three modules:

- **Module 1: DEI** — Dialogue of Emotional Intimacy. Intimate partner communication using DEI, Gottman, NVC, and Attachment Theory frameworks.
- **Module 2: Neurodivergent Parenting** — Parent-child communication using Greene CPS, Siegel Whole-Brain, Porges Polyvagal, and Lagging Skills Model. PDA-calibrated.
- **Module 3: RULER Emotional Intelligence** — Yale Center for Emotional Intelligence framework. Self-awareness, conflict, supporting others, repair. Mood Meter, Meta-Moment, Blueprint tools.

Core thesis: the problem is not knowledge, it is transfer. PATH builds embodiment through deliberate practice and real-time AI coaching.

---

## Status — 2026-03-13

**Phase:** Fully built and deployed at path.clodhost.com

### What's been built
- Complete single-file React app (no build step, CDN React + Babel)
- **Module 1**: 50 scenarios (wife/partner, child, friend). 4-framework coaching (DEI, Gottman, NVC, Attachment)
- **Module 2**: 40 scenarios (morning, escalation, limit, repair). 4-framework coaching (Greene CPS, Siegel, Porges, Lagging Skills/PDA)
- **Module 3**: 40 scenarios (self-awareness, conflict, support, repair) + 20 Mood Meter practice scenarios. RULER + Mood Meter + Meta-Moment + Blueprint coaching
- **Three-tier progression**: Tier 1 (isolated skill), Tier 2 (multi-framework), Tier 3 (multi-turn conversation)
- **Pre-session regulation check**: 1-10 activation scale, 4-7-8 breathing for score >= 7
- **Tier 3 multi-turn**: AI plays partner/child/inner experience dynamically, arc coaching after 4-8 turns
- **Mood Meter practice section**: 20 emotional vignettes, Brackett's 2×2 grid placement (quadrant → word → describe → deepen), dedicated coaching prompt
- **Modern card-based UI**: pill chips, step nodes, progressive disclosure, white cards with accent borders
- **ElevenLabs TTS** (8 voices) + Web Speech API fallback
- **Crisis detection** with 988 lifeline + clinical guardrails in all prompts
- **Cheat sheets** for all three modules
- Anthropic API (claude-opus-4-6) direct browser calls
- GitHub Pages hosting via index.html redirect

### Infrastructure
- Apache SSL at path.clodhost.com (Cloudflare Full SSL, self-signed origin cert)
- Deployed at /var/www/path.clodhost.com/public/index.html
- Also available via GitHub Pages
- No database — localStorage for API keys, in-memory session state

---

## Handoff — 2026-03-13 (session 5) — Claude Code (path.clodhost.com)

### What we accomplished
- **Server-side API proxy** — browser direct-to-Anthropic calls were failing ("Load failed" / CORS). Built Python proxy:
  - `proxy.py` on port 8977, runs as systemd service `path-proxy`
  - Apache reverse proxy: `/api/messages` → `http://127.0.0.1:8977/`
  - API key lives server-side only — no longer exposed in browser source
  - Removed `anthropic-dangerous-allow-browser` header and direct API key usage from frontend
- **Hardcoded API keys** for testing — Anthropic key in `proxy.py`, ElevenLabs key in `app/path.html`
- **CLAUDE.md updated** — added proxy documentation, bold warning about hardcoded keys
- All previous session work: Mood Meter practice (20 scenarios), modal flashing fix, major UI redesign (cards, pills, step nodes), centering fix

### Where we stopped
- All three modules fully functional across all three tiers
- API calls working through server-side proxy
- **⚠️ API KEYS ARE HARDCODED** — must remove before sharing publicly
- DEV_MODE = true — must disable before production
- App deployed and live at path.clodhost.com

### What to do next
1. **Remove hardcoded API keys** before sharing — restore localStorage key entry UI
2. **Session persistence** — localStorage for tier progress across browser sessions
3. **Set DEV_MODE = false** before production release
4. **Mobile testing** — verify touch/voice on iOS/Android
5. **Clinical review** — have clinician test coaching output quality

### Gotchas
- **API keys hardcoded** — Anthropic in `proxy.py`, ElevenLabs in `app/path.html`. REMOVE BEFORE SHARING.
- Two Claude instances working on this repo — always pull before building
- The other instance force-pushed once, overwriting a commit — coordinate carefully
- Tier unlock state is in-memory only — refreshing resets progress
- DEV_MODE is currently `true` — remember to disable before production
- DEV_MODE is currently `true` — remember to disable before production
