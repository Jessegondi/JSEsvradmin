#!/bin/bash
REPO_DIR="$HOME/JSEsvradmin"
LOG="$HOME/deploy.log"

cd "$REPO_DIR" || exit 1
git fetch origin main

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
  git pull origin main
  echo "$(date): updated to $(git rev-parse --short HEAD)" >> "$LOG"
else
  echo "$(date): already up to date" >> "$LOG"
fi
