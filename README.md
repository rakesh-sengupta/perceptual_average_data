# perceptual_average_data

Data for the three experiments in

> Sengupta, R., Shukla, A., Pareek, S., Prusty, A., & Sultana, S. Exploring the interaction of enumeration and perceptual averaging across varied presentation durations. *Attention, Perception, & Psychophysics* (under revision).

Observers compared the numerosity or the mean size of dot arrays with a remembered reference (13 dots, mean diameter 50 px).

| Folder | Experiment | Participants | Presentation |
| --- | --- | --- | --- |
| `Experiment 1/` | 1 | 24 | Free viewing |
| `Experiment 2/` | 2 | 49 (53 files, 4 duplicates) | 68, 500 or 1000 ms, no mask, task indicated after the array |
| `Experiment 3/` | 3 | 19 | 67 or 500 ms followed by a pattern mask, task cued before the array |

Each folder has a README describing the procedure, the CSV columns and the participants excluded from the published analyses. Please read the note on duplicate files in `Experiment 2/README_exp2.md` before analysing Experiment 2.

All analysis and simulation code, including the Experiment 3 program, is at https://github.com/rakesh-sengupta/perceptual_average_code. Its `run_all.sh` takes the path to this repository and reproduces every analysis, table and figure in the article.

`exp_analyze.m` in the Experiment 1 and 2 folders is the original MATLAB analysis used for the first submission. The revised article re-analyses all three experiments with the Python code in the code repository.
