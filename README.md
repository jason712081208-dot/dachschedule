# Dachschedule

A cute university timetable generator for dog lovers — dachshund-themed, of course.

## Requirements

- XeLaTeX (required for CJK and custom font support)

## Usage

Load the class in your document:
```latex
\documentclass[tmu]{dachschedule}
```

### Options

| Option | Description |
|--------|-------------|
| `ntu` | (default) NTU-ish class times: 8:10, 9:10, 10:20, 11:20 … |
| `tmu` | TMU-ish class times: 8:10, 9:10, 10:10, 11:10 … |

### The `schedule` Environment

Wrap all your courses in a `schedule` environment, which draws the timetable grid:
```latex
\begin{schedule}
  % \course commands go here
\end{schedule}
```

### The `\course` Command
```latex
\course{<weekday>}{<start>}{<end>}{<name>}{<place>}
```

| Argument | Type | Description |
|----------|------|-------------|
| `weekday` | integer 1–5 | Day of the week (1 = Monday, 5 = Friday) |
| `start` | integer 1–10 | Starting period |
| `end` | integer 1–10 | Ending period (same as `start` for a single-period course) |
| `name` | text | Course name; CJK characters supported |
| `place` | text | Room or location; CJK characters supported |

The span `end - start` determines which dog illustration is used (longer courses get longer dogs).

## Example
```latex
\documentclass[tmu]{dachschedule}
\begin{document}
\begin{schedule}
  \course{1}{6}{9}{口胚及口胚實}{2302}
  \course{2}{3}{4}{生化}{2102}
  \course{3}{6}{9}{牙形實}{口醫3F}
\end{schedule}
\end{document}
```

See `main.tex` for a full example.

## Note

Only compile from the project root.