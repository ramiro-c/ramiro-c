# Profile cleanup — 2026-10-22

One-time cleanup to keep this profile honest. Policy: **archive, never delete**. Every change below is reversible; nothing was removed.

## What changed

| Change | Scope | Undo |
| --- | --- | --- |
| Archived 33 stale repositories | 9 experimental AI shells · 15 coursework (UTN, Node/NestJS tracks) · 4 legacy client projects · 5 forks | `scripts/github-cleanup.sh` (restore any or all) |
| Set descriptions on 6 repos | spec-refinery, rutinify, blogsystem-api, blogsystem-backoffice, currency-exchange, ramirocerda | `gh repo edit ramiro-c/<name> --description "<previous>"` (previous descriptions were empty except ramirocerda) |
| Set topics on 14 repos | the flagship AI repos plus product/learning repos | `gh repo edit ramiro-c/<name> --remove-topic <set>` |
| Fast-forwarded rag-citation-agent to main | the eval'd RAG agent is now visible as the default branch | prior history preserved |

## Manual follow-ups (owner)

- **Pinned repositories** (no public API): pin `agent-evals`, `spec-refinery`, `rag-citation-agent`; unpin `mini-projects`, `linkedin-markdownificator`, `worldcup-2026`. Profile → customize pins.
- **Profile bio** needs the `user` scope: `gh auth refresh -h github.com -s user`, then set: `AI Systems Engineer — verifiable agents, deterministic evals, grounding with per-user permissions.`
- **Security finding**: `newlogic` (public, archived here as part of the cleanup) has a committed `.env` with SMTP credentials from 2020. Archiving does not remove it. Recommended: rotate/disable that SMTP account, then decide whether to scrub history.

## Restoring a repository

```bash
# one repo
gh repo unarchive ramiro-c/<name>

# all of them (script defaults to dry run)
scripts/github-cleanup.sh --apply
```
