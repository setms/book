# Analysis

**Analysis** involves reaching a richer and more precise understanding of each requirement and representing sets of
requirements in multiple ways.
A **feature tree** organizes features in logical groups and hierarchies.

Model the environment.
A **context diagram** shows how the system fits in the ecosystem @@Brown2016.
An **ecosystem map** is similar, but also shows external systems that the product doesn't itself interact with.

Model the system.
An **analysis model** is a diagram that depicts requirements visually, which sometimes makes it easier to find flaws.
Analysis models blur the line between requirements and design, so be explicit about your intentions with a model.

The different analysis models each have their own strengths and weaknesses, so pick something based on your situation:

- A **Data Flow Diagram** (DFD) shows the processes of a system, the data stores, any external systems, and the flows
  of data between them.
  You can nest DFDs by expanding a process into its own DFD.
  A  level-0 DFD looks a lot like a context diagram.
- A **data model** depicts the system's data relationships.
  It provides a high-level view of the data, while the data dictionary gives the details.
  An **Entity Relationship Diagram** (ERD) is a common format for a data model.
  In an ERD, rectangles represent **entities**, the physical items, people, or aggregation of data.
  Entities are also known as records or data structures.
  Entities have attributes, which the data dictionary describes.
  Diamond shapes in the ERD represent relationships between entities.
  Numbers show the cardinality of the relationships.
  Entities show up in data stores in a DFD.
  Their attributes appear in report specifications.
  A **CRUD matrix** correlates use cases with Create, Read, Update, and Delete actions on entities.
- A **swimlane diagram** shows the steps of a business process or the operations of a software system.
  They consist of several lanes that represent different systems or actors executing steps.
  Swimlane diagrams can show what happens inside a process of a DFD.
  They resemble UML activity diagrams.
