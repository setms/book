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
