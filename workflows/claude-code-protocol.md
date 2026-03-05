# Claude Code Protocol

## Digital Brain Sync

### Session Start
1. Read project context from referenced markdown files in this repo (see below)
2. Read the Digital Brain handoff:
   https://raw.githubusercontent.com/borneo1910/Digital_Brain/master/projects/[PROJECT_NAME]/handoff.md

### Session End — Required Steps
Never end a session without doing all of these:

1. **Update this project repo:**
   - Log debug info, errors, and technical notes to their own markdown files
     (e.g. DEBUG.md, DECISIONS.md, CHANGES.md) — NOT into CLAUDE.md
   - Update CLAUDE.md only if core project instructions or references changed
   - Commit and push everything:
     git add . && git commit -m "session: [brief description]" && git push

2. **Update Digital Brain handoff:**
   - Write what was accomplished, where we stopped, what to do next, and any gotchas
   - Commit and push to the Digital Brain repo:
     cd ~/Digital_Brain
     git add projects/[PROJECT_NAME]/handoff.md
     git commit -m "handoff: [PROJECT_NAME] $(date +%Y-%m-%d)"
     git push
     cd -

### CLAUDE.md Philosophy
- Keep CLAUDE.md lean — pointers and instructions only
- Offload everything else to referenced files:
  - DEBUG.md — errors, failed attempts, environment issues
  - DECISIONS.md — architecture choices and why
  - CHANGES.md — session-by-session what changed
  - CONTEXT.md — background and domain knowledge
- CLAUDE.md should tell Claude where to look, not contain everything itself

---

### New Project Protocol
If this project does not yet have a GitHub repo:
1. Create a new private GitHub repo: gh repo create [PROJECT_NAME] --private
2. Initialize it: git init && git add . && git commit -m "init: [PROJECT_NAME]" && git push -u origin master
3. Create a new project folder in Digital Brain:
   ~/Digital_Brain/projects/[PROJECT_NAME]/handoff.md
   Use the handoff template at:
   https://raw.githubusercontent.com/borneo1910/Digital_Brain/master/handoffs/template.md
4. Commit and push the new folder to Digital Brain:
   cd ~/Digital_Brain && git add . && git commit -m "new project: [PROJECT_NAME]" && git push
   cd -
5. Create a lean CLAUDE.md in the new project repo with:
   - What the project is (one paragraph)
   - References to any supporting markdown files
   - The Digital Brain Sync section (above)
