# Experiment 2: brief unmasked presentation

53 session files from 49 distinct participants (students aged 18–27). See **Notes** for the four duplicate files.

## Procedure

1. Instructions; participants were told not to count. Space bar to start.
2. **Familiarisation**: as in Experiment 1 (30 reference displays of 2000 ms, blank white screen of 950–1050 ms between them).
3. **Test**: 216 trials, 108 per task, tasks in random order. Each trial: fixation cross (1000 ms) → test array for 68, 500 or 1000 ms → response screen with the word "NUMBER" or "SIZE", shown until the response (**Z** = fewer/smaller, **M** = more/larger) → blank white screen of 950–1050 ms. The task was therefore indicated only after the array had gone. The blank screen does not mask the display.

Durations were timed by waiting between screen refreshes rather than by counting frames, so each was rounded up to the next refresh; at 60 Hz the 68 ms display was probably on screen for 5 frames (about 83 ms).

Stimuli: as in Experiment 1. Within each task and duration (36 trials), each numerosity and each mean diameter appeared six times; the pairing of numerosity with mean diameter varied between participants. Both tasks used the same sequence of arrays.

## Columns

| Column | Meaning |
| --- | --- |
| `Trial Number` | Trial index |
| `TrialTypeN1S2` | 1 = numerosity task, 2 = mean-size task |
| `Nvalue` | Numerosity of the array |
| `Svalue` | Mean dot diameter (px) |
| `time` | Requested presentation duration (s): 0.068, 0.5 or 1 |
| `KeyPressZsmallMgreater` | Response: 0 = Z (fewer/smaller), 1 = M (more/larger) |
| `ReactionTime` | Response time (s), from the onset of the response screen |
| `Accuracy` | 1 = correct, 0 = incorrect |
| `displaytime` | Present in four files only; not used |

## Notes

- **Duplicate files.** Four files are exact trial-by-trial copies of others (same stimuli, responses and response times) and must not be analysed as separate participants: `AD_results.csv` and `AL_results.csv` duplicate `AAA.csv`; `AX_results.csv` duplicates `AK_results.csv`; `AY_results.csv` duplicates `AAB.csv`. They are kept here unchanged so that the original upload is preserved; the analysis code drops them automatically.
- **Incomplete session.** `S_results.csv` has 99 of 216 trials and is excluded.
- **Excluded from the published analyses** (cued dimension did not predict responses in one or both tasks): `AAC`, `AE`, `AG`, `AK`, `AR`, `AV`, `AW`, `I`, `T`.
