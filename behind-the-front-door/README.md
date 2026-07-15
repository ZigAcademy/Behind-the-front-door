# Behind the Front Door — Digitaal spelbord

Een digitaal spelbord voor de simulatiegame *Behind the Front Door* (onboardingtraining
"Introductie corporatiesector"). Eén los `index.html`-bestand, in de Zig Grow-huisstijl —
te openen op je laptop of te hosten via GitHub Pages.

## Wat het nu al kan (spelleider)

- **Teams instellen**: 2–6 teams, met quizbonus (0–4). Meters starten op 10, budget op 12 + bonus.
- **Live teamdashboards**: de vier meters (Tevredenheid, Financieel, Compliance, Duurzaamheid)
  als gekleurde balken, een muntenteller en een automatische score. Zakt een meter onder de 5,
  dan kleurt het team rood — verscherpt toezicht van de Aw (−5 strafpunten).
- **Alle kaarten digitaal**: 5 scenario's + reveals, 12 journey-kaarten, 6 crisiskaarten
  (je kiest er 4) en de budget shock. Per kaart kiest elk team A of B onder zijn dashboard;
  kosten en metereffecten worden automatisch verwerkt (met een ↺ om een keuze te wijzigen).
- **Kwartaalinkomsten** en **crisis-kosten voor alle teams** met één klik.
- **Eindstand** met ranking, score-opbouw en Aw-straf.
- De stand wordt in je browser bewaard; "Nieuw spel" begint opnieuw.

## Hosten op GitHub Pages (gratis)

1. Maak op github.com een nieuwe repository, bijv. `behind-the-front-door`.
2. Upload de inhoud van deze map (in elk geval `index.html`).
3. Ga in de repo naar **Settings → Pages**.
4. Kies bij *Source*: **Deploy from a branch**, branch `main`, map `/ (root)`. Klik **Save**.
5. Na een minuut staat je spelbord op `https://<jouw-gebruikersnaam>.github.io/behind-the-front-door/`.

Je kunt het bestand ook gewoon lokaal openen (dubbelklik op `index.html`) om te oefenen.

## De join-link (spelers)

Rechtsboven op het spelleiderscherm staat een **kamercode** en een knop **Join-link kopiëren**.
De link (`...?role=player&room=CODE`) opent bij spelers een instapscherm waar ze hun naam en team
kiezen. Daarna zien ze **hun eigen teamdashboard + de huidige kaart**, en hun **A/B-keuze landt live
op het bord** van de spelleider.

Dit werkt zodra je de gratis realtime-koppeling (Firebase) hebt ingesteld — zie hieronder.
Zolang de configuratie leeg is, blijft het bord gewoon offline werken via het gedeelde scherm.

## Live join met Firebase (eenmalig, ~10 minuten)

1. Ga naar **console.firebase.google.com** en maak een nieuw project (Google-account volstaat;
   Google Analytics mag je uitzetten).
2. Open in het project **Build → Realtime Database → Create Database**. Kies een locatie (Europa)
   en start in **testmodus**.
3. Ga naar **Project settings (tandwiel) → General → Your apps → Web (`</>`)**, registreer een web-app
   en kopieer het `firebaseConfig`-object.
4. Open `index.html`, zoek bovenin `window.FIREBASE_CONFIG = { ... }` en plak jouw waarden
   (in elk geval `apiKey`, `authDomain`, `databaseURL`, `projectId`, `appId`).
5. Push het bestand naar GitHub (of ververs lokaal). Klaar — spelers kunnen nu live meedoen.

**Databaseregels (testmodus)** staan open op lezen/schrijven. Voor een training is dat prima; voor
langer gebruik kun je ze beperken tot de spelmap:

```json
{ "rules": { "rooms": { ".read": true, ".write": true } } }
```

> Let op: dit is een spel zonder persoonsgegevens. Zet geen gevoelige data in de kamer.

---
Zig Grow · Talent Development
