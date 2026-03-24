# QUICKSTART.md

WRITTEN FOR: human onboarding + AI agent onboarding
LAST REVIEWED: 2026-03-23
REVIEW TRIGGER: Update when entrypoints, template chain, or verification steps change.

## Session Start

Read in order:

1. [CONTRACT.md](CONTRACT.md)
2. [WHY.md](WHY.md)
3. [QUICKSTART.md](QUICKSTART.md)

## Live Routes to Check

1. Path-to-URL app: /public/default.php
2. File browser shell: /public/index.php
3. Editable template: /public/template-editable.php
4. Unicode utility: /public/unicode-easteregg.php

## Root Redirects

1. [default.php](default.php) -> /public/default.php
2. [template.php](template.php) -> /public/template-editable.php
3. [template-editable.php](template-editable.php) -> /public/template-editable.php
4. [unicode.php](unicode.php) -> /public/unicode-easteregg.php

## Key Files

| Area | Canonical file(s) | Notes |
|---|---|---|
| Root default route | [default.php](default.php) | Thin redirect |
| Public default bootstrap | [public/default.php](public/default.php) | Requires src view stack |
| Main transform page | [src/View/Main.page.php](src/View/Main.page.php) | Active Tool A layout + Vue output |
| Iframe nav click behavior | [public/assets/js/addlistener.js](public/assets/js/addlistener.js) | Guards against loading index.php into main iframe; remaps to /public/default.php |
| Browser header layout | [src/View/html-header.page.php](src/View/html-header.page.php) | Active nav/header styling |
| Navigation generation | [src/Model/Dirhandler.php](src/Model/Dirhandler.php), [src/Model/Navfactor.php](src/Model/Navfactor.php), [src/Model/PathNormalizer.php](src/Model/PathNormalizer.php) | Dot files hidden; top-level label normalized for common hosting paths |
| Masthead SVG title | [public/assets/css/masthead.php](public/assets/css/masthead.php), [src/Model/PathNormalizer.php](src/Model/PathNormalizer.php) | Uses normalized project/domain name instead of raw install directory prefixes |
| Environment summary display | [src/View/Main.page.php](src/View/Main.page.php), [src/Model/PathNormalizer.php](src/Model/PathNormalizer.php) | Location and base path are shown in normalized project-relative form |
| Main style surface | [public/assets/css/tachyons-extended.css](public/assets/css/tachyons-extended.css) | Active nav/header overrides appended here |
| Off-site link rendering | [src/Model/Localsites.php](src/Model/Localsites.php) | Renders config-backed cards, preview imagery, and visit counts |
| Off-site link preview fetch | [src/Model/OpenGraphPreview.php](src/Model/OpenGraphPreview.php), [public/api_link_preview.php](public/api_link_preview.php) | Pulls OGP/title/image metadata for editor enrichment |
| Off-site click counting | [src/Model/Jsonconfigmanager.php](src/Model/Jsonconfigmanager.php), [public/api_link_click.php](public/api_link_click.php) | Persists `count` updates back into config.json |
| Editable template bootstrap | [public/template-editable.php](public/template-editable.php) | Preferred template entrypoint |
| Editable template doctype | [public/doctype/doctype-tachyons.php](public/doctype/doctype-tachyons.php) | Uses dynamic title variable |
| Editable template content | [public/template/editable-html.php](public/template/editable-html.php) | User-editable boilerplate chunk |
| Shared footer | [public/footer/footer-jquery.php](public/footer/footer-jquery.php) | Closes body/html and scripts |
| Unicode utility route | [public/unicode-easteregg.php](public/unicode-easteregg.php) | Kept utilitarian page |
| Curated unicode route | [curated-unicode.php](curated-unicode.php), [public/curated-unicode.php](public/curated-unicode.php) | Root redirect + public page |

## Proven Checks (Manual)

1. Open /public/index.php and verify:
- left nav renders grouped letters
- dotfiles are hidden
- filetype icons align in left gutter
- clicking index.php from nav does not recurse; iframe loads /public/default.php instead

2. Open /public/default.php and verify:
- transform form works
- header composition still balanced
- Go Home link escapes iframe context (target top window)
- masthead title shows project/domain name rather than `wwwroot` or `public_html`
- environment Location and Base Path show normalized project-relative paths

3. Open the off-site links details panel and verify:
- cards render title, optional preview image, and current visit count
- clicking a link opens it in a new tab and increments the visible visit count immediately
- refreshing after a click shows the updated persisted count from `config.json`

4. Open /public/config_editor.html and verify:
- Fetch OGP populates preview title/image fields for a row
- Fetch Missing Previews fills empty preview metadata where available
- Save Changes persists added preview metadata and updated counts cleanly

5. Open /public/template-editable.php and verify:
- page title comes from $title in bootstrap
- h1 uses $page_heading from editable content include

6. Open /public/unicode-easteregg.php and verify:
- Unicode dashboard loads
- historical carousel appears

## Asset Notes

- Current canonical favicon is [public/favicon.png](public/favicon.png).
- Prior plaidicon references were migrated to favicon references in active source/public files.

## What Not To Do

- Do not remove [public/default.php](public/default.php) route chain.
- Do not edit multiple governance artifacts for one narrow change when one artifact fully contains it.
- Do not reintroduce deleted template-picnic chain unless explicitly requested.
