# Analysis

## Decisions

Architectures are usually documented (if at all) as a series of views @@Clements2010.
Those views are _representations_ of the architecture, however, not the architecture itself.
**The architecture is the set of principal design decisions @@Taylor2009.**
Architects make these decisions over time, whereas architectural views reflect the decisions' aggregate result at a
particular moment.

If the architecture is the set of principal design decisions, then it makes sense to look more deeply
into decision-making.

We already encountered the decision-making framework
[Cynefin](../introduction/software-engineering.md#the-cynefin-framework) @@Snowden2007.
The unwritten assumption in the industry is that software architecture lies within the _Complicated_ domain.
The appropriate approach for that domain is Sense → Analyze → Respond, and that's what architects do:

- **Sense** the functional requirements and quality attributes
- **Analyze** how they interact and compare them to other systems the architect has worked on or is otherwise familiar
  with
- **Respond** by making principal design decisions

Software architects seldom have formal training in decision-making and rarely use anything other than their experience
or fashion to make decisions.
Most are unaware of formal decision-making approaches, like Decision Intelligence @@Pratt2023, and decision-making
tools, like decision matrices @@WikipediaDM.

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

Making one principal design decision is hard enough, but those decisions rarely come in isolation.
Decisions have relationships with each other.

**Some decisions constrain other decisions.**
For instance, the choice of a programming language reduces the choices for what tools and frameworks to use.
The Go build command can't compile Ruby code.
PyTest can't test Rust code.
Using the Spring framework only makes sense with JVM languages like Java and Kotlin.

**Some decisions replace earlier decisions.**
Things change, so what was once a prudent decision may now have serious negative consequences that require a different
choice.
For example, if maintainers of an open source library abandon it, you'll no longer receive security fixes.
Or if your company decides to standardize on AWS, your service running on GCP needs migrating.

Combining the above two relationships, it becomes clear that there is value in keeping options open.
For instance, tools like Bazel and Gradle can each compile several languages.
Or organizing code in a Hexagonal Architecture @@Cockburn2025 makes it easier to switch from Kafka to GCP Pub/Sub or
AWS SNS & SQS.

**Some decisions lead to further decisions.**
For example, suppose your application is running in a private datacenter, and you make the high-level decision to move
it to AWS.
Then there must be follow-up decisions about using EC2 vs ECS vs EKS, whether to use RDS or DynamoDB, etc.
Or if you decide on a microservices architecture, then you also have to decide between storing code in a monorepo or in
multiple repositories.

Since decisions have relationships, you can think of them as nodes in a **decision graph**.
Viewing them that way opens up the door for using graph-based tools and techniques, but this rarely happens in practice.


## Architecture decisions

Now that we've looked at general decision-making, let's turn back to architecture.
If architecture is the set of principal design decisions, then it follows that architects need to make decisions about
important design alternatives.

We see different groups of principal design decisions:

- **Common decisions** are those that architects need to make for (virtually) all software systems.
  For instance, every system benefits from a decision about its architectural style (layered, pipe-and-filter,
  event-based, etc).
  Likewise, every system needs a programming language for implementation, along with build tool, testing framework, etc.
- **Category-specific decisions** are those that come up for certain categories of software systems.
  For example, every microservices architecture requires making a decision about how to deal with distributed
  transactions (choreography, orchestration).
  Likewise, every event-based system needs decisions about what type each event is (notification, event-carried state
  transfer).
- **Context-specific decisions** are those that are unique for a given software system or small set of systems.

Architects must be well-versed in making common decisions.
It may make sense for them to specialize in a certain category of architecture, to become proficient at
category-specific decision-making as well.
Finally, they must understand decision-making tools and techniques well enough to handle the inevitable
context-specific decisions.