- A **State Transition Diagram** (STD) shows state changes.
  We already saw this kind of model in the [introduction](../../introduction/software.md#finite-automata).
  UML has a similar diagram known as a _state machine diagram_ @@UML.
  _Transition tables_ show the same information as STDs in matrix form.
  These models are especially relevant for real-time systems.
- A **dialog map** shows navigation between screens of the system.
  It's basically a user interface modeled as an STD.
  Dialog maps should show detailed screen layouts, but focus on the essence of the interactions.
- A **decision table** lists the various values for all factors that influence the behavior of a system, along
  with the expected response.
  A **decision tree** shows the same information graphically.
- An **event-response table** (aka event table, or event list) list all events that may occur in the system, along
  with the expected response.
  An **event** is a change or activity in the environment that requires a response from the system.
  A **business event** comes from a human user, a **temporal event** from the passing of time, and a **signal event**
  from hardware or an external system.
  The expected response depends on the system's state.
  Event-response analysis is especially valuable for real-time systems.

Different systems have differing needs for formality.
Safety-critical, security-critical, and mission-critical elements of the system are good candidates for modeling.


## Prototypes

**Prototypes** are partial or preliminary implementations that make concepts and possibilities more tangible.
Their main goal is to reduce risk, so only build them to address high-risk or high-impact issues.
A prototype is an experiment to validate the hypothesis that requirements are sufficiently defined and that
user interaction and architectural issues are sufficiently addressed.
Seen from that lens, it makes sense to build several prototypes.

Prototypes focus either on user experience (mock-up) or technical soundness of a proposed approach (proof of concept).

**Mock-ups**, also known as horizontal prototypes, imply behavior without implementing it.
They can be self-contained screens or a structure the user can navigate (dialog map).
They often address the look and feel of the user interface.
Mock-ups help stakeholders state requirements, because it's easier to critique than to conceive, especially
when it comes to completeness and errors.

A **proof of concept**, or vertical prototype, implements a slice of functionality from user interface through all the
technical layers.
Use it to test a proposed technical approach, or to optimize algorithms.
Where a mock-up focuses on usability, proof of concepts focus on more technical quality attributes.

You can build mock-ups and proof of concepts with different precision.

Paper and electronic sketches or diagrams are **low-fidelity prototypes** used to explore functionality and flow.
**High-fidelity prototypes** allow definition of a precise look and feel.
Low-fidelity prototypes are faster to develop and thus allow for faster iteration on ideas.
High-fidelity prototypes risk endless discussions about details, so remind everyone that we're just trying to get the
requirements right, not designing yet.

A **throwaway prototype** lives only as long as required to reduce risk.
You build it as fast as possible, without regards for sound engineering practices.
Stakeholders may pressure the team to grow a throwaway prototype into the final product, but this is seldom a good idea.
It would be expensive to get it up to quality standards.
Low-fidelity prototypes are less susceptible to this pressure than high-fidelity ones.
Address this potential pressure up front by setting specific expectations about the purpose of the prototype, or
what experiment you're running.
If you build a high-fidelity throwaway prototype, add in time delays to prevent stakeholders getting the wrong
impression about performance.

An **evolutionary prototype**, in contrast, is an increment on the path towards a final product.
It must therefore meet all applicable quality standards.
When planned well, the first couple of increments can reduce risk just like for throwaway prototypes, although they take
a bit more time to develop.

You'll learn more from observing users work with a prototype than from asking them about it.
Don't forget to include all relevant stakeholders when evaluating a prototype.


## Prioritization

Customers set requirement priorities based on the contribution towards business objectives.
Priorities are especially important for non-functional requirements, since conflicts between quality attributes are a
fact of life.
You need to define which quality attributes are most important for the system, so that developers can make proper
trade-offs.
Priorities may be different for different parts of the system.

Make sure to cover all stakeholders when setting priorities.
It's easy to forget about support staff, for example.
Achieving consensus among all stakeholders may be challenging.
Define a set of criteria upfront for judging whether one requirement has higher priority than another.
Examples of such criteria are business value, technical risk, cost, time to market, and contractual commitments.
In case of conflicts, favored user classes get preference.

One tool for resolving conflicts is a matrix of requirements against themselves, where the cells show which is
more important.
However, this approach becomes unwieldy for larger requirement sets.

A better tool is to divide all requirements into high, medium, and low.
Assess each requirement on the dimensions of importance and urgency.
Then urgent/important simplifies to high, not urgent/important to medium, not important/not urgent to low.
Don't do urgent/not important at all or, if you must, assign them low priority.

Most stakeholders assign high-priority to 85% of all requirements.
To prevent that, run the important/urgent method again on just the high features, using the labels highest/higher/high
instead of high/medium/low.
Map high and higher to medium in the original set of requirements and keep only highest as high.

**Quality Function Deployment** (QFD) is a more rigorous technique.
It's based on the benefit provided by a feature, the penalty paid if that feature is absent, its cost, and
implementation risk.
Construct a matrix with these factors as columns and the requirements as rows.
Each cell gets a value between 1 and 9, inclusive, and each factor gets a weight.
Calculate the total value as the weighted average of benefit and penalty.
Calculate the percentage of total cost and total risk as well.
Then priority = value / (cost % + risk %).

Using QFD takes a lot of effort, especially since you need to calibrate the weights.
You may want to spend this effort only for high priority requirements, as obtained by other methods, or when
stakeholders can't reach consensus.

Other prioritization techniques exists, like MoSCoW, or giving participants $100 to "buy" requirements.
These often have considerable drawbacks, such as being open to gaming.

The priority of a requirement should be one if its attributes in the SRS.

A high-priority requirement may depend on a lower-priority requirement.
In that case, the lower-priority requirement must come first despite its lower priority.

Software has a cost, which developers estimate.
Customers should respect those estimates.
Some features may be expensive or even infeasible.
Sometimes changing features can make them attainable or cheaper.

Priorities and cost estimates together make it possible to deliver maximum value at the lowest cost at the right time.
Non-functional requirements that affect the architecture should receive high priority, because rearchitecting is
expensive.
Priorities may change over time.
