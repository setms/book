# Preliminary analysis

The books referenced by SWEBOK provide good coverage of the state of the art in the requirements engineering field.
However, there are some issues with this state of the art.


## Domain knowledge

Most engineering disciplines specialize around a domain.
Engineers trained in that field speak the same language as the people requesting them to build a system.
In contrast, software developers need to learn the language of the domain.

The mentioned practices around learning a new domain lack a theoretical underpinning.
One would expect references to the fields of education or knowledge management.
Instead, the simplistic model is to talk to subject-matter experts (SMEs) and to write down what you hear.
Of course this results in problems when we attempt to tap into an SME's vast tacit knowledge.

Domain-Driven Design (DDD) is probably part of the answer @@Evans2014.
It offers the _domain model_ as help in requirements elicitation.
However, the books that SWEBOK V3 posits as the body of knowledge for requirements don't mention DDD.
Neither does the V4 draft.

@@BABOK2015 contains a section on learning (9.1.3), but doesn't give much advice on how to best do that.
It doesn't mention DDD by name, but does list concept modelling as a technique in section 10.11 and mind mapping
in 10.29.
Event the Agile Extension to the BABOK doesn't mention DDD @@AgileBABOK2017.


## Changing requirements

The requirements themselves are much more fluid than in the traditional engineering fields.
As an example, let's look at scale requirements.
A civil engineer, for example, designs a bridge for a given load.
If that load in practice turns out to be two orders of magnitude higher, then a new bridge is necessary.
Software systems are routinely expected to scale that much and more.


## Unknown requirements

The above assumes that it's clear in the first place what system we should build.
This isn't true until we achieve product/market fit, which means startups need a different process.
The Lean Startup movement assumes that until we achieve prodcut/market fit, we can only find out what works by trying
things out @@Ries2011.
This would put requirements development in the _Complex_
[Cynefin domain](../introduction/software-engineering.md#the-cynefin-framework), rather than in the _Complicated_
realm of engineering.

The issue of unknown requirements raises its head outside the startup scene as well.
We can ask stakeholders what they need, but they're always constrained by their current situation and thinking.
There may be requirements out there that, when realized, would significantly enhance the value the product delivers,
but which nobody involved can conceive of.
Remember the quote attributed to Henry Ford about faster horses.


## Nature of software

Another potential issue is the advice to state requirements in an abstract way, only referencing a user's needs.
The point there is keep design out of requirements gathering, and this is sound advice.
However, this approach also keeps out the fact that the requirements are for _software_ rather than for manual procedures
or implementations in some other medium.
As we saw in the introduction to this book, software has a [particular shape](../introduction/software.md).
Shouldn't that affect how we define requirements?

We'll revisit some of these issues in the [synthesis](../synthesis.md).
