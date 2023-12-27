# Preliminary analysis

The books referenced by SWEBOK present generally accepted knowledge in the software design field.


## Ideas

You can't just look at all the requirements and come up with a design that satisfies them all.
By necessity, you start with a subset and expand from there.
Therefore, you may as well take them one by one.

Architecture is the big picture design.
You should tackle that first before you go into detailed design.
Architecture is about meeting non-functional requirements.
Analyze the quality attributes one by one to constrain the high-level design.

Maintainability / portability:

- The domain model is more stable than technical parts, like what storage solution to use.
  Apply hexagonal architecture to isolate changes in those parts from the domain model.

Security / compatibility:

- Commands arrives over a wire protocol.
  Apply input validation while mapping their data to domain objects.
- Apply output encoding when mapping domain objects to outputs.

Performance / scalability:

- Each aggregate and policy has implied queues for accepting commands and handling events.
  Apply queueing theory to analyze performance characteristics for individual queues and for the system as a whole.
  This analysis is usually computationally intractable, so it's best to measure arrival and service times
  and store them as metrics.
  Then scale dynamically based on those metrics.
- Some commands require synchronous processing, because the caller needs a result.
  The latency for processing such commands is the laterncy of the entire process.
  For asynchronous commands, the latency is just the work for validating the input.
  Use asynchronous commands where possible, to give faster feedback.
- Split off command/event handlers that have significantly different scaling requirements into their own processes, so
  they can scale independently.

Resilience:

- Make some queues explicit to handle issues during processing of commands/events by retries.
  This requires that the handling code is idempotent.
- Split off command/event handlers that have a big risk of causing issues, like OOM, to reduce impact on other parts.
- Define what liveness means for each process.
 Use an orchestration tool to automatically restart processes that fail the liveness test.
- Use load shedding when performance requirements aren't met to preserve uptime.
  Detect this using the metrics defined in these requirements.

Once done with non-functional requirements, continue with functional requirements.
Again, do one requirement at a time.
