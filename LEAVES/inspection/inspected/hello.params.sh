#!/usr/bin/env bash
set -euo pipefail

target="$HOME/citadel_onboard/inspected/feneris.txt"
log="$HOME/citadel_onboard/logs/hello_hashes.log"

if [[ ! -f "$target" ]]; then
  echo "ERROR: missing $target" >&2
  exit 1
fi

sha256sum "$target" | awk '{print $1}' | tee -a "$log"
echo "timestamp=$(date -Iseconds)" | tee -a "$log"
