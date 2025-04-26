#!/bin/bash

echo "Starting Auto Push Script..."

# Navigate to your project
cd /Users/zeeshann/DevProjects/rider_app

# Create or update a small file to force a daily commit
echo "Last update: $(date '+%Y-%m-%d %H:%M:%S')" > last_updated.txt

# Stage all changes
git add .

# Commit with timestamp
git commit -m "Auto commit: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push origin main

echo "Auto Push Complete ✅"
