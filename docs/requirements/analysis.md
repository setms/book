# Preliminary analysis

Most engineering disciplines specialize around a domain.
Engineers trained in that field speak the same language as the people requesting them to build a system.
In contrast, software developers need to learn the language of the domain.

The practices around learning a new domain lack a theoretical underpinning.
One would expect references to the fields of education or knowledge management.
Instead, the simplistic model is to talk to subject-matter experts (SMEs) and to write down what you hear.
Of course this results in problems when we attempt to tap into an SME's vast tacit knowledge.

Domain-Driven Design (DDD) is a step in the right direction @@Evans2014.
It offers the _domain model_ as help in requirements elicitation.
However, the books that SWEBOK V3 posits as the body of knowledge for requirements don't mention DDD.
Neither does the V4 draft.

The requirements themselves are much more fluid than in the traditional engineering fields.
As an example, let's look at scale requirements.
A civil engineer, for example, designs a bridge for a given load.
If that load in practice turns out to be two orders of magnitude higher, then a new bridge is necessary.
Software systems are routinely expected to scale that much and more.

And this assumes that the requirements are clear in the first place.
The Lean Startup movement assumes we can only find out what works by trying it out @@Ries2011.
This would put requirements development in the _Complex_
[Cynefin domain](../introduction/software-engineering.md#the-cynefin-framework), rather than in the _Complicated_
realm of engineering.

Another problem is the advice to state requirements in an abstract way, only referencing a user's needs.
The point there is keep design out of requirements gathering, and this is sound advice.
However, this approach also keeps out the fact that the requirements are for _software_ rather than for manual procedures
or implementations in some other medium.
As we saw in the introduction to this book, [software](../introduction/software.md) has a particular shape.
Shouldn't that affect how we write up requirements?
