# Experiment 1: free viewing

24 participants (students at SR University and the University of Rajasthan, aged 18–27), one CSV file each (`A_results.csv` to `X_results.csv`).

## Procedure

1. Instructions; participants were told not to count. Space bar to start.
2. **Familiarisation**: the reference array (13 dots, mean diameter 50 px) shown 30 times for 2000 ms each, with dot sizes and positions redrawn each time, separated by a blank white screen of 950–1050 ms. No response.
3. **Test**: 72 trials, 36 per task, tasks in random order. On each trial an array was shown with the word "Number" or "Size" above it, until the participant responded: **Z** = fewer/smaller than the reference, **M** = more/larger. A blank white screen of 950–1050 ms followed. The blank screen does not mask the display.

Stimuli: black dots on a white background, at randomly chosen points of a fixed 5 × 5 lattice spaced 150 px apart (centres from screen coordinates (660, 240) to (1260, 840)). Individual diameters were random proportions of the array's total diameter, redrawn until every dot was between 10 and 140 px, so the array mean was exact. Numerosities: 4, 7, 10, 15, 18, 21. Mean diameters: 18, 25, 35, 65, 75, 90 px. Every numerosity was paired with every mean diameter; each array was used once in each task.

## Columns

| Column | Meaning |
| --- | --- |
| `Trial Number` | Trial index |
| `TrialTypeN1S2` | 1 = numerosity task, 2 = mean-size task |
| `Nvalue` | Numerosity of the array |
| `Svalue` | Mean dot diameter (px) |
| `KeyPressZsmallMgreater` | Response: 0 = Z (fewer/smaller), 1 = M (more/larger). In `F`, `I` and `R` this column is named `KeyPressZ0lessm1greater`. |
| `ReactionTime` | Response time (s) |
| `Accuracy` | 1 = correct, 0 = incorrect |

## Notes

- Excluded from the published analyses (responses on mean-size trials not predicted by mean size): `L`.
