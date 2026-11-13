# Experiment 3: masked presentation

19 participants (undergraduate students at Krea University, aged 18–22), one CSV file each (`P01` to `P19`, in testing order). Identifiers have been replaced by codes.

## Procedure

Run in a full-screen browser with a self-contained HTML/JavaScript program (in the code repository: `experiment/exp3_masking.html`).

1. Consent and demographics.
2. **Familiarisation**: the reference array (13 dots, mean diameter 50 px) shown 8 times for 2000 ms each, separated by 500 ms blank screens. The reference values were also given in words.
3. **Practice**: 8 trials at 500 ms with feedback.
4. **Test**: 288 trials, no feedback, break every 72 trials. Each trial: cue word NUMBER or SIZE (500 ms) → fixation cross (500 ms) → test array (68 ms requested; 66.7 ms realised, i.e. 4 frames at 60 Hz or 5 at 75 Hz; or 500 ms) → random-checkerboard pattern mask (500 ms) → unspeeded response (**Z** = fewer/smaller, **M** = more/larger).

Design: task (2) × duration (2) × cued level (6) × uncued level (3) × 4 repetitions. Numerosity trials: numerosity 4, 7, 11, 15, 18, 21; uncued mean diameter 30, 50 or 80 px. Mean-size trials: mean diameter 18, 25, 35, 65, 75, 90 px; uncued numerosity 8, 13 or 20. The middle uncued value equals the reference.

Stimuli: black dots on a white 600 × 600 px field, placed anywhere with at least 2 px between edges; individual diameters normally distributed (SD 15 px) around the mean, clipped to 10–140 px and re-centred so the array mean was exact.

## Columns

| Column | Meaning |
| --- | --- |
| `participant` | Anonymised code |
| `age`, `gender`, `handedness`, `vision` | Self-reported |
| `trialkind` | `practice` or `test` |
| `task` | `NUMBER` or `SIZE` (the cued dimension) |
| `stim_n`, `stim_size` | Numerosity and nominal mean diameter (px) |
| `duration_ms` | Requested duration (68 or 500) |
| `rel_value`, `irr_value` | Cued and uncued values |
| `congruency` | `congruent`, `incongruent` or `neutral` |
| `corr_ans`, `response`, `correct` | Correct key, key pressed (`z`/`m`), accuracy |
| `rt` | Response time (ms) |
| `target_ms_actual`, `mask_ms_actual` | Measured array and mask durations (ms) |
| `target_frames`, `mask_frames` | Frames requested |
| `refresh_hz`, `frame_ms` | Measured refresh rate and frame duration |

## Notes

- Excluded from the published analyses (cued dimension did not predict responses at 500 ms): `P05`, `P08`, `P16`. A stricter sensitivity set also excludes `P02` and `P19`.
