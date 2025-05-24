# Architecture & design

The process models captured in RESIN help split up the design work into manageable pieces.
We can either design those pieces in detail first (design) or group them into modules and components first (architecture).
We don't care about the order in which you do this, as long as you do both.
You can even do them in parallel if you want to.

In the following, we're going to look at the architecture first and then the design.


## Architecture

With the low-level building blocks in place, we can now turn our focus to the bigger picture: modules and components.

A **module** is a compiled and packaged subdomain, like a jar file.
A **component** is an executable and deployable collection of modules, like a war file or executable fat jar
@@Richardson2023.

The purpose of modules is to provide internally cohesive units with minimal dependencies on other modules.
To assign event storming elements to modules, we're going to focus first on the active elements, since they're the
ones that make decisions.
Here's how we define the dependencies between active elements:

| From \ To      | Aggregate | Policy   | Read Model   |
|----------------|-----------|----------|--------------|
| **Aggregate**  | X         | Contract | None         |
| **Policy**     | Contract  | X        | Availability |
| **Read Model** | Contract  | None     | X            |

In this table, we define the following coupling strengths for the dependencies:

- **Availability**: the dependent element can't function if the dependency is unavailable
- **Contract**: the dependent element can function without its dependency, but it depends on its dependency's contract
for the information it provides
- **None**: the elements are independent of each other

Let's look at each of these dependencies in more detail:

- An **aggregate** depends on a **policy** if the policy issues commands to the aggregate.
  This is contract coupling, since the aggregate can function without the policy, but it needs to know the contract
  for the commands it accepts.
- A **policy** depends on an **aggregate** if the policy handles an event emitted by the aggregate.
  This is again contract coupling.
- A **policy** depends on a **read model** if the policy needs data from the read model to make a decision.
  This is availability couling, since the policy can't make a decision without the data from the read model.
- A **read model** depends on an **aggregate** if the read model needs to update its data based on an event emitted by
  the aggregate.
  This is again contract coupling.

Based on these definitions for dependencies, we can convert an event storm into a dependency graph.
However, an even more interesting visualization is a Design Structure Matrix (DSM).

A **Design Structure Matrix** (DSM) is a network modeling tool that represents the elements comprising a system and
their interactions @@Eppinger2012.
As such, a DSM highlights the system's architecture.
A DSM is an NxN square matrix, where the N rows and N columns each get the name of the system's elements.
The diagonal of the matrix represents the elements.
Off-diagonal elements represent the dependencies between the elements.
In a **binary DSM**, the off-diagonal elements are either 0 (no dependency) or 1 (dependency).
Dependencies are usually marked with `X`, whereas empty cells represent no dependency.
In a **numerical DSM**, the off-diagonal elements are numbers representing the strength of the dependency.

We can use the dependency table above to create a numerical DSM if we assign numbers to the coupling strengths:

- **Availability**: 1.0
- **Contract**: 0.6
- **None**: 0

The advantage of having this information in the form of a DSM is that there are algorithms that operate on DSMs to
cluster its elements.
Those clusters minimize the dependencies between the clusters and maximize the dependencies within the clusters.
Since this is exactly what we want for our modules, we can equate a DSM cluster to a module.

_TODO_: Assign commands and events to modules.


### Components

Modules follow from the domains, which follow from the requirements.
This is the easy part, since it depends on the technical system alone.
Components, however, need developing and operating, which brings in the social part of the sociotechnical system.
As a result, the "algorithm" for determining component boundaries isn't as straightforward.

However, on a high level, we can play the same game as with modules.
We build a DSM where the elements are the modules and run a clustering algorithm on it.
The problem is in finding the strengths of the dependencies between the modules.

_TODO_: Compare to attractive/repulsive forces between modules. Or is this the first step where we find the
"naive architecture" as defined in residuality theory?
_TODO_: How does residuality theory factor in to create an architecture exhibiting criticality?


## Design

In detailed design, we'll look at all the small pieces that make up the system in turn.
To determine those pieces, let's divide the RESIN elements into categories:

- **External**: _persons_ and _external systems_ fall outside the scope of the system and therefore don't need designing
  or architecting
- **Active**: _aggregates_, _policies_, and _read models_ are the elements that make decisions (whether/how to update
  data, whether to emit events, whether to issue commands)
- **Passive**: _events_ and _commands_ just carry data from one place to the next

We need to design the active and passive elements of the system.

Just as we did some design work during requirements gathering, we're going to dig deeper into quality attribute
requirements during the design phase.


### Events

Decide whether to use notification events or event-carried state transfer @@Fowler2017.
Design the event payload.
If an external system consumes the event, you'll want to document the payload in a formal schema @@AsyncAPI @@CloudEvents.
You also need to determine beforehand how to evolve the schema in the future, for instance using versions.

Clarify quality attribute requirements: is it acceptable to lose an event sometimes, or not?
If not, you'll need a message broker with appropriate durability guarantees.
Likewise, is it acceptable for an event to arrive at the system multiple times?
If so, the event handlers need to be idempotent.
If not, the message broker needs to support _exactly once_ delivery, which impacts latency.

Get a sense of how many events of a particular type the system must handle.
If this sounds like a lot, you may want to do some modeling to get a feel of whether it's feasible.
Queueing theory models, like M/M/s @@Kleinrock1974, may be useful to determine how many event handler instances
you'll need.
You may need to do some prototyping to determine how long it'll take to handle a single event before you can use
such models.


### Read models

Read models contain data, so we need to design their data models.
Use ER-diagrams or similar notation for this purpose.

If the read model helps a user to issue a command, then a user interface must expose the read model.
Design this interface and the interaction it's part of.

If the read model feeds into a policy, then it needs an API.
This API may be an informal one, where the policy accesses the read model's data directly via a Repository or Domain
Service.
This approach is appropriate when the read model is part of the same domain as the policy, as
discussed [below](#architecture).

Otherwise, design an internal API for accessing its data.
Since this is an internal API, it may not need to same level as scrutiny and documentation as an external API.

If the read model updates its data from events, then consider the quality attribute requirements listed [above](#events).


### Policies

Since policies handle events, consider the quality attribute requirements listed for [event handlers](#events).


### Commands

Both aggregates and external systems can accept commands.

A command for an external system depends on that system's API.
This API can take many forms, but the important part for the current discussion is that it's not something we need to
design.
The designers of the external system take care of that.

Commands accepted by aggregates come in two flavors.
If a person issues the command, then they need a user interface to do so.
Design this interface and the interaction it's part of.

If, however, an external system or policy issues the command, then it needs an API to do so.
Does the issuer need an immediate response (**synchronous**), can it wait for one (**asynchronous**),
or does it not care about one (**fire-and-forget**)?
For asynchronous and fire-and-forget scenarios, what delivery guarantees do we need?

Like with events, we need to design and document the schema for the payload of the API call.
This can take various forms @@OpenAPI @@AsyncAPI @@GraphQL.
We also need to design for throughput and latency requirements.


### Aggregates

Like read models, aggregates contain data, so we need to design their data models.

Since aggregates accept commands, we need to consider quality attribute requirements around delivery, throughput, and
latency.
See [events](#events) above for more information.
