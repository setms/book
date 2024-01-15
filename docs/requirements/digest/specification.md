# Specification

**Specification** involves representing and storing the collected requirements knowledge in a persistent and
well-organized fashion.
We should record requirements in a shareable form, rather than using an
[oral tradition](../analysis.md#requirements-engineering-in-agile-methods).
They should also be version-controlled.
Use templates for consistency.

Keep business rules separate from requirements, since their scope is wider.
This allows reuse across products.
Document the origin and expected frequency of change for each business rule.
The business should own business rules, rather than the IT department.


## Specification documents

The **Vision & Scope document** contains the business requirements, scope, and business context.
Other names for this document are project charter, business case document, or Market Requirements Document (MRD).
Whatever the name, the business sponsor is the owner.

The **vision** provides a shared understanding of the desired outcome: what the project is about and should become.
It applies to the product as a whole and should change only when the company's business objectives do.

The **scope** defines what part of the vision the current project or iteration addresses.
At a high level, it's about what business objective to target.
At a lower level, it's about what features to include.
Vision and scope together allow evaluating proposed requirements for project fit.

The vision and scope document also establishes priorities.
Categorize the five dimensions (features, quality, schedule, cost, and staff) as either **constraint**, **driver**, or
**degree of freedom**.
Not all dimensions can be constraints or drivers; degrees of freedom allow responding to changes in requirements or
project realities.
For instance, many Agile methods treat schedule & quality as constraints, features & cost as drivers, and scope as
a degree of freedom.

Collect functional and non-functional requirements in a **Software Requirements Specification** (SRS).
This practice enables downstream activities, like validation and change management.
The SRS has different names in different contexts, like business requirements document, or functional specification.

The SRS refers to the Vision & Scope document.
It also describes the user classes and any design and construction constraints, like which programming language to use
or which standards to follow.
Documenting assumptions may prevent serious issues.
An **assumption** is a statement that's the team believes to be true in the absence of proof.

Writing requirements down may be tedious, but the cost of doing so is small compared to acquiring that knowledge.
Or relearning it in the future by new hires.

Learn just enough about requirements for prioritization, then flesh out more details when needed for design and
construction.
Label uncertain requirements as TBD and assign someone to resolve the issue.

Trace requirements back to their origin: business requirements, system requirement, or business rule.
Record the stakeholders requesting each requirement.

Assign a unique ID to each requirement.
The best format for such IDs is a text-based hierarchical tagging scheme.
This practice gives rise to IDs like `Product.Discount.Error`.

Present requirements in different ways to stakeholders to reveal more insights.
For instance, text vs diagram or use case vs acceptance test.

It's often useful to group requirements by features (or even a feature tree) or by user class.

You may want to include a logical data model in the SRS, including how to collect, verify, process, protect, and
destruct data.
Descriptions of reports are also valuable.

Don't forget to document non-functional requirements, like for usability (including localization and
internationalization), performance, and security.
Also include requirements around migrations from existing systems.

To prevent recurring discussions, record rejected requirements and the reasons for their rejection.

The SRS should contain a glossary.

For a software product that's part of a larger system, capture the system requirements in a Systems Requirements
Specification (SyRS).
Requirements in the SyRS may need decomposing into individual requirements for hardware, software, and humans.


## Writing requirements

Excellent requirements are:

- **Correct**.
  Requirements must accurately describe a capability that meets a stakeholder's need.
  Formalize correctness using acceptance criteria.
- **Complete**.
  Each requirement must contain all information necessary for validation and implementation.
  This includes what to do in case of errors.
- **Unambiguous**.
  Natural language is prone to ambiguity, but is necessary since stakeholders can't usually read formal specifications
  well enough to validate requirements.

  Ambiguity comes in two forms.
  The first is when one person can see more than one way to interpret a requirement.
  The harder type is where different people each see only one interpretation each, but those differ from each other.

  To reduce ambiguity, we often use semi-structured text to constrain the text a bit.
  Lists, tables, formulas, charts, and decision trees may be useful as well.
  Use terms consistently and as defined in the glossary.
  Synonyms are okay, as long as they're in the glossary as well.
  Try to avoid adverbs, since they introduce subjectivity.
- **Necessary**.
  Required functionality should provide stakeholders with business value in line with the business objectives for the
  product.
  This includes compliance with laws, regulations, and standards.
  Reject requirements that don't contribute to the stated business objectives.
  Likewise, exclude business rules that don't need implementing in software.

  Requirements must come from a source that has the authority to provide requirements.
- **Feasible**.
  It must be possible to implement the requirement in an economic fashion.
- **Prioritized**.
  Again, economics come into play, this time to make sure we can work on the most important things first.
- **Verifiable**.
  Write individually testable requirements, with a small number of related test cases each.
  The count of testable requirements is actually a metric for product size.
  Rephrase negative requirements into positives so that they're clearer and thus easier to verify.

It's best to use templates to specify requirements so that all these properties get addressed.
For _system requirements_, @@Wiegers2013 suggests the Easy Approach to Requirements Syntax (EARS, @@Mavin2022), which
offers this template:

```text
While <precondition(s)>
when <trigger>
the <system name>
shall <system response>.
```

The `while` and `when` parts are optional.
**Preconditions** define conditions that must be true for a requirement to become active.
The **trigger** defines a discrete event detected by the system that activates a requirement.
The **system name** must be explicit.
The **system response** defines what the system must do when the requirement becomes active.

For _user requirements_, @@Wiegers2013 suggests a template from @@Alexander2002 with this structure:

```text
The [user class]
shall be able to [do something]
[to some object]
[qualifying conditions, response time, or quality statement].
```

_Non-functional requirements_ should be SMART: **S**pecific, **M**easurable, **A**ttainable, **R**elevant, and
**T**ime-sensitive.
@@Wiegers2013 gives this example for availability:

```text
The system shall be at least 95 percent available on weekdays
between 6:00 AM and midnight Eastern Time,
and at least 99 percent available on weekdays
between 3:00 PM and 5:00 PM Eastern Time.
```

Such statements require precise definitions of the metrics used, such as `available` in the previous example.

It's possible to define requirements more formally using specification languages like Planguage @@Gilb2005.
However, formal methods and certain kinds of diagrams are foreign to most users, so the best way to specify
requirements is still in text form.
Structured natural language, like used in the templates above, is often better than free-form text.

Many measurements of quality attributes are **lagging indicators**.
This means you can't tell whether the system achieved its goals until after it's been in operation for a while.

The SRS as a whole should have some desired properties as well:

- **Complete**.
  No requirement is missing.
- **Consistent**.
  Requirements don't contradict each other.
- **Modifiable**.
  Requirement collections should have a browsable history, especially after baselining.
- **Traceable**.
  Link requirements both backward to their origin and forward to derived requirements and later-stage artifacts,
  such as code and tests.

Conceptually, each requirement is one record in a Requirements Development (RD) system.
**Requirements Development tools** help eliciting requirements and judge whether they're well-written.
For instance, they can scan for vague an ambiguous words.
RD tools offer different communication methods for stakeholders and some can convert text to diagrams.
