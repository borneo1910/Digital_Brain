# Learnings

> **AI Agents: Check here before suggesting approaches that may have already been tried.**

---

## Spatial Video & Vision Pro

- **MV-HEVC encoding** requires specific frame packing — not just stereo side-by-side; must follow Apple spatial video spec precisely
- **Gaussian splats via ML-Sharp → TouchDesigner** works for stereo SBS Vision Pro output; dual-camera rig IPD configuration is critical
- **SHARP neural network** — available internally at Apple; confirm entitlements before building workflows around it

---

## NDI SDK / visionOS

- **NDI SDK is Objective-C++** — Swift bridging requires careful wrapper design; compilation issues are expected and significant
- **visionOS sandbox** is stricter than iOS — SMB access, network entitlements need explicit configuration
- NDI may not officially support visionOS — verify before investing heavily

---

## Blackmagic / BMD Protocol

- **Blackmagic protocol is undocumented** and changes with firmware — Wireshark is the only reliable way to map it
- **Still-capture API behavior varies by camera model** — don't assume uniform behavior
- URSA Cine Immersive has different behavior than Pocket Cinema cameras

---

## BRAW Integration

- BRAW integration in FrameProcessr is mid-stream — approach was working, not abandoned
- Be careful not to restart from scratch; pick up from existing integration state

---

## Blender / USDZ / Reality Converter

- 3D texturing of Blackmagic URSA Cine Immersive model had material export issues for Reality Converter/USDZ compatibility
- Check material/shader compatibility before spending time on detailed texturing

---

## General Dev

- Large CLAUDE.md files cause context overload in Claude Code — keep them lean
- TDD spec-first approach saves significant iteration time on complex features

---

*Add learnings here after any session that produces new technical insight.*
