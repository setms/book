# Engineering process concepts

The software engineering process is a specialized version of the knowledge management process:

```mermaid
flowchart LR
  P[Process]
  S[Stage]
  A[Artifact]
  T[Tool]
  O[Process orchestrator]
  H[Team member]

  P--consists of-->S
  S--deliverable\ncaptured in-->A
  T--supports-->A
  O--tracks-->A
  O--invokes-->T
  O--maintains-->Task
  H--performs-->Task
  Task--references-->A
```

The specialization lies in the tools and artifacts used.
The chapters about the various stages of software development shed more light on the specifics.
For instance, for the requirements stage, the artifact would be a
[domain story](../requirements/analysis.md#learning-the-domain).
