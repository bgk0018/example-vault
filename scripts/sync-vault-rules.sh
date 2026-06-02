#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE="$REPO_DIR/.windsurf"
MIRROR="$REPO_DIR/vault-rules"
TMP="$MIRROR/.sync.tmp"
rm -rf "$TMP"
mkdir -p "$TMP"
copy() {
  local rel="$1"; shift
  local dest="$TMP/$rel"
  mkdir -p "$(dirname "$dest")"
  # strip Windsurf frontmatter
  awk 'BEGIN{skip=0} /^---/{skip++} skip==1{next} skip==2{skip=0} skip==0{print}' "$SOURCE/rules/$1" > "$dest" 2>/dev/null || \
  awk 'BEGIN{skip=0} /^---/{skip++} skip==1{next} skip==2{skip=0} skip==0{print}' "$SOURCE/workflows/$1" > "$dest" 2>/dev/null || \
  awk 'BEGIN{skip=0} /^---/{skip++} skip==1{next} skip==2{skip=0} skip==0{print}' "$SOURCE/skills/$1/SKILL.md" > "$dest" 2>/dev/null
  sed -i -E 's|global-conventions\.md|vault-rules/global-conventions.md|g' "$dest" 2>/dev/null || true
  sed -i -E 's|(?<![A-Za-z0-9_])/([a-z][a-z0-9-]+)|`\1`|g' "$dest" 2>/dev/null || true
}
copy global-conventions.md rules/global-conventions.md
copy references/conventions-detail.md references/conventions-detail.md
copy references/property-cheatsheet.md references/property-cheatsheet.md
copy references/ethos.md references/ethos.md
copy obsidian-cli.md rules/obsidian-cli.md
copy obsidian-markdown.md rules/obsidian-markdown.md
copy bases.md rules/bases.md
copy canvas.md rules/canvas.md
copy zettelkasten.md rules/zettelkasten.md
copy garden.md rules/garden.md
copy maps.md rules/maps.md
copy areas.md rules/areas.md
copy projects.md rules/projects.md
copy inbox.md rules/inbox.md
copy templates.md rules/templates.md
copy blog.md rules/blog.md
copy archive.md rules/archive.md
copy journal.md rules/journal.md
copy references.md rules/references.md
copy references/articles.md rules/references-articles.md
copy references/books.md rules/references-books.md
copy references/highlights.md rules/references-highlights.md
copy references/people.md rules/references-people.md
copy references/locations.md rules/references-locations.md
copy references/media.md rules/references-media.md
copy workflows/process-inbox.md workflows/process-inbox.md
copy workflows/garden.md workflows/garden.md
copy workflows/open-project.md workflows/open-project.md
copy workflows/close-project.md workflows/close-project.md
copy workflows/review-projects.md workflows/review-projects.md
copy workflows/vault-lint.md workflows/vault-lint.md
copy skills/defuddle.md skills/defuddle/SKILL.md
copy skills/json-canvas.md skills/json-canvas/SKILL.md
copy skills/vault-operations.md skills/vault-operations/SKILL.md
if [ -d "$MIRROR" ]; then
  rsync -a --delete "$TMP"/ "$MIRROR"/
else
  mkdir -p "$MIRROR"
  cp -r "$TMP"/* "$MIRROR"/
fi
rm -rf "$TMP"
echo "synced vault-rules from $SOURCE"
