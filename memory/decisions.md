# Decisions Log

> **AI Agents: Before proposing solutions, check here to avoid re-litigating settled decisions.**

---

## 2026-03-04

### Patent Filing Strategy — Personal vs. Apple-Assigned
**Decision:** File FrameProcessr and FrameLoggr patents personally, not through Apple  
**Rationale:** Builds internal credibility at Apple while maintaining personal IP. Strategic career move for department head candidacy.  
**Status:** Pending — IP attorney consultation recommended before filing  

---

### CLAUDE.md Structure — Lean Context Loading
**Decision:** Keep CLAUDE.md files at repo roots minimal — only auto-load what's essential, link to everything else  
**Rationale:** Large CLAUDE.md files were causing context management issues in Claude Code sessions  
**Status:** Implemented in FrameProcessr  

---

### SpatialSplat Architecture — Swift + Metal + SHARP
**Decision:** Use Apple's SHARP neural network for depth/stereo estimation, Metal for rendering  
**Rationale:** Native Apple stack, best Vision Pro integration, leverages Mike's internal Apple access  
**Status:** Spec complete, pre-implementation  

---

### BMD Camera Control — Personal vs. App Store
**Decision:** TBD — keep evaluating  
**Rationale:** Undocumented API usage may complicate App Store submission  
**Status:** Open  

---

*Add entries here whenever a significant decision is made in any session.*
