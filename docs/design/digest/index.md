# Digest of design literature

In this section we review the generally accepted knowledge around design of software systems.


## The design process

Tools are artifacts we use to create other artifacts @@Budgen2003.
Producing any form of artifact incorporates some form of **design** activity and software is no exception.

Most design problems have many possible solutions.
No analytical method exists to arrive at the best solution, since it's usually necessary to trade off different
desirable characteristics.
Designing is a so-called **wicked problem** @@Rittel1973.

Designers have to work backwards from an intended outcome to activities that lead to that outcome:

1. Postulate a solution
2. Build a model of the solution
3. Evaluate the model against the requirements
4. Elaborate the model to produce a detailed specification of the solution

The input to the design process are the requirements, along with resource, organizational, and other constraints.
Examples of the latter are a prescribed runtime environment or architectural style.
The designer needs to acquire domain knowledge to communicate with users about requirements.

The output of the design process is an abstract model of the software.
Typically, that consists of

- The static structure of the system
- The data used in the system
- The algorithms used to manipulate data
- The packaging of components that make up the system
- The interactions between the components

The design model consists of different [views](views.md) on the system addressing the above aspects.
Each of those may require a different form of representation.

Design as a **process** leads to the design as the **product**.
Design [methods](methods.md) guide the designer through the process.
Most design processes have two distinct phases:

1. A closed box phase focusing on the problem, also known as architectural or logical design.
2. An open box phase which focuses on the solution, also known as detailed or physical design.
    This phase maps problem units onto solution units, often via systematic elaboration.

We can speed up the design process by reusing parts of previous designs, for example using design patterns @@Gamma1995.
