#!/bin/bash
#
# Post-process ElevenLabs TTS clips for WoW raid alerts.
#
# Usage:
#   ./process_audio.sh <input_file> <output_name>
#
# Examples:
#   ./process_audio.sh ../path/to/downloaded.mp3 Arrow
#   ./process_audio.sh ../path/to/clip.mp3 Soak_Now
#
# Workflow:
#   1. Download your clip from ElevenLabs (Chuck Miller voice, default settings)
#   2. Run this script to post-process and place it in sound/
#
# Produces:
#   sound/<Name>.ogg  - Post-processed and ready for WoW
#
# Prerequisites:
#   - sox installed (brew install sox)
#
# Post-processing replicates the proven Audacity workflow:
#   1. Gain +3.5 dB (cuts excess dead air)
#   2. Reverb: room 1%, pre-delay 3ms, reverberance 7%, dampening 84%,
#      tone low 100%, tone high 100%, wet gain -1 dB, dry gain -1 dB,
#      stereo width 100%

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
SOUND_DIR="$PROJECT_DIR/sound"
TMP_DIR="$PROJECT_DIR/.audio-raw"

INPUT_FILE="${1:?Usage: process_audio.sh <input_file> <output_name>}"
OUTPUT_NAME="${2:?Provide the output name (e.g., Arrow)}"

if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: Input file not found: $INPUT_FILE"
  exit 1
fi

mkdir -p "$TMP_DIR" "$SOUND_DIR"

echo "Processing '$INPUT_FILE' → sound/${OUTPUT_NAME}.ogg"

# Convert input to WAV for processing
sox "$INPUT_FILE" "$TMP_DIR/${OUTPUT_NAME}_raw.wav"

# Apply the proven post-processing chain:
# 1. Gain +3.5 dB (cuts dead air)
# 2. Reverb: reverberance 7%, dampening 84%, room 1%, stereo 100%, pre-delay 3ms, wet gain -1dB
sox "$TMP_DIR/${OUTPUT_NAME}_raw.wav" "$TMP_DIR/${OUTPUT_NAME}_processed.wav" \
  gain 3.5 \
  reverb 7 84 1 100 3 -1

# Convert to OGG for WoW
sox "$TMP_DIR/${OUTPUT_NAME}_processed.wav" "$SOUND_DIR/${OUTPUT_NAME}.ogg"

echo "Done: sound/${OUTPUT_NAME}.ogg"
