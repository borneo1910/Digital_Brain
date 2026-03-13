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
- **Module 3**: 40 scenarios (self-awareness, conflict, support, repair). RULER + Mood Meter + Meta-Moment + Blueprint coaching
- **Three-tier progression**: Tier 1 (isolated skill), Tier 2 (multi-framework), Tier 3 (multi-turn conversation)
- **Pre-session regulation check**: 1-10 activation scale, 4-7-8 breathing for score >= 7
- **Tier 3 multi-turn**: AI plays partner/child/inner experience dynamically, arc coaching after 4-8 turns
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

## Handoff — 2026-03-13 (session 2) — Claude Code (path.clodhost.com)

### What we accomplished
- **Brackett's Mood Meter** added to Module 3 (RULER) — replaces regulation check with framework-aligned emotional vocabulary tool
  - 4 quadrants (Red/Yellow/Blue/Green) × 20 feeling words each
  - 4-phase flow: quadrant selection → word picker → describe feeling → vocabulary deepening
  - Pre-scenario and post-scenario check-ins with mood shift comparison
  - Mood context injected into coaching API for vocabulary precision evaluation
- **DEV_MODE flag** — `const DEV_MODE = true;` bypasses tier unlock requirements during development
- Deployed to path.clodhost.com and pushed to GitHub (commit `c3edd33`)

### Where we stopped
- All three modules fully functional across all three tiers
- Mood Meter integrated into Module 3 flow
- DEV_MODE unlocking all tiers for testing
- App deployed and live

### What to do next
1. **Test Mood Meter flow** — run through Module 3 with real API keys, verify pre/post mood check-in works
2. **CLAUDE.md update** — mark items 6-10 as complete, add Module 3 + Mood Meter docs
3. **Session persistence** — localStorage for tier progress across browser sessions
4. **Set DEV_MODE = false** before production release
5. **Mobile testing** — verify touch/voice on iOS/Android
6. **Clinical review** — have clinician test coaching output quality

### Gotchas
- Two Claude instances working on this repo — always pull before building
- The other instance force-pushed once, overwriting a commit — coordinate carefully
- Tier unlock state is in-memory only — refreshing resets progress
- DEV_MODE is currently `true` — remember to disable before production
