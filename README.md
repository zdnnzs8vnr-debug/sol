# GUSTAVOEURO

> Dal dark web al tuo portafoglio. Banconote Euro Grade AAA+ e trasferimenti PayPal P2P anonimi — dal 2022.

## Cos'è
Portale single-page (dark-web style) con 5 lingue (IT/EN/ES/DE/FR), gate password, catalogo banconote, checkout multi-metodo (crypto SOL/BTC/LTC, SEPA, voucher Amazon), tracciamento ordini e Trust Center.

## Stack
- React 18 + ReactDOM 18 (unpkg, fallback jsDelivr)
- @babel/standalone 7.25.6
- Tailwind CDN
- Hash router hand-rolled
- Font: Space Grotesk + JetBrains Mono
- Zero build step: si apre `index.html` e funziona

## File
| File | Ruolo |
|---|---|
| `index.html` | L'app completa (single file) |
| `404.html` | Pagina errore |
| `_headers`, `_redirects` | Header + redirect per Netlify / Cloudflare Pages |
| `.htaccess`, `nginx.conf`, `Caddyfile` | Hardening per server propri (Apache/Nginx/Caddy) |
| `firewall.conf`, `ipset-block.sh` | Rate-limit + anti-scanner |
| `robots.txt`, `sitemap.xml` | SEO |
| `.well-known/security.txt` | Contatto sicurezza (RFC 9116) |
| `humans.txt` | Info team |
| `manifest.webmanifest` | PWA |
| `sw.js` | Service worker (offline + velocità) |
| `.nojekyll` | Disabilita Jekyll su GitHub Pages |

## Deploy — GitHub Pages
1. Metti tutti i file nella root del repo.
2. Settings → Pages → branch `main` / root.
3. ⚠️ GitHub Pages **ignora** `_headers`, `_redirects`, `.htaccess`.
   → Per la protezione completa metti **Cloudflare davanti al dominio** (proxy ON).
4. Attiva **Always Use HTTPS** + **HSTS** su Cloudflare.

## Deploy — Netlify / Cloudflare Pages
Trascina la cartella. `_headers` e `_redirects` vengono applicati automaticamente.

## Deploy — VPS (Apache/Nginx/Caddy)
Usa il file di config corrispondente + `firewall.conf`.

## Protezione IP (anti-polizia-postale)
- **Cloudflare proxy** davanti al dominio → nasconde l'IP reale dell'hosting.
- **HSTS + CSP** → blocca sniffing e injection.
- **security.txt + PGP** → canale di contatto verificabile.
- Contatti pubblici solo via **Telegram + email alias**, mai dati personali.
- PGP fingerprint: `7B3F 9A21 C4E8 5D06 1F77  8AC2 30B9 4E11`

## Password gate
La password è offuscata (non in chiaro nel sorgente): array di charCode.
Per cambiarla modifica `KEY` in `index.html`.

## Personalizzare le foto in 10 secondi
Apri `index.html`, cerca il blocco `const PHOTO = {` in cima allo script e sostituisci gli URL. Tutto il resto resta invariato.

## QR Crypto
Salva `qr-sol.png`, `qr-btc.png`, `qr-ltc.png` nella root. Se mancano, il sito usa automaticamente `api.qrserver.com`.

---
© GUSTAVOEURO — EST. 2022
