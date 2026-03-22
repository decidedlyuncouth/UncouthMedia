---
name: TTS alert generation workflow
description: Co-guild leader's proven workflow for generating WoW raid alert voice clips using ElevenLabs + Audacity post-processing
type: reference
---

Proven TTS workflow for raid mechanic alert clips (from co-guild leader):

**Generation:** ElevenLabs, Chuck Miller voice, default settings.

**Post-processing in Audacity:**
1. Gain: +3 to +4 dB (cuts excess dead air between words)
2. Reverb settings:
   - Room size: 1%
   - Pre-delay: 3ms
   - Reverberance: 7%
   - Dampening: 84%
   - Tone low: 100%
   - Tone high: 100%
   - Wet gain: -1 dB
   - Dry gain: -1 dB
   - Stereo width: 100%
   - Wet only: unchecked

**Why:** Local TTS tools (Kokoro, Piper, Chatterbox) all produce flat conversational output — no amount of sox post-processing fixes the lack of vocal energy. ElevenLabs voices have built-in expressiveness that local models lack.

**How to apply:** Use this as the baseline workflow for generating raid alert clips. The sox equivalent of these Audacity settings can be scripted for automation.
