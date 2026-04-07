#!/bin/bash
# TPK Skills Auto-Sync from GitHub
# Chạy: ./sync.sh hoặc schedule với cron

set -euo pipefail

REPO_URL="https://github.com/<YOUR_ORG>/tpk-skills.git"
SKILLS_DIR="$HOME/.claude/skills/tpk"
LOG_FILE="$HOME/.claude/skills/tpk-sync.log"

log() {
    echo "[$(date)] $1" | tee -a "$LOG_FILE"
}

# Check nếu repo đã tồn tại
if [ -d "$SKILLS_DIR/.git" ]; then
    log "Pulling latest from GitHub..."
    cd "$SKILLS_DIR"
    git pull origin main
else
    log "Cloning repository..."
    mkdir -p "$(dirname "$SKILLS_DIR")"
    git clone "$REPO_URL" "$SKILLS_DIR"
fi

log "Sync completed successfully"
