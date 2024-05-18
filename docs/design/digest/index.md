# Digest of design literature

In this section we review the generally accepted knowledge around design of software systems.


## The nature of design

Tools are artifacts we use to create other artifacts @@Budgen2003.
Producing any form of artifact incorporates some form of **design** activity.
Designers have to work backwards from an intended outcome to activities that lead to that outcome:

1. Postulate a solution
1. Build a model of the solution
1. Evaluate the model against the requirements
1. Elaborate the model to produce a detailed specification of the solution

Most problems have many possible solutions.
No analytical method exists to arrive at the best solution, since it's usually necessary to trade off different
desirable characteristics.
Designing is a so-called **wicked problem** @@Rittel1973.

The output of the design process depends on both the requirements and the eventual implementation.
The designer needs to acquire domain knowledge to communicate with users.
Communicating with implementers is another important part of the designer's job.
Typically, that involves

- The static structure of the system
- The data used in the system
- The algorithms used to manipulate data
- The packaging of components that make up the system
- The interactions between the components

The design model consists of different **views** on the system addressing the above aspects.
Each of those may require a different form of representation.

Design as a **process** leads to _the_ design as the product.
Design methods and patterns help the designer through the process.
