# CONTRACT.md

This is version 3 of the repository contract for transformative.lan / transformative.click.

## Project Context

This repository is a sandbox CMS and experimentation workspace. Contradictory code paths, duplicated templates, legacy entrypoints, and partial refactors are expected. That is not automatically a defect.

The purpose of this contract is not to force a fake purity on the codebase. The purpose is to mark which behaviors are currently relied on, which files are canonical enough to preserve, and which transitions are intentionally in progress.

## Governance Scope

This contract governs:

- the live path-to-URL app served by [public/default.php](public/default.php)
- the P2u2 namespace path-conversion model layer
- the lightweight Vue result binding used by the live transform page
- the public doctype/content composition system that appears to be the intended long-term direction
- the Unicode/easter-egg public PHP route as a valid utilitarian output pattern

This contract does not claim that every template in the repository is clean, current, or equally important.

## Required Reading Order (Trivium)

Read these in order before making scope-affecting changes:

1. [CONTRACT.md](CONTRACT.md): invariants, boundaries, and what must not break.
2. [WHY.md](WHY.md): relationship between artifacts and why boundaries are split.
3. [QUICKSTART.md](QUICKSTART.md): operational run path, key files, and proven checks.

Narrowest-scope rule:

- Invariant/boundary change => update [CONTRACT.md](CONTRACT.md)
- Artifact relationship/read-order change => update [WHY.md](WHY.md)
- Run instructions/proven behavior/key-file map change => update [QUICKSTART.md](QUICKSTART.md)

## Reference Outputs

These outputs are treated as the strongest current references:

1. Dynamic live transform app: `https://transformative.click/public/default.php`
2. Unicode/easter-egg utility route: [unicode.php](unicode.php) -> [public/unicode-easteregg.php](public/unicode-easteregg.php)
3. Preferred visual/demo template reference: [public/template-editable.php](public/template-editable.php)
4. Root editable-template redirect route: [template-editable.php](template-editable.php) -> [public/template-editable.php](public/template-editable.php)

## Bootstrap Map

Current live default route chain:

1. [default.php](default.php) redirects to [public/default.php](public/default.php)
2. [public/default.php](public/default.php) requires [src/View/Main.page.php](src/View/Main.page.php)
3. [src/View/Main.page.php](src/View/Main.page.php) bootstraps the environment, renders the form, mounts the Vue result card, and loads the supporting scripts

Separate template chain:

1. [template.php](template.php) redirects to [public/template-editable.php](public/template-editable.php)
2. [public/template-editable.php](public/template-editable.php) requires [public/doctype/doctype-tachyons.php](public/doctype/doctype-tachyons.php), [public/template/editable-html.php](public/template/editable-html.php), and [public/footer/footer-jquery.php](public/footer/footer-jquery.php)

Unicode route chain:

1. [unicode.php](unicode.php) redirects to [public/unicode-easteregg.php](public/unicode-easteregg.php)
2. [public/unicode-easteregg.php](public/unicode-easteregg.php) requires [public/doctype/doctype-easteregg.php](public/doctype/doctype-easteregg.php) and [public/content/content-easteregg-plus.php](public/content/content-easteregg-plus.php)

Legacy/parallel public template chain:

1. [public/template.php](public/template.php) requires [src/View/Template.page.php](src/View/Template.page.php)

## Critical Invariants

### Sandbox Rule

- This repo is allowed to contain experiments, duplicates, and dead-end templates.
- Do not remove or normalize files merely because they appear redundant.
- Refactors must preserve useful experiments until the user explicitly decommissions them.

### Live Default App Rule

- [public/default.php](public/default.php) is the current public bootstrap for the live path-to-URL app.
- The live output currently depends on [src/View/Main.page.php](src/View/Main.page.php).
- Do not break this route while migrating to public-side composition.

### P2u2 / Newmethod Rule

- [src/Model/P2u2.php](src/Model/P2u2.php) and [src/Model/Newmethod.php](src/Model/Newmethod.php) are compatibility-critical, environment-sensitive transformation code.
- Their logic is messy but relied upon.
- Preserve output keys and observable behavior before attempting cleanup.
- Prefer contract comments and characterization tests before structural refactors.

### Vue Rule

- Vue on the live transform page is intentionally lightweight.
- Its job is to mirror the selected conversion result into the result URL field and anchor.
- Do not silently expand it into a larger SPA without explicit direction.

### Public Composition Rule

