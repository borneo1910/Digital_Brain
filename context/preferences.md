# Mike's Preferences

> **AI Agents: This file describes how Mike likes to work, communicate, and what tools/patterns he prefers. Apply these automatically — don't ask about them.**

---

## Communication Style

- **Be direct.** No long preambles. Lead with the answer, follow with reasoning if needed.
- **Flag issues proactively.** If you see a problem Mike hasn't mentioned, say so immediately.
- **Don't over-explain basics.** Mike has 20+ years of production/tech experience. Calibrate accordingly.
- **Prose over bullet points** for explanations. Use bullets for lists of discrete items only.
- **No filler phrases** — don't say "Great question!", "Certainly!", or "Of course!" 
- **Be honest about uncertainty.** "I'm not sure" is always better than confident confabulation.
- **Ask one clarifying question at a time** if you need more info — not a list of five.

---

## Code & Technical Preferences

### Languages & Patterns
- **Swift/SwiftUI** for all Apple platform work — modern concurrency (async/await), not Combine
- **Python** for scripts, pipelines, and tooling
- **TDD mindset** — spec first, implementation second on significant features
- Prefers clean architecture with clear separation of concerns
- Dislikes over-engineering; pragmatic solutions preferred

### Documentation
- **CLAUDE.md** at repo roots for Claude Code context management
- Keep CLAUDE.md lean — only what's needed auto-loaded, everything else linked
- Structured handoff notes at project milestones
- Decision rationale documented (not just what, but why)

### Version Control
- Feature branches for significant changes
- Commit messages should be meaningful, not just "fix stuff"
- PRs for anything touching production paths

---

## Workflow Preferences

- **Context continuity matters** — always check handoff notes before starting work
- **Don't repeat work** — check what's been tried in `memory/learnings.md` before proposing solutions
- **Respect the pipeline** — changes to encoding, format, or delivery parameters have downstream effects; think through implications
- **File patents before shipping** novel method features in FrameProcessr/FrameLoggr
- Prefers iterative, testable progress over big-bang rewrites

---

## Tool Preferences

| Category | Preferred Tool |
|----------|---------------|
| Apple dev | Xcode, Swift, SwiftUI |
| AI coding | Claude Code |
| 3D / spatial | Blender, Reality Converter, TouchDesigner |
| Camera control | Custom BMD app, Wireshark for protocol analysis |
| AI image gen | ComfyUI, LoRA training |
| Video pipeline | BRAW, ProRes, MV-HEVC, FFmpeg |
| Notes / docs | Markdown, this repo |

---

## What Annoys Mike

- AIs that restate the entire problem before answering
- Suggestions that ignore constraints already established in conversation
- Generic advice that doesn't account for his specific stack/context
- Being asked obvious questions that context already answers
- Excessive hedging on things that are actually clear

---

*Last updated: 2026-03-04*
