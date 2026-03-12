# PATH — Practice, Attunement, Tools, Habits

> Communication skills training app. Two modules: DEI (intimate partner communication) and Neurodivergent Parenting. AI-coached deliberate practice — like Duolingo for relational skills, grounded in peer-reviewed clinical frameworks.

---

## Concept

PATH is a mobile-first communication skills training app. Two modules currently in scope:

- **Module 1: DEI** — Dialogue of Emotional Intimacy. Intimate partner communication using DEI, Gottman, NVC, and Attachment Theory frameworks.
- **Module 2: Neurodivergent Parenting** — Parent-child communication using Greene CPS, Siegel Whole-Brain, Porges Polyvagal, and Lagging Skills Model. PDA-calibrated.

Core thesis: the problem is not knowledge, it is transfer. Users know the frameworks but cannot access them under pressure. PATH builds embodiment through deliberate practice and real-time AI coaching.

---

## Status — 2026-03-12

**Phase:** Fully built and deployed at path.clodhost.com

### What's been built
- Complete single-file React app (no build step, CDN React + Babel)
- **Module 1**: 50 scenarios across wife/partner, child, friend contexts. Full 4-framework coaching (DEI, Gottman, NVC, Attachment)
- **Module 2**: 40 scenarios across morning, escalation, limit, repair contexts. Full 4-framework coaching (Greene CPS, Siegel, Porges, Lagging Skills/PDA)
- **Three-tier progression system**: Tier 1 (isolated skill), Tier 2 (multi-framework integration), Tier 3 (multi-turn AI conversation)
- **Pre-session regulation check**: 1-10 activation scale, 4-7-8 breathing for score >= 7
- **Tier 3 multi-turn mode**: AI plays partner/child dynamically, arc coaching after 4-8 turns
- **ElevenLabs TTS** with 8 voice options + Web Speech API fallback
- **Web Speech API** for voice input
- **Crisis detection guardrail** with 988 lifeline
- **Clinical guardrails** in both coaching prompts
- **Cheat sheets** for both modules with full framework reference content
- Anthropic API (claude-opus-4-6) direct browser calls
- Warm, calm visual design: #f5f0e8 paper, Playfair Display + DM Sans + DM Mono

### Infrastructure
- Apache SSL at path.clodhost.com (Cloudflare Full SSL, self-signed origin cert)
- Single HTML file deployment at /var/www/path.clodhost.com/public/index.html
- No database needed — localStorage for API keys, in-memory session state

---

## Handoff — 2026-03-12 — Claude Code (path.clodhost.com)

### What we accomplished
- Set up Apache SSL virtual host for path.clodhost.com
- Built complete app with all features from CLAUDE.md and framework documents
- Three-tier progression with unlock logic
- Pre-session regulation check with grounding exercise
- Tier 3 multi-turn conversation mode with AI-as-partner
- Crisis detection and clinical guardrails
- Committed and pushed to borneo1910/PATH repo

### Where we stopped
- App is fully deployed and functional
- All features from the technical handoff brief are implemented

### What to do next
1. **Test with real API keys** — enter Anthropic and ElevenLabs keys and run through scenarios
2. **Clinical review** — have a clinician test coaching output quality across all tiers
3. **Polish Tier 3** — tune the AI-as-partner prompts based on real conversation testing
4. **Session persistence** — consider adding localStorage for tier progress across browser sessions
5. **Mobile testing** — verify touch interactions and voice input on iOS/Android
6. **Consider backend** — if user accounts / progress tracking across devices is needed later

### Gotchas
- API keys are client-side (localStorage) — this is by design per the spec, not a bug
- The `anthropic-dangerous-allow-browser: true` header is required for direct browser API calls
- Cloudflare "Full" (not "Full Strict") SSL mode — self-signed cert on origin
- Tier unlock state is in-memory only — refreshing the page resets tier progress
