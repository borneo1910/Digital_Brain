# NDImmersive

> visionOS app for viewing NDI streams and SMB-shared video in 3D formats on Apple Vision Pro.

---

## Status — 2026-03-04

**Phase:** Active development — SDK challenges  
**Platform:** visionOS exclusively

### What exists
- App architecture defined
- NDI SDK integration attempted with significant challenges
- SMB-shared video viewing partially implemented

### Known Issues
- NDI SDK bridging: extensive Swift/Objective-C++ wrapper challenges
- Compilation issues with NDI SDK and Swift interop

### What's next
- Resolve NDI SDK Swift/ObjC++ bridging issues
- Validate SMB video path on device
- 3D format support (side-by-side, MV-HEVC passthrough)

---

## Technical Notes

- NDI SDK is Objective-C++ — requires careful bridging header setup
- visionOS has stricter sandbox than iOS — SMB access needs entitlements
- 3D format rendering on Vision Pro requires RealityKit or Metal compositor

---

## Handoff — 2026-03-04 — Claude

### What we accomplished
- Architecture defined
- NDI SDK bridging extensively worked on

### Where we stopped
- NDI SDK compilation issues unresolved

### What to do next
1. Isolate NDI SDK compilation error — check visionOS SDK compatibility matrix
2. Consider wrapping NDI in a separate Swift package with explicit ObjC++ boundary
3. Test SMB path with entitlements enabled

### Gotchas
- NDI SDK may not officially support visionOS — check NDI developer docs for platform support statement
- Don't mix Swift concurrency and ObjC callbacks without careful bridging