- The repository already contains a public-side composition pattern under [public/doctype](public/doctype) and [public/content](public/content).
- Shared page endings live under [public/footer](public/footer).
- This appears to be the intended destination for future refactoring of the live transform page.
- Migration is allowed, but parity with the live default page must be maintained during the transition.
- Preferred page pattern: thin entrypoint + `public/doctype` + `public/content` + `public/footer`.
- Layout rule: doctype files should own the opening HTML shell through `<body>`, and footer files should own the closing scripts plus `</body></html>`.

### Environment Path Normalization Rule

- The UI currently normalizes common hosting paths before displaying project identity.
- The following layouts are treated as first-class supported inputs for display logic:
- `/www/wwwroot/DOMAIN`
- `/home/USER/web/DOMAIN/public_html`
- Current relied-on outputs include the masthead SVG title, the top-level nav label, and the environment path display on the live default page.
- Do not revert these surfaces to raw filesystem prefixes unless explicitly requested.

### Off-Site Links Rule

- The off-site links panel is backed by `config.json` `home_urls` entries.
- Entries may now persist preview metadata including `og_title`, `og_image`, `og_description`, and `og_site_name` in addition to `url`, `name`, `data`, and `count`.
- Off-site link clicks are expected to persist visit counts back into `config.json` through the dedicated click-count update path.
- Treat the off-site links section as data-backed UI, not static markup.

### Unicode Utility Rule

- [unicode.php](unicode.php) is an accepted root entrypoint into the Unicode/easter-egg experience.
- [public/unicode-easteregg.php](public/unicode-easteregg.php) is a strong reference for the preferred public composition style.
- [easter-egg_unicode.html](easter-egg_unicode.html) has been intentionally decommissioned as a root static artifact.
- Unicode utility behavior should remain available through the PHP route chain rather than a duplicated root HTML artifact.

## Governance Triggers

Update this contract when any of the following changes:

1. The root `default.php` redirect target changes.
2. [public/default.php](public/default.php) stops using [src/View/Main.page.php](src/View/Main.page.php).
3. The canonical transform app moves to public-side composition such as [public/content/content-main-transform.php](public/content/content-main-transform.php).
4. `P2u2::clean_url_chars()` changes returned keys or normalization rules.
5. `Newmethod::buildUrl()` or `buildUrlLast()` changes its debug/output key structure.
6. The Vue mount element, script source, or selector contract changes.
7. The preferred reference template changes away from [public/template-editable.php](public/template-editable.php).
8. The Unicode/easter-egg route chain or artifact policy changes role.
9. [unicode.php](unicode.php) stops redirecting to [public/unicode-easteregg.php](public/unicode-easteregg.php).
10. Supported environment path normalization rules change for masthead/nav/environment displays.
11. `config.json` off-site link entry shape changes or click counting stops persisting.

## Implementation Guidance

When editing this codebase:

1. Mark fragile files with inline CONTRACT comments before refactoring them.
2. Preserve route chains unless explicitly changing routing.
3. Prefer extracting public-facing markup into [public/content](public/content) and [public/doctype](public/doctype) rather than growing monolithic files in [src/View](src/View).
4. Keep reusable business logic in `src/Model` even when markup migrates outward.
5. Treat sandbox/demo templates as intentional until the user says otherwise.

## Ownership

Within an active session, GitHub Copilot may act as governance author for this contract and update it when contract-designated triggers are encountered.

Outside an active session, no autonomous ongoing responsibility exists. Future updates still require a user-invoked session.

## Governance Update Log

### 2026-03-23

- User-approved template canonicalization: [public/template-editable.php](public/template-editable.php) chain is the preferred template path.
- Doctype naming normalized to [public/doctype/doctype-tachyons.php](public/doctype/doctype-tachyons.php).
- User-approved decommission actions executed for obsolete artifacts, including removal of [public/template.picnic.php](public/template.picnic.php) and root static [easter-egg_unicode.html](easter-egg_unicode.html).
- Root template redirect updated: [template.php](template.php) now routes to [public/template-editable.php](public/template-editable.php).
- Iframe recursion guard added: nav click handling now prevents loading index.php into the iframe shell by rerouting that click target to /public/default.php; Go Home in the default page now targets the top window.
- Common hosting path normalization added so masthead SVG, top nav root label, and environment path display show project identity rather than raw prefixes like `wwwroot` or `public_html`.
- Off-site links gained persisted Open Graph preview metadata support plus stored click-count updates through the config-backed link tracking flow.