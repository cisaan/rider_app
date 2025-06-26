#!/bin/bash

echo "Starting Auto Push Script..."

# Delete old logs if larger than 5 MB
if [ -f /Users/zeeshann/DevProjects/rider_app/auto_git_push.log ]; then
  if [ $(stat -f%z /Users/zeeshann/DevProjects/rider_app/auto_git_push.log) -gt 5242880 ]; then
    rm /Users/zeeshann/DevProjects/rider_app/auto_git_push.log
    echo "Log file was too big. Deleted and reset." > /Users/zeeshann/DevProjects/rider_app/auto_git_push.log
  fi
fi

# Navigate to your project
cd /Users/zeeshann/DevProjects/rider_app

# Always pull remote changes first (avoids non-fast-forward and divergence errors)
git pull --no-rebase origin main

# Create or update a small file to force a daily commit
echo "Last update: $(date '+%Y-%m-%d %H:%M:%S')" > last_updated.txt

# Stage all changes
git add .

# Commit with timestamp (does nothing if nothing changed)
git commit -m "chore: daily project health check - $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push origin main

echo "Auto Push Complete ✅"
