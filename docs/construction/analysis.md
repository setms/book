# Analysis

## Materials

The implementation step of the [engineering design process](../introduction/engineering.md#design-process) requires
the engineer to select the right materials to realize the design.
Materials have properties, grouped in categories, that affect their performance in the solution.
These properties follow for the material's physical make-up: its atoms, electrons, and molecular structure.

Software works with bits rather than atoms.
Bits and collections of them, like atoms, have properties too.

### Information

Bits can represent static information.
From this perspective, various properties are interesting:

- **Storage**
  - Durability
  - Format
  - Language
  - Quality
    - Freshness
    - Correctness
    - Completenes
  - Volume
    - Size
    - Compression

- **Privacy**
  - Classification (public, confidential, personal, protected)
  - Permission (consent, legitimate use)
  - Lineage
  - Non-repudiation

### Process

Bits can also represent a process that manipulates information.
From this perspective, other properties are interesting:

- **Transfer**
  - Style (synchronous, asynchronous, fire & forget)
  - Control (push, pull)
  - Protocol
  - Throughput
  - Latency
- **Transformation**
  - Type (projection, selection, aggregation, conversion, mutation, deletion)
  - Concurrency control
  - Reliability
    - Availability
    - Fault tolerance
    - Correctness
    - Usability

### Other

Whether the bits represent static information or a process that operates on such information, there are properties
that both forms have in common.
Cost is an obvious one, but another important category is security (encryption, authentication, authorization).
