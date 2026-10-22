#!/usr/bin/env bash
# Restore helper for the 2026-10-22 profile cleanup.
#
# On 2026-10-22, 33 stale repositories under ramiro-c were archived
# (policy: archive, never delete). This script reflects the undo:
#
#   ./scripts/github-cleanup.sh          dry run: print the gh commands
#   ./scripts/github-cleanup.sh --apply  actually run them
#
# Needs gh authenticated as the owner of ramiro-c.
set -euo pipefail

APPLY=0
if [ "${1:-}" = "--apply" ]; then
  APPLY=1
elif [ -n "${1:-}" ]; then
  echo "usage: $0 [--apply]" >&2
  exit 64
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "error: gh is not authenticated (run 'gh auth login')" >&2
  exit 1
fi

# Experimental AI prototypes left as shells (revive candidates).
EXPERIMENTS=(
  production-agent-observability
  self-reflective-agent
  multi-agent-debate
  event-triggered-automation-agent
  cost-aware-agent-router
  human-in-the-loop-agent
  memory-conversational-agent
  multi-tool-orchestrator-agent
  meta-search-agent
)

# Coursework: UTN sintaxis/paradigmas/SO/tygweb, language courses, Node+NestJS tracks.
COURSEWORK=(
  utn-sintaxis
  utn-paradigmas-funcional
  utn-sistemas-operativos
  utn-tygweb
  php-course
  javascript-course
  react-course
  flask-app-trained-model
  vue-tasks-app
  tasks-reducer-context
  tasks-node-api-lowdb
  tasks-node-typescript-api
  nestjs-tasks-magement-course
  nestjs-flights
  nest-graphql-school
)

# Legacy client and personal projects.
LEGACY=(static-personal-website forrajeriajc newlogic app-repuestos-codigo-barra)

FORKS=(gitapp warp oracle-ai-developer-hub hermes-expense-tracker engram-feed)

count=0
for repo in "${EXPERIMENTS[@]}" "${COURSEWORK[@]}" "${LEGACY[@]}" "${FORKS[@]}"; do
  printf 'gh repo unarchive ramiro-c/%s --yes\n' "$repo"
  if [ "$APPLY" -eq 1 ]; then
    if gh repo unarchive "ramiro-c/$repo" --yes >/dev/null 2>&1; then
      printf '  restored\n'
    else
      # Already unarchived (or not archived) -> idempotent no-op, not a failure.
      printf '  skipped (already active or not archived)\n'
    fi
  fi
  count=$((count + 1))
done

mode=DRY-RUN
if [ "$APPLY" -eq 1 ]; then mode=APPLIED; fi
echo "${mode}: $count repositories"
