# Spatial Video Pipeline Workflow

> Reference doc for AI agents working on any spatial/immersive video task with Mike.

---

## Overview

Mike works with spatial video across the full pipeline: capture → processing → encoding → delivery to Vision Pro.

---

## Camera Systems

| Camera | Format | Notes |
|--------|--------|-------|
| Blackmagic URSA Cine Immersive | BRAW, spatial | Primary immersive capture camera |
| Stereo fisheye rig | Various | Underwater photogrammetry, mixed pipeline |
| Dual-camera rigs | Various | Gaussian splat capture, configurable IPD |

---

## Pipeline Stages

### 1. Capture
- URSA Cine Immersive records BRAW
- IPD configuration critical for stereo rigs
- Metadata logging via FrameLoggr

### 2. Processing / Analysis
- FrameProcessr: frame-accurate motion analysis
- Gaussian splat generation: ML-Sharp
- Depth/stereo estimation: Apple SHARP neural network (SpatialSplat)

### 3. Encoding
- **ProRes** — intermediate/archive
- **MV-HEVC** — Vision Pro delivery format (spatial video)
- Side-by-side stereo — TouchDesigner output path

### 4. Delivery
- Apple Vision Pro (MV-HEVC, spatial video spec)
- visionOS playback via NDImmersive (live streams) or direct file

---

## MV-HEVC Notes
- Frame packing must follow Apple spatial video specification exactly
- Not just stereo side-by-side — metadata and container requirements are specific
- Reference Apple developer docs for current spec

---

## Gaussian Splat Path
- Capture → ML-Sharp → `.splat` file
- TouchDesigner: load splat, configure stereo SBS output
- Encode to ProRes SBS → view on Vision Pro

---

## Known Issues / Gotchas
- BRAW integration in FrameProcessr is mid-stream — don't restart
- MV-HEVC encoding is finicky; test output on device, not just simulator
- SHARP entitlements must be confirmed for any new project using it

---

*Updated: 2026-03-04*
