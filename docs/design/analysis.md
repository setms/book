# Preliminary analysis

The books referenced by SWEBOK present generally accepted knowledge in the software design field.


## Ideas

Analyze the quality attributes one by one to constrain the design.

Performance:

- Each aggregate and policy has implied queues for commands and events.
  Apply queueing theory to analyze performance characteristics for individual queues and for the system as a whole.
- Split off command/event handlers that have significantly different scaling requirements.

Resilience:

- Make some queues explicit to handle issues during processing of commands/events.
- Split off command/event handlers that have big risk of causing issues, like OOM.

Security / compatibility:

- Every command arrives over a wire protocol.
  Apply input validation to convert to domain objects.

Maintainability / portability:

- Domain model is more stable than other parts.
  Apply hexagonal architecture to isolate changes.
