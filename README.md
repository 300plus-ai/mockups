# 300Plus — clickable mockups

Static, standalone builds of the three 300Plus front-ends, running on **in-memory dummy data**
— no API, no backend, no network calls. Published via GitHub Pages for demos and design review.

| Mockup | Path | Source repo |
| --- | --- | --- |
| Client console | [`/client/`](./client/) | `300plus-ai/client-frontend` |
| Candidate exam | [`/exam/`](./exam/) | `300plus-ai/exam-frontend` |
| Super-admin console | [`/super-admin/`](./super-admin/) | `300plus-ai/super-admin-frontend` |

Each folder has its own `README.md` describing what works, what is faked, and its known limits.

## This repo is public

It exists only to host the Pages site — GitHub Pages cannot publish from a private repo on the
org's current plan. It contains **built bundles only** (minified, no source maps); the application
source stays in the private repos above. The pages carry `noindex, nofollow`, so they stay out of
search results, but anyone with the URL can open them. Don't add anything here you wouldn't
publish.

## Updating a mockup

Rebuild in the source repo, then copy the output folder in here and push:

```
# in the source repo, e.g. super-admin-frontend
VITE_MOCK=1 npx vite build --base=./ --outDir super-admin-mockup-html --emptyOutDir

# then, in this repo
rm -rf super-admin && cp -r ../super-admin-frontend/super-admin-mockup-html super-admin
git add -A && git commit -m "Update super-admin mockup" && git push
```

The `--base=./` flag matters: it makes asset paths relative so the bundle works from a
subdirectory. All three apps use `HashRouter`, so no server-side rewrite or `404.html` fallback
is needed.

`.nojekyll` disables Jekyll processing so files are served verbatim.
