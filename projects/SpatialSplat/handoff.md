# SpatialSplat

> Swift application suite to convert 2D images and video into stereoscopic 3D content using Apple's SHARP neural network and Metal-based rendering. Targets macOS, iPad, and Vision Pro.

---

## Status — 2026-03-04

**Phase:** Specification / early development  
**Priority:** High — aligns directly with Apple IMT role and Vision Pro platform

### What exists
- Full TDD specification written
- Architecture defined: Swift, Metal rendering, Apple SHARP/ML
- Multi-platform target: macOS, iPadOS, visionOS

### What's next
- Implementation of core conversion pipeline
- Metal shader work for stereo rendering
- Vision Pro spatial output validation (MV-HEVC)

---

## Architecture

- **Input:** 2D images or standard video
- **Processing:** Apple SHARP neural network for depth/stereo estimation
- **Rendering:** Metal-based stereo compositor
- **Output:** Stereoscopic 3D — side-by-side ProRes, MV-HEVC for Vision Pro
- **Platforms:** macOS (primary), iPadOS, visionOS

---

## Related Work

- Gaussian splat pipeline (ML-Sharp → TouchDesigner → Vision Pro side-by-side stereo output) informed this architecture
- Dual-camera rig IPD configuration experience feeds into stereo output calibration

---

## Handoff — 2026-03-04 — Claude

### What we accomplished
- Full TDD spec written
- Architecture decisions locked

### Where we stopped
- Pre-implementation

### What to do next
1. Set up Xcode project with multi-platform targets
2. Implement SHARP integration layer
3. Build Metal stereo compositor

### Gotchas
- SHARP API is Apple-internal — confirm availability/entitlements before implementation sprint
- MV-HEVC encoding requires specific frame packing — reference existing spatial video pipeline docs
