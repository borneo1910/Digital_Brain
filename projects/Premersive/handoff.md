# Premersive

> Immersive storyboarding and previsualization tool. Script-to-video generator for immersive/spatial filmmaking.

---

## Concept

Premersive is a tool for filmmakers (starting with Mike) to go from script or shot list → visual previsualization → immersive/spatial storyboard. The key differentiator is the *immersive* angle — not flat 2D storyboards, but spatial previsualization for VR/360/spatial video productions.

Think: AI-generated illustrated storyboards (already proven out in chats) + spatial/depth awareness + script parsing + shot list generation.

---

## Status — 2026-03-04

**Phase:** Concept / early exploration  
⚠️ *Check Claude Projects for any deeper build sessions*

### What's been explored
- Manual storyboard generation from shot lists (Twister ORV film — Spangler Hills, April 2025)
- Black and white illustrated panels, 4-across / 2-row layout
- Script/shot-list → storyboard panel workflow validated manually
- Mike has direct production experience to inform what this needs to do

### What Premersive needs to be
- Input: script, shot list, or natural language scene description
- Processing: AI image generation for panel illustrations (ComfyUI integration?)
- Output: formatted storyboard (PDF, web, or spatial format)
- Immersive angle: spatial awareness, 360° FOV notation, stereo/depth cues

---

## Key Questions

- Is this a web app, desktop app, or iPad app?
- ComfyUI backend for image gen, or use API-based generation (DALL-E, Flux, etc.)?
- What's the MVP — flat storyboard generator first, immersive layer later?
- Is this personal tool only, or a product for other immersive filmmakers?

---

## Handoff — 2026-03-04 — Claude

### What we accomplished
- Concept defined
- Manual workflow validated (shot list → illustrated storyboard)

### What to do next
1. Define MVP scope — probably: script/shot list → illustrated storyboard panels → PDF export
2. Choose image generation approach
3. Sketch the UI — needs to feel like a filmmaker's tool, not a generic AI app
4. Consider how "immersive" layer gets added (phase 2?)

### Gotchas
- The immersive/spatial angle is what makes this distinct — don't let it become a generic storyboard tool
- Mike's filmmaking background means he'll have strong opinions on what feels right
- ComfyUI integration is possible but complex — consider API-first for MVP
