# super-admin-mockup-html — standalone clickable demo

A **fully clickable** build of the 300Plus super-admin console (the platform-operator app:
tenants, users, Act-as, audit, credit rates & grants, ops) running on **in-memory dummy data with
no API and no backend**. For demos and design review.

It **is** the real app, built with a mock data seam — same UI pixel-for-pixel, same screens, same
components. Only the data layer is swapped (behind the `VITE_MOCK` flag).

## How to open

**Serve it with a static server** — it is an ES-module SPA, so a `file://` double-click renders a
blank page. The easiest way:

- **VS Code Live Server**: right-click `index.html` → *Open with Live Server*.
- or any static host: `npx serve .` / `python -m http.server` in this folder.

It uses **HashRouter**, so routes work from any static host with no server-side rewrites.

## What you get

Lands **already signed in** as the platform operator (`ops@300plus.ai`, SuperAdmin, cross-org).
Every screen is reachable and clickable on dummy data:

- **Organizations** — 3 seeded tenants (Acme Corp, Globex, Initech) with admin/user/job counts and
  status; **+ New organization** and **Disable** mutate the in-memory list within the session.
- **All Users** — the cross-org directory, with role / org / status filters.
- **Audit Log** — sample entries (act-as, org-created, user-disabled), filterable by action.
- **Credit rates** — platform defaults + per-org overrides; **Grants** and **Ops/Cost** screens.
- **Act-as** — the flow is demonstrable (returns a dummy code); the real server-side token exchange
  does not exist in the mockup.

## Notes

- ⚠ **Dummy data, no backend.** A page refresh resets any in-session changes to the seed.
- ⚠ The stat tiles for **jobs-per-org** and **interviews-this-month** are marked `MOCK` — no such
  cross-org metric exists in the product yet (they need Epics 2 / 5).
- ⚠ **Rebuild after code changes:** `VITE_MOCK=1 npx vite build --base=./ --outDir super-admin-mockup-html`
  from the repo root. Real builds leave `VITE_MOCK` unset, so the real app is unaffected.
