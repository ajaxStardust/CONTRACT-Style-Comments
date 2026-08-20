# QUICKSTART.md — The Map (Operational Truth)

> **"A map is not the territory, but without one, the traveler is lost. In an agentic system, the map is the interface between intent and execution."**

## 🏛️ Purpose of This Artifact

In the **contract-style-comments** (CSC) framework, `QUICKSTART.md` serves as the system's **Empirical Interface**. While `CONTRACT.md` defines the laws (invariants), `QUICKSTART.md` defines the reality—how the system actually runs, where the critical components live, and how to prove that the system is still functioning as intended.

For a stateless AI agent, this file is the "Onboarding Manual" that prevents wasteful exploration and ensures every change is verified against a known-good baseline.

---

## 🧩 Required Reading Order (The Synchronization)

To prevent "Contextual Drift" and ensure the agent understands the system's operational boundaries, this sequence is mandatory at the start of every session:

1.  **[CONTRACT.md](CONTRACT.md)**: Internalize the laws and invariants.
2.  **[WHY.md](WHY.md)**: Understand the governance and pedagogy.
3.  **[QUICKSTART.md](QUICKSTART.md)**: Synchronize with the operational map and verification steps.
4.  **[FUTURE.md](FUTURE.md)**: Optionally review roadmap intent after operational synchronization (standby, non-binding).

---

## 🏛️ STAGING URL and LIVE HTTP URL

Primary Entry Point:
 - LIVE: https://example.com
 - STAGING: https://example.localhost

Secondary Entry Point:
  exists because of feature x.

---

## 🗺️ The System Map (Key Components)

*Modify this table to reflect the specific architecture of your project.*

| Area | Canonical File(s) | Role / System Interaction |
|---|---|---|
| **Entry Point** | `index.php` / `main.py` | The primary bootstrap for the system state. |
| **Business Logic** | `src/Model/` | Where the core transformations and invariants are implemented. |
| **Data Layer** | `schema.sql` / `config.json` | The persistent state that the system must respect. |
| **API/Interface** | `src/API/` | The boundary through which the system interacts with external agents. |

### Common Stacks Examples

To get started, here are pre-filled examples for popular frameworks. Replace with your project's details.

**For a Node.js/Express App:**
| Area | Canonical File(s) | Role / System Interaction |
|---|---|---|
| **Entry Point** | `server.js` | Starts the Express server and loads routes. |
| **Business Logic** | `src/controllers/` | Handles request logic and data processing. |
| **Data Layer** | `models/` | Defines database schemas and queries. |
| **API/Interface** | `routes/` | Exposes endpoints for client interactions. |

**For a Python/Django App:**
| Area | Canonical File(s) | Role / System Interaction |
|---|---|---|
| **Entry Point** | `manage.py` | Django's command-line utility for running the app. |
| **Business Logic** | `views.py` | Processes requests and returns responses. |
| **Data Layer** | `models.py` | Defines ORM models for the database. |
| **API/Interface** | `urls.py` | Maps URLs to views. |

**For a React App:**
| Area | Canonical File(s) | Role / System Interaction |
|---|---|---|
| **Entry Point** | `src/index.js` | Renders the root React component. |
| **Business Logic** | `src/components/` | Reusable UI components and logic. |
| **Data Layer** | `src/services/` | API calls and state management. |
| **API/Interface** | `public/` | Static assets served to users. |

---

## 🧪 Proven Checks (Verification Loop)

A system is only as reliable as its ability to prove it still works. The Proven Checks section is the **Verification Steward** of `QUICKSTART.md` — it encodes the contract's claims as executable checks.

### The Verification Pattern

Every project using CSC MUST implement this pattern (see `CONTRACT.md` §6):

1. **`scripts/smoke_test.py`** — A standalone verification script that encodes the contract's claims as executable assertions. It uses the project's native test infrastructure (Flask test client, `curl` probes, build checks) and requires zero new dependencies.
2. **`scripts/post_deploy.sh`** — A wrapper that chains restart + smoke test into a single deploy verification command.
3. **Exit code discipline** — `0` = all checks pass, `1` = failures detected. Scriptable in any automation chain.

### What the Smoke Test Covers (Template)

The smoke test is project-specific, but the pattern is universal. Every smoke test SHOULD include these categories:

| Category | What It Validates |
|---|---|
| **App Boot** | The application factory / entry point completes without error |
| **Model/Data Layer** | All data models import cleanly; database connection alive |
| **Component Registration** | All registered components (blueprints, routes, plugins) are present |
| **Function Signatures** | Critical functions have the expected parameters (contract enforcement) |
| **File Existence** | Required config files, templates, and assets exist on disk |
| **Route Health** | Public routes return 200; auth-required routes return 302 |
| **Template Rendering** | Rendered HTML contains expected content (macro presence, DOM IDs) |
| **Contract Annotation Count** | Inline `# CONTRACT:` markers are above the minimum threshold |

### Usage

