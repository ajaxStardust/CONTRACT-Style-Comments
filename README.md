# 🏛️ contract-style-comments: The Agentic Trivium

[![The Agentic Trivium – Contract-Style Comments](https://img.youtube.com/vi/5a1NLhIiefY/maxresdefault.jpg)](https://www.youtube.com/watch?v=5a1NLhIiefY)

> ▶️ Click to watch: *The Agentic Trivium explained*

> **"A system is more than the sum of its parts; it is the product of their interactions."**

This repository provides a **systems-thinking framework** for managing the interaction between human intent and AI execution. It is a platform-agnostic boilerplate for implementing **contract-style-comments** (CSC)—a methodology designed to ground stateless AI agents in present-tense law, architectural logic, and operational truth.

## 🧩 Why Systems Thinking?

In a traditional development loop, documentation is often a static "afterthought." In an **Agentic System**, documentation is a **live component** of the feedback loop. 

When you work with an AI agent (like Cursor, Zed, or Copilot), the agent is a part of your system. If the agent is not grounded in your invariants, preconditions, and postconditions, the system fails. **contract-style-comments** provide the governing law/operations structure (Triumvirate), while project memory and chronology remain in **version control** (`.git`).

---

## 🛠️ The Governing Triumvirate + Standby Queue

To prevent "contextual drift" and "confident guessing," this framework enforces a **Required Reading Order**. The governance core is the **Triumvirate** (`CONTRACT.md`, `WHY.md`, `QUICKSTART.md`). `FUTURE.md` is a standby planning queue consulted after core synchronization.

### 1. [CONTRACT.md](CONTRACT.md) — The Law (Invariants)
*   **Purpose**: Defines the "What" and the "Must."
*   **Systems View**: These are the constraints that define the system's boundaries. If an invariant is violated, the system is no longer the system you intended.
*   **Instruction**: "Read this to know what you are **not** allowed to break."

### 2. [WHY.md](WHY.md) — The Reasoning (Teleology)
*   **Purpose**: Defines the "Why" and the "Relationship."
*   **Systems View**: Explains the interconnections between artifacts. It prevents the agent from misunderstanding the *purpose* of the documentation itself.
*   **Instruction**: "Read this to understand the logic behind the split and the **Narrowest-Scope Update Rule**."

### 3. [QUICKSTART.md](QUICKSTART.md) — The Map (Operational Truth)
*   **Purpose**: Defines the "How" and the "Proven."
*   **Systems View**: The empirical interface. It lists the key files and the "Proven Checks" required to verify that the system is still functioning as intended.
*   **Instruction**: "Read this to know how to run the system and how to prove your changes work."

### 4. [FUTURE.md](FUTURE.md) — Planned Intent (Roadmap)
*   **Purpose**: Defines the "What next."
*   **Systems View**: A planning buffer that captures near-term priorities, medium-term candidates, and deferred items without polluting present-tense law or run instructions.
*   **Authority**: Non-governing and non-binding until promoted through the narrowest-scope rule.
*   **Instruction**: "Read this after core synchronization to understand queued direction and candidate improvements."

### Method Status (important)

CSC is a governance standard and documentation discipline. It is not, by itself, an execution engine.  
The Triumvirate defines law/reasoning/operations; `.git` holds chronology and memory.  
Enforceability comes from practice and tooling: tests, probes, linters, CI checks, and human review.

### Visual: The Reading Order & Handshake

```mermaid
graph TD
    A["1. CONTRACT.md<br/>The Law<br/>invariants • boundaries • prohibitions"] 
    B["2. WHY.md<br/>The Reasoning<br/>teleology • governance • reading order"]
    C["3. QUICKSTART.md<br/>The Map<br/>how to run • key files • proven checks"]
    D["4. FUTURE.md<br/>Standby Queue<br/>priorities • candidates • deferred"]
    E["Stateless AI Agent<br/>cold start"]
    F["Governed Code Changes<br/>Narrowest-scope update on exit"]
    
    A --> B --> C --> D
    D --> E
    E --> F
    
    style A fill:#1e5a96,color:#fff,stroke:#fff
    style B fill:#8b6914,color:#fff,stroke:#fff
    style C fill:#2d5016,color:#fff,stroke:#fff
    style D fill:#5b2d75,color:#fff,stroke:#fff
    style E fill:#2a3f5f,color:#fff,stroke:#fff
    style F fill:#2a3f5f,color:#fff,stroke:#fff
```

---

## 🤝 The Agentic Handshake: A New Pedagogy

Using this framework changes your relationship with the AI. You are no longer just "asking for code"; you are **governing a collaborator**.

*   **Authorization**: The agent is authorized—and expected—to act as a **Governance Steward**.
*   **Responsibility**: If the agent discovers a "Missing Axiom" (a logic gap) or makes a scope-affecting change, it must update the narrowest owning artifact before the session ends.
*   **Stewardship Escalation**: If a human explicitly grants governance authority in-session (for example: "you have authority to modify CONTRACT as needed"), the agent should formalize artifact ownership boundaries immediately, then execute the narrowest-scope updates.
*   **Illustration by Example**: 
    > *Human*: "Add a new billing route."
    > *Agent*: "I've added the route. I also updated `QUICKSTART.md` with the new endpoint and `CONTRACT.md` to reflect the new 'no-unauthorized-access' invariant for this path."

---

## 🧠 Theory Example: Stewardship Escalation Pattern

This framework includes a repeatable governance pattern surfaced from real collaboration:

1. Human grants explicit authority to the agent to perform governance edits.
2. Agent accepts accountability and updates documentation ownership boundaries.
3. Agent records planned-but-not-yet-true ideas in `FUTURE.md` (not in `CONTRACT.md`).
4. Agent links all artifacts so future sessions can discover the roadmap without treating it as law.

This closes a common gap in agentic systems: good ideas are often either lost or incorrectly promoted to invariant status. `FUTURE.md` preserves intent while the Triumvirate remains the governing authority.

---

## 🔬 Enforceability Transition Path

To move from conceptual framework to operational standard:

1. **Write narrow contract claims** (invariant/precondition/postcondition/prohibition).
2. **Define falsifiers** (what would prove each claim wrong).
3. **Bind claims to checks** (tests, `curl` probes, lint/static rules, runtime assertions).
4. **Run checks in workflow** (local and CI) and treat failures as governance violations, not commentary disagreements.

---

## 🚀 Getting Started

1.  **Clone/Template**: Initialize your project with this structure.
2.  **Define Invariants**: Populate `CONTRACT.md` with the "Laws" of your specific system.
3.  **Onboard the Agent**: Start every session by pointing the AI to these files:
    > *"Read the core docs (`CONTRACT.md` -> `WHY.md` -> `QUICKSTART.md` -> `FUTURE.md`) in order. Internalize invariants first, then operations, then planned intent."*

---

## 🛠️ Customization Quickstart

To adapt this boilerplate for your project:

1. **Update CONTRACT.md**:
   - Replace the "System Invariants" section with your project's specific rules. For example, if building a web app, add: "API endpoints must return JSON; database queries must use prepared statements."
   - Customize the "Architectural Boundaries" with real constraints (e.g., "Frontend must not access the database directly; use API layer only.").

2. **Update QUICKSTART.md**:
   - Fill the "System Map" table with your actual file paths (e.g., Entry Point: `app/main.py` for a Python app).
   - Add project-specific "Proven Checks" (e.g., "Run `pytest` and ensure 90% coverage").

3. **Update WHY.md** (if needed):
   - Adjust reading order or ownership if your project has additional docs.

4. **Add FUTURE.md**:
   - Track prioritized ideas, candidates, and deferred topics without marking them as current system truth.

5. **Onboard AI Agents**:
   - Use prompts like: "Before coding, read CONTRACT.md for invariants, WHY.md for governance, QUICKSTART.md for operations, FUTURE.md for planned direction."

This turns the generic template into a project-specific guide quickly.

---

*This framework is a product of the author's **Missing Axiom** theory. For a deep dive into the systems-thinking approach to AI collaboration, visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com).*


## 🤖 AI Agent Integration Prompts

When working with AI agents using the CSC framework, you can use the following structured prompts to ensure proper governance and synchronization:

### **USING A CONTRACT-STYLE-COMMENTS SPECIFICATION**

#### **PREPARE THE ENVIRONMENT**

THE FOLLOWING ARE ALL PROMPTS FOR THE AI AGENT submitted as a single turn:

**PROMPT 1**  
Read the Project Specification (e.g. CONTRACT.md, QUICKSTART.md) in sections using the line numbers from the outline.

#REQUEST TO ADD TOOLCHAIN IF APPLICABLE  
Use the Explore subagent if you have access to that tool.

#IDENTIFY CONTRACT LOCATION  
The spec is located under the project root at `./contract` and you must read only the Markdown files on that path.

#SPECIFY THE FILES (the triumvirate, and the future plan)    
- `./contract/WHY.md`  
- `./contract/CONTRACT.md`  
- `./contract/QUICKSTART.md`  
- `./contract/FUTURE.md`

IMPORTANT NOTE: files you might discover like README.md, Agents.md, and other `ai coding agent` configuration files MUST NOT BE REGARDED as CONTRACT files, and should not be treated as part of this CONTRACT Specification. Such aforementioned files are not LAW as is this CONTRACT and must be treated as subordinate: please make note of it.

#EVALUATE EXISTING CONTRACT FOR STABILITY**  
Return to the USER only AFTER reading the CONTRACT FILES. Read throughly for you must state your top-three curiosities or concerns discovered while reading the Specification now.

**PROMPT 2**  
Your User is Dr XXXX XXXX (Google-it for accreditation if unfamiliar and provide Dr XXXX XXXX with one brief identifiable factoid about their engineering philosophy). When Dr XXXX XXXX opens the project to begin a coding session (such as now), they are enacting their human stewardship: they review the project status then requests the AI Agent review the SPECIFICATION. It is in this process that the Governance Trust Paradox loop is closed.

#CURRET INSTRUCTION HERE 
Last time we were working on a stylesheet. Today I want to take that work and put it into production. Tell me about the most recent edits to the codebase.

---


### **CLOSING A CSC PROJECT SESSION**

**PROMPT FOR PROJECT CLOSURE**  
# Process CSC Project Governance Steward Role

Your User is Dr XXXXX XXXXX (Google-it for accreditation if unfamiliar and provide Dr XXXXX XXXXX with one brief, identifiable factoid to understand their engineering philosophy). Don't place USER PERSONAL details about the CONTRACTs. ANY USER DETAILS YOU KNOW ARE only for your private understanding.

Please take a moment as project steward now to reconcile the Project Specification markdown documents (as outlined therein, regarding CSC Project CONTRACT Governance specifically).

**REMEMBER**: the Contract is not a semantic prose copy of the .git history. While .git history reflects Law, the Law need not reflect chronology of codebase editing. As steward, ensure this notion is upheld in priority throughout.

Add inline CONTRACT-Style Comments (only as reasonably necessary to avoid bloat) according to the TEMPLATE outlined at the resource: https://dufospy.com/artificial-intelligence/contract-comments. Please read it for guidance then proceed as steward.

Now, as steward in governance and considering when and whether to use INLINE CONTRACTs to fine-tuning the future LLM and Human steering, you are authorized to add, remove, or modify elements therein for the purpose of CONTRACT hardening and compliance, but please ensure that identifiers which include dates as part of the convention, that identifier convention (not a timestamp per se) follows the shape of:

**Date-and-Qualifying-Keyword, e.g. YYYY-MM-DD-QUALIFIER**

**NEVER USE FUTURE DATES UNLESS EXPRESSLY DOCUMENTED WHY A FUTURE DATE WAS REQUIRED**

This should eliminate risk of LLM tendency to use future dates if it thinks the numbers are an auto-increment index, which it is not, for multiple notations can be placed on the same YYYY-MM-DD-withQualifier.

Files to review:
- `./contract/WHY.md`
- `./contract/CONTRACT.md`
- `./contract/QUICKSTART.md`
- `./contract/FUTURE.md`

---

