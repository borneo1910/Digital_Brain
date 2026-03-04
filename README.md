# Mike's Digital Brain

> **This repository is the single source of truth for Mike's ongoing work, context, and memory. If you are an AI agent starting a new session, read this file first, then follow the instructions below.**

---

## 🤖 AI Agent Onboarding Protocol

When beginning any session with Mike, follow this reading order:

1. **`context/profile.md`** — Who Mike is, his role, background, and goals
2. **`context/preferences.md`** — How he likes to work, communicate, and what tools he uses
3. **`projects/[relevant project]/status.md`** — Current state of whatever you're working on together
4. **`projects/[relevant project]/handoff.md`** — Pick up exactly where the last AI left off
5. **`memory/open-questions.md`** — Unresolved threads that may be relevant

After your session, you are expected to **update the handoff file** for the project you worked on, and log any significant decisions or learnings to the appropriate `memory/` file.

---

## 📁 Repository Structure

```
digital-brain/
├── context/                  # Stable context about Mike — read at session start
│   ├── profile.md            # Role, background, expertise, current focus
│   ├── preferences.md        # Communication style, tool preferences, workflow style
│   └── relationships.md      # Key people, teams, and contacts
│
├── projects/                 # One folder per active or recent project
│   ├── FrameProcessr/
│   ├── FrameLoggr/
│   ├── SpatialSplat/
│   ├── BMD-Camera-Control/
│   ├── NDImmersive/
│   └── Open-Heart/
│
├── memory/                   # Persistent memory across all sessions
│   ├── decisions.md          # Past decisions and their rationale
│   ├── learnings.md          # What's been tried, what worked, what didn't
│   └── open-questions.md     # Unresolved questions to return to
│
├── workflows/                # Reusable process documentation for AI agents
│   ├── spatial-video-pipeline.md
│   ├── code-review.md
│   └── patent-strategy.md
│
└── handoffs/                 # Cross-session, cross-AI handoff notes (timestamped)
    └── template.md
```

---

## ✍️ Handoff Writing Standard

At the end of every productive session, write a handoff note to `projects/[project]/handoff.md` using this format:

```
## Handoff — [Date] — [AI Agent Name]
### What we accomplished
### Where we stopped
### What to do next
### Gotchas / things to know
### Files touched
```

Also drop a copy in `handoffs/` with the filename `YYYY-MM-DD-[agent]-[project].md` for cross-project searchability.

---

## 🔐 Access & Permissions

This is a **private repository**. Mike controls read/write access. AI agents with GitHub API access may commit directly to `main` for memory and handoff updates. For project code changes, use branches and PRs.

---

*Last updated: 2026-03-04*