```bash
# After any code change:
./env/bin/python scripts/smoke_test.py          # fast (~3s, test client)
./env/bin/python scripts/smoke_test.py --live   # also hit live HTTPS

# Or use the post-deploy wrapper:
bash scripts/post_deploy.sh                     # restart + test
bash scripts/post_deploy.sh --live              # restart + test + live
```

### Falsifiability Checklist (apply to critical claims)

For each high-impact contract statement, define:

1. **Claim**: the exact invariant/precondition/postcondition being asserted.
2. **Counterexample**: what evidence would prove the claim false.
3. **Check Method**: how to test it (test case, `curl` probe, linter/static check, runtime assertion).
4. **Owner Artifact**: where the claim is governed (`CONTRACT.md`) and where checks are runbooked (`QUICKSTART.md`).

**Concrete Example:**
```
Claim: The /health endpoint returns 200 OK even when the database is in read-only mode.
Counterexample: /health returns 503 or times out when DB is read-only.
Check: curl -f https://example.com/health returns 0; grep -q "200" in response.
Owner: CONTRACT.md §3 (Critical Route/Logic Chains); QUICKSTART.md (this section).
```

### First-Party Verification Preference

Before asking humans for browser screenshots or DevTools dumps, run first-party checks when possible (`curl`, endpoint probes, reproducible shell commands, code-path inspection). Ask for human-captured evidence only when the required signal is browser-only or account-specific.

---

## 🚀 Deploy Procedure (Asset Lifecycle Boundary)

When deploying from staging to live (or local → remote via rsync/SCP/CI), the sync MUST respect the **Asset Lifecycle Boundary** (`CONTRACT.md` §5, `ASSETS.md` Asset Lifecycle Classification): SHIP assets travel with the code; GENERATED and EPHEMERAL assets are excluded *by subdirectory*.

### Boundary-safe rsync pattern (replace paths with your project's)

```bash
# Exclude GENERATED and EPHEMERAL subdirs BY NAME. Never exclude a parent
# that also holds SHIP assets (e.g., never --exclude='static/').
rsync -avz --checksum \
  --exclude='node_modules/' \
  --exclude='.env' \
  --exclude='static/uploads/' \
  --exclude='static/media/' \
  --exclude='__pycache__/' \
  --exclude='.git/' \
  ./  user@live-host:/var/www/app/
```

### Boundary rules (law, not guidance)
- **MUST**: Exclude each GENERATED/EPHEMERAL subdirectory explicitly by name. These are runtime-owned; deploying them clobbers remote user data or ships gigabytes needlessly.
- **MUST**: Ship SHIP assets (CSS/JS/images/binaries) — they are NOT excluded and travel with the code.
- **PROHIBITION**: Never use a parent-directory exclude (e.g., `--exclude='static/'` or `--exclude='public/'`). It drops SHIP assets alongside GENERATED ones — the Separation of Concerns violation that leaves a deploy unstyled or broken. If you catch yourself writing it, stop and name the GENERATED subdirectories instead.
- **MUST NOT** use `--delete` unless intentionally reconciling the remote tree; it can wipe remote-only GENERATED files with no local counterpart.
- **MUST**: After the sync, run a Proven Check that SHIP assets landed on the remote (file exists + byte-identical checksum) and that no parent-directory exclude appears in the command.

---

## ⚖️ The Narrowest-Scope Rule (Operational)

In the CSC framework, this file owns **operational truth**.

- **Update this file** when a file is moved, a new script is added, or a new verification step is discovered.
- **Do NOT update this file** for architectural changes or laws—those belong in `CONTRACT.md`.
- **Do NOT update this file** for planning-only ideas—those belong in `FUTURE.md`.
- **Instruction**: "If you add a tool, register it in the Key Files table. If you find a new way to break the system, add it to the Proven Checks."

---

## 🤝 The Agentic Handshake (Proof of Work)

**The Verification Steward**: Within an active user session, the AI agent is authorized to update this map. 

-   **Responsibility**: No code change is considered "Proven" until it has passed the checks listed here.
-   **Drift Prevention**: If an agent discovers that a listed check is obsolete, it is expected to update the check immediately to reflect the new system reality.
-   **The Pre-Execution Gatekeeper**: An agent MUST NOT execute code-altering batch scripts or heavy generation pipelines without first recording a targeted proposal in `DELTALOG.md`.
-   **Anti-Spin Communication Rule**: An agent MUST NOT enter autonomous status-checking loops on background tasks; it must immediately provide conversational status to the user upon initiating asynchronous operations.
-   **Daemon & Template Reload Discipline**: Every code, template, or macro edit MUST be followed by executing the project restart command (e.g., `./restart-gunicorn.sh`, `npm run build`, or daemon reload) before running verification smoke tests or asking the user to refresh their browser.

---

## 🕒 Last Reviewed & Trigger

-   **LAST REVIEWED**: YYYY-MM-DD-QUALIFIER
-   **REVIEW TRIGGER**: Update this file whenever the project structure changes, new tools are introduced, or a more effective verification method is developed.

---

*Part of the `contract-style-comments` framework. For the full architectural manifesto, visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com).*
