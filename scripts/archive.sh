#!/bin/sh

TARGET="${1%/}"

if [ -z "$TARGET" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

if command -v zstd >/dev/null 2>&1; then
  COMP_FLAG="--zstd"
  EXT="tar.zst"
elif command -v xz >/dev/null 2>&1; then
  COMP_FLAG="-J"
  EXT="tar.xz"
else
  COMP_FLAG="-z"
  EXT="tar.gz"
fi

echo "Compressing $TARGET to $TARGET.$EXT using $COMP_FLAG..."
tar --format=pax $COMP_FLAG -cvf "$TARGET.$EXT" "$TARGET"
