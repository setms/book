# Design

The process models captured in RESIN help split up the design work into manageable pieces.
We'll look at detailed design first and higher-level design/architecture later.
This makes our design approach a bottom-up one.


## Detailed design

In detailed design, we'll look at all the small pieces that make up the system in turn.
These pieces are what we call **active event storming items**:
aggregates, events, commands, policies, and read models.
Active event storming concepts find their way into code, whereas persons and external systems don't.

Just as we did some design work during requirements gathering, we're going to dig deeper into non-functional
requirements during the design phase.


### Events

Decide whether to use notification events or event-carried state transfer @@Fowler2017.
Design the event payload.
If an external system consumes the event, you'll want to document the payload in a formal schema, for example
using AsyncAPI @@AsyncAPI.
You also need to determine beforehand how to evolve the schema in the future, for instance using versions.

Clarify non-functional requirements: is it acceptable to lose an event sometimes, or not?
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
This API may be an informal one, where the policy access the read model's data directly via a Repository or Domain
Service.
This approach is appropriate when the read model is part of the same domain as the policy, as
discussed [below](#architecture).
Otherwise, design an internal API for accessing its data.
Since this is an internal API, it may not need to same level as scrutiny and documentation as an external API.

If the read model updates its data from events, then consider the non-functional requirements listed [above](#events).


### Policies

Since policies handle events, consider the non-functional requirements listed for [event handlers](#events).


### Commands

Both aggregates and external systems can accept commands.

A command for an external system depends on that system's API.
This API can take many forms, but the important part for the current discussion is that it's not something we need to
design.
The designers of the external system take care of that.

Commands accepted by aggregates come in two flavors.
If a person issues the command, then they need a user interface to do so.
Design this interface and the interaction it's part of.

If, however, an external system issues the command, then it needs an API to do so.
Does the external system need an immediate response (synchronous), can it wait for one (asynchronous),
or does it not care about one (fire-and-forget)?
For asynchronous and fire-and-forget scenarios, what delivery guarantees do we need?

Like with events, we need to design and document the schema for the payload of the API call.
We also need to design for throughput and latency requirements.


### Aggregates

Like read models, aggregates contain data, so we need to design their data models.

Since aggregates accept commands, we need to consider non-functional requirements around delivery, throughput, and
latency.
See [events](#events) above for more information.


## Architecture

With the low-level building blocks in place, we can now turn our focus to the bigger picture.


### Domains

In the event storming and DDD worlds, the word domain often pops up.
As developers, we're supposed to find our domains and subdomains, but there is little concrete advice on how to do that.
Here, we're going to give you an algorithm that accepts a process definition in RESIN as input and outputs a list of
domains.
Each (sub)domain contains active event storming items.

**TODO**: Describe the algorithm

A **module** is a compiled and packaged subdomain, like a jar file.
A **component** is an executable and deployable collection of modules, like a war file or executable fat jar
@@Richardson2023.
In the next section, we'll look at combining modules into components.


### Components

**TODO**: Attractive and repulsive forces between modules determine the components they should go into.
