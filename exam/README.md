# exam-mockup-html — standalone clickable demo

A **fully clickable** build of the 300Plus candidate exam app (landing → guidelines/consent →
intro → questions → coding → submit → feedback) running on **dummy data with no API, no backend,
and no real camera/microphone/screen capture**. For demos and design review.

It **is** the real app, built with a mock data seam — same UI pixel-for-pixel, same screens, same
flow. Only the data layer and the media capture are faked (behind the `VITE_MOCK` flag).

## How to open

**Serve it with a static server** — it is an ES-module SPA, so a `file://` double-click renders a
blank page. The easiest way:

- **VS Code Live Server**: right-click `index.html` → *Open with Live Server*.
- or any static host: `npx serve .` / `python -m http.server` in this folder.

It uses **HashRouter** and redirects the root to a demo exam link, so it opens straight on the
landing screen — no token to type, no server-side rewrites needed.

## What you get

Opens on the **invitation/landing** screen and walks the whole candidate flow on dummy data:

- **Landing** — the interview invite (role, company, sections, estimated time).
- **Guidelines & consent** — the consent gate, the "what we record / why / who sees it / how long"
  notice, and a device check (faked — no real camera prompt).
- **Intro + questions (HR / Technical / Coding)** — the recording steps are **faked**: no camera,
  no microphone, no screen-share prompt. "Recording" auto-completes so the flow advances.
- **Coding** — starter code + an AI "check my code" prediction (dummy).
- **Submit → feedback** — the completion + candidate feedback narrative.

## Notes

- ⚠ **Dummy data + faked media, no backend.** No camera, microphone, or screen is ever accessed;
  nothing is uploaded anywhere. A page refresh resets in-session progress.
- ⚠ **Not a true recording demo.** Because the mockup can't fake a real webcam feed, the recording
  steps are simulated (they auto-advance). Run the real app to see actual capture.
- ⚠ **Rebuild after code changes:** `VITE_MOCK=1 npx vite build --base=./ --outDir exam-mockup-html`
  from the repo root. Real builds leave `VITE_MOCK` unset, so the real app is unaffected.
