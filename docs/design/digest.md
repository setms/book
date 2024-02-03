# Digest of design literature

In this section we review the generally accepted knowledge around design of software systems.


Component failures in a sociotechnical system are inevitable: people make mistakes, software bugs produce undesirable
behavior, and hardware burns out.
We should therefore design systems so that individual components don't lead to system failure.
Strategies to achieve and enhance [dependability](../requirements/digest/elicitation.md#non-functional-requirements)
rely on both redundancy and diversity.
**Redundancy** means that the system has spare capacity to cover for failed parts.
**Diversity** means that redundant components are of different types, increasing the chance they won't fail in the same
ways.
Redundancy and diversity make systems more complex and thus harder to understand.
