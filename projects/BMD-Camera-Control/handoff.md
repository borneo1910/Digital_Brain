# BMD Camera Control

> Mature SwiftUI iPad app for controlling Blackmagic cameras over local networks.

---

## Status — 2026-03-04

**Phase:** Active — UI redesign + API exploration  
**Maturity:** Production-quality, mature codebase

### What exists
- Full camera control over local network (Blackmagic protocol)
- SwiftUI iPad interface

### Active work
- **Tile-based UI redesign** — rethinking layout for more modular control surface
- **Undocumented still-capture API** — investigating via Wireshark packet analysis; endpoints identified but not fully mapped

### What's next
- Complete tile-based UI redesign
- Document still-capture API findings
- Consider submitting to App Store or keeping internal

---

## Technical Notes

- Protocol analysis done via Wireshark — some undocumented endpoints discovered
- Still-capture endpoint exists but behavior varies by camera model
- SwiftUI architecture is clean — avoid introducing UIKit dependencies

---

## Handoff — 2026-03-04 — Claude

### What we accomplished
- Wireshark analysis of still-capture API endpoints
- Tile-based UI redesign scoping

### Where we stopped
- Still-capture API not fully documented
- UI redesign in planning phase

### What to do next
1. Complete Wireshark mapping of still-capture endpoints by camera model
2. Implement tile-based UI layout
3. Test still-capture across URSA Mini, Pocket Cinema, URSA Cine Immersive

### Gotchas
- Blackmagic protocol is undocumented — changes between firmware versions
- Still-capture behavior is inconsistent across camera models
