# FrameProcessr

> Real-time frame-accurate motion analysis and visualization tool that bridges on-set workflows with VFX pipelines.

---

## Status — 2026-03-04

**Phase:** Active development  
**Priority:** High — patent filing consideration in parallel  

### What exists
- Core frame-accurate motion analysis engine
- Visualization layer
- BRAW integration: **in progress (mid-integration)**
- SRT streaming: **planned, not started**

### What's next
- Complete BRAW integration
- Implement SRT streaming support
- Patent filing for novel method (personal filing preferred for Apple internal credibility)

---

## Architecture Notes

- Swift/SwiftUI, Apple platforms
- CLAUDE.md exists at repo root — keep it lean, only auto-load essentials
- TDD approach preferred for new feature additions
- Context was restructured to reduce auto-loaded CLAUDE.md size significantly

---

## Patent Strategy

Mike is pursuing a **personal patent filing** (not Apple-assigned) for the novel method of real-time frame-accurate motion analysis and visualization bridging on-set and VFX workflows. This is intentional — it builds internal credibility at Apple while maintaining personal IP.

**Do not suggest filing through Apple without understanding this strategic choice.**

---

## Handoff — 2026-03-04 — Claude

### What we accomplished
- Restructured CLAUDE.md to reduce auto-loaded context size
- Mid-BRAW integration work ongoing

### Where we stopped
- BRAW integration incomplete

### What to do next
1. Complete BRAW format integration
2. Begin SRT streaming architecture
3. Draft patent claims outline for novel motion analysis method

### Gotchas
- CLAUDE.md must stay lean — don't add large blocks of context back in
- Patent filing is personal, not Apple-assigned — important strategic distinction

### Files touched
- CLAUDE.md (restructured)
- BRAW integration files (in progress)
