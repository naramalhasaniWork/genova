# Genova Global

Pharmaceutical market access for Iraq — registration, GDP-aligned cold-chain supply, and private-channel access under one accountable partner.

Single-file static landing page (`index.html`), bilingual EN/AR with RTL support. No build step, no backend.

## Deploy — Railway

This repo ships with `railway.json`. Deploy:

1. [railway.app](https://railway.app) → **New Project → Deploy from GitHub repo** → select `genova`
2. Railway detects Nixpacks, runs `npm install`, and starts `npm start` (static server via `serve` on `$PORT`)
3. Add the custom domain `genovaglobal.org` under **Settings → Networking → Custom Domain**, then point the domain's CNAME at the Railway target it gives you

## Local preview

```
npm install
npm start        # http://localhost:3000
```

Or just open `index.html` in a browser — it's fully self-contained.

## Pre-launch checklist

- [ ] Create the `partnerships@genovaglobal.org` inbox (the contact form and mailto links depend on it)
- [ ] Replace the Unsplash placeholder image in the photo band with licensed brand photography
- [ ] Confirm public naming/title of Dr. Yaser Shaheen (Leadership section)
- [ ] Native-speaker review of the Arabic copy
- [ ] Update the LinkedIn URL in the footer once the company page exists
