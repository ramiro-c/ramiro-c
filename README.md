# Hi, I'm Ramiro 👋

**AI Systems Engineer** based in Buenos Aires. I build LLM agents with contracts you can verify: tool policies, grounding with per-user permissions (RAG), and deterministic evals that gate CI — no LLM judge.

- [Portfolio](https://ramirocerda.com.ar) · [LinkedIn](https://www.linkedin.com/in/cerdaramiro/) · [X](https://x.com/c__ramiro) · [Email](mailto:rami992009@gmail.com)

## Flagship work

| Project | What it proves |
| --- | --- |
| [agent-evals](https://github.com/ramiro-c/agent-evals) | Golden cases + deterministic graders (tool use, grounding, language); pass-rate threshold with a CI exit code. No LLM in the loop. |
| [spec-refinery](https://github.com/ramiro-c/spec-refinery) | LangGraph interrogator that turns a ticket into an implementable spec, with RAG over company rules and a golden eval set. |
| [rag-citation-agent](https://github.com/ramiro-c/rag-citation-agent) | Retrieval agent that answers only from sources it can cite, filtered by per-user permissions. |
| [orquestador-langgraph](https://github.com/ramiro-c/orquestador-langgraph) | Hierarchical multi-agent supervisor for research (Tavily, sentiment analysis, auto-written output). |
| [ai-agents-hub](https://github.com/ramiro-c/ai-agents-hub) | Monorepo with 6+ agents across ADK, LangGraph, FastAPI. |
| [ramirocerda](https://github.com/ramiro-c/ramirocerda) | This positioning, live: the portfolio that documents every build against its evals. |

## How I evaluate agents

Golden cases in, programmatic graders out: recorded tool calls, numeric and factual grounding against tool results, forbidden content, language. The harness fails non-zero when the pass rate drops, so a regression on main is a red build, not a bad feeling. A judged opinion is never the only wall between a defect and production.

## Roadmap: reviving the archive

33 older repositories were archived on 2026-10-22 to keep the profile honest — experimental AI shells, coursework, and forks. None were deleted. See [CLEANUP.md](CLEANUP.md) for the full inventory and `scripts/github-cleanup.sh` to restore any of them with one command. The four most worth reviving next:

- `production-agent-observability` — agent run traces and grading dashboards
- `memory-conversational-agent` — conversation memory for stateful agents
- `cost-aware-agent-router` — routing between models by cost and confidence
- `meta-search-agent` — search aggregation with verifiable citations

## Tools

TypeScript · Python · React · Svelte · FastAPI · LangGraph · Google ADK · Cloudflare Workers · PostgreSQL · pgvector · Docker
