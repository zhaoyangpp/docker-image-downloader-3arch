#!/usr/bin/env bash
set -euo pipefail

IMAGE="$1"       # e.g. nginx:latest
PLATFORM="$2"    # e.g. linux/arm/v7
ARCH_LABEL="$3"  # e.g. arm32

echo "🔹 Pulling image: ${IMAGE} for ${PLATFORM}"
docker pull --platform "${PLATFORM}" "${IMAGE}"

OUTFILE="${IMAGE//[:\/]/_}_${ARCH_LABEL}.tar"
echo "💾 Saving to ${OUTFILE}"
docker save -o "${OUTFILE}" "${IMAGE}"

echo "✅ Done: ${OUTFILE}"
