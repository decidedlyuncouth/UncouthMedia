# Audio Generation Workflow

## Step 1: Generate clips in ElevenLabs

1. Go to [ElevenLabs](https://elevenlabs.io) and open the text-to-speech tool
2. Select voice: **Chuck Miller - Deep, Raspy, American**
3. Set model: **Eleven v3**
4. Sidebar settings:
   - **Stability:** Natural (dead center)
   - All other settings: default
5. Type your alert text (e.g., "Arrow on you!") and generate
6. ElevenLabs produces multiple generations — listen to each and pick the one with the best clarity and energy
7. Download the chosen generation as MP3

## Step 2: Post-process with sox

Drop the downloaded MP3 into `.audio-raw/`, then run:

```bash
cd .build
./process_audio.sh ../.audio-raw/your_clip.mp3 ArrowOnYou
```

This applies:
- **Gain +3.5 dB** (cuts excess dead air between words)
- **Reverb:** room 1%, pre-delay 3ms, reverberance 7%, dampening 84%, tone low 100%, tone high 100%, wet gain -1 dB, dry gain -1 dB, stereo width 100%

Output lands in `sound/<Name>.ogg`, ready for WoW.

## Naming Convention

Output files use **PascalCase** (no underscores):
- `ArrowOnYou.ogg`
- `SpreadOut.ogg`
- `UseDefensive.ogg`

## Prerequisites

- **sox** — `brew install sox`
