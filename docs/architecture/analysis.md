# Analysis

## Decisions

Architectures are usually documented (if at all) as a series of views @@Clements2010.
Those views are _representations_ of the architecture, however, not the architecture itself.
An architecture is what results when combining several architecturally significant decisions @@Taylor2009.

```admonish tldr title="Definition"
A decision is **architecturally significant** when

TODO: Complete

--- @@Taylor2009
```

Since architecting is the process of making architecturally significant decisions, it makes sense to look more deeply
into decision-making.

We already encountered the decision-making framework
[Cynefin](../introduction/software-engineering.md#the-cynefin-framework) @@Snowden2007.
The unwritten assumption in the industry is that software architecture lies within the _Complicated_ domain.
The sensible approach for that domain is Sense → Analyze → Respond, and that's what architects do:

- **Sense** the functional requirements and quality attributes
- **Analyze** how they interact and compare them to other systems the architect has worked on or heard about
- **Respond** by making architecturally significant decisions

Software architects seldom have formal training in decision-making and rarely use anything other than their experience
to make decisions.
Most are unaware of formal decision-making approaches, like Decision Intelligence @@Pratt2023, or even semiformal ones
like decision matrices @@DecisionMatrix.

Architects also rarely document their decisions.
It then falls unto others to reverse-engineer the decisions from the architectural views, or even from the code.
The downside of this approach is that it's impossible to retrieve the reasoning behind the decision.
This leaves several questions unanswered, like

- What prompted the decision? What problem was the architect trying to solve?
- What was the situation at the time?
- What alternatives did the architect consider?
- What were the main decision drivers?

It makes sense to capture all that information in **Architecture Decision Records** (ADRs) @@Nygard2011.


## Related decisions

Making one architecturally significant decision is hard enough, but those decisions rarely come in isolation.
Decisions have relationships with each other.

Some decisions constrain other decisions.
For instance, the choice of a programming language reduces the choices for what tools and frameworks to use.
The Go build command can't compile Ruby code.
PyTest can't test Rust code.
Using the Spring framework only makes sense with JVM languages like Java and Kotlin.

Some decisions replace earlier decisions.
Things change, so what was once a prudent decision may now have serious negative consequences that require a different
choice.
For example, if maintainers of an open source library abandon it, you'll no longer receive security fixes.
Or if your company decides to standardize on AWS, your service running on GCP needs migrating.

Combining the above two relationships, it becomes clear that there is value in keeping options open.
For instance, tools like Bazel and Gradle can each compile several languages.
Organizing code in a Hexagonal Architecture makes it easier to switch from Kafka to GCP Pub/Sub or AWS SNS & SQS
@@Cockburn2025.
