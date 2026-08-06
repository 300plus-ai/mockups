# client-frontend — clickable mockup (dummy data, no backend)

A **standalone, fully-clickable** build of the client-frontend console that runs on
**in-memory dummy data** — no API, no backend, no network calls. Same UI, pixel for
pixel (it *is* the real app, built with a mock data layer).

## How to open

It is an ES-module SPA, so it must be **served over HTTP** — opening `index.html`
directly (double-click / `file://`) shows a blank page (browsers block ES modules on
`file://`).

- **VS Code:** right-click `index.html` → **"Open with Live Server"**.
- **or** `npx serve -s .` (from this folder) → open the printed URL.
- **or** `python -m http.server 8080` → open `http://localhost:8080`.

Routes are **hash-based** (`…/index.html#/jobs`), so no server rewrite is needed.

## What works

Lands **already logged-in** on the Jobs list. Every screen is reachable and clickable
with dummy data: Jobs list · Job detail/Overview · Config wizard · Create job ·
Candidates/Resumes (ranked table + the 4 pipeline graphs) · Results/review · Users ·
Share links · public Share dashboard · Act-as. Create/edit/delete persist in memory
for the session.

**Limitation:** video **playback** in the results screen is inert (real presigned
media URLs need a live backend); transcripts, scores, coding eval and proctoring data
still render.

## Rebuilding

From the repo root:

```
VITE_MOCK=1 npx vite build --base=./ --outDir client-mockup-html --emptyOutDir
```

The mock is entirely behind the `VITE_MOCK` flag (`src/api/mock.ts` + flag-gated
branches in `src/api/index.ts`, `src/api/auth.ts`, `src/main.tsx`). A normal build/dev
leaves the flag unset and uses the real API — the live app is unaffected.
