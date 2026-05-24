#!/usr/bin/env bash
# Download checkpoints from Beekeeper into ./checkpoints/
# Usage: ./download_models.sh [project_name]

set -euo pipefail

BEEKEEPER_HOST="${BEEKEEPER_HOST:-http://lab.local:5000}"
PROJECT="${1:-car-racing-dreamer-v3}"
DEST="checkpoints"
TMP="$(mktemp -d)"

echo "Downloading checkpoints from $BEEKEEPER_HOST/projects/$PROJECT ..."

curl -fsSL \
    "$BEEKEEPER_HOST/projects/$PROJECT/files/checkpoints?zip=1" \
    -o "$TMP/checkpoints.zip"

mkdir -p "$DEST"
unzip -o "$TMP/checkpoints.zip" -d "$DEST"
rm -rf "$TMP"

echo "Done. Checkpoints saved to ./$DEST/"
ls -lh "$DEST/"
