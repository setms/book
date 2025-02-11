# Validation

**Verification** determines whether the product meets its requirements (doing the thing right).
**Validation** assesses whether a product satisfies stakeholder needs and business objectives (doing the right thing).
Since we're discussing requirements here, we'll use the term validation.

The goal of requirements validation is to ensure that requirements:

- Accurately describe system capabilities and that those meet stakeholders' needs.
- Come from business requirements, system requirements, and business rules.
- Are complete, attainable, and verifiable.
- Are necessary, and enough to all meet business objectives.
- Are consistent with each other.
- Provide an adequate basis for design and construction.

Various studies suggest that errors introduced during requirements activities account for 40-50% of all defects found
in a software product.
The major consequence of requirements problems is rework.
Rework often consumes 30-50% of total development cost, and requirements errors make up 70-85% of that.
Requirements validation pays for itself by reducing such rework.

For stakeholders to validate requirements, they must understand them.
This limits the [forms](specification.md#writing-requirements) the requirements can take.


## Acceptance criteria

Stakeholders assess whether a product meets their requirements using **acceptance criteria**.

Ensure that all requirements have acceptance criteria and, if possible, acceptance tests.
Examples of acceptance criteria that are unsuitable for capturing in acceptance tests:

- The number of open issues is under some maximum.
- Documentation is available.
- Users received training.

You can't perform acceptance tests until you have running software, but just writing down tests often reveals errors,
ambiguities, and omissions in requirements.

Automate acceptance tests as much as possible.
Automated tests fall on a spectrum from behavioral to structural.
**Behavioral tests** focus on testing the external behavior of the system without considering its implementation.
**Structural tests** take into account the internal structure, code, or logic of the system.

Developers may write structural tests before the code, in a practice known as Test-Driven Development (TDD) @@Beck2002.
Behavioral tests may be performed by developers, separate Quality Assurance (QA) staff, and/or end users in User
Acceptance Testing (UAT).
For bespoke software specifically developed for one particular customer, UAT is often part of the formal process where
the customer accepts the software.

Some quality attribute requirements may require experts to validate them.
For instance, many organizations hire penetration testers to validate security requirements.
Other quality attribute requirements may be hard to validate because they state that some things should _not_ happen,
like safety and compliance requirements.


## Inspections

Writing acceptance criteria isn't going to catch all requirements issues.
You also need to review them.

Requirements reviews can take an informal or more formal form.
Informal reviews only catch the most glaring errors, inconsistencies, and gaps.
It's better to conduct a formal review, which produces an inspection report with details about the inspection and its
results.

The best-known kind of formal review is the **inspection** @@Fagan1976.
Participants in an inspection should cover the following perspectives:

- The author of the requirements.
- Stakeholders that requested the requirements.
- Developers and testers who are going to do work based on the requirements.
- Representatives of systems that interface with the requirements' product.

The following roles partake in an inspection:

- The **moderator** plans and facilitates the inspection workshop.
  Part of planning is to provide participants with checklists that guide participants in what to look for, focusing on
  high-occurrence, high-cost errors.
  The moderator may assign specific kinds of errors to inspectors.
- The **author** is there to watch and learn and is otherwise passive.
- The **reader** goes through the requirements, paraphrasing each.
  This may surface different interpretations.
- The **inspectors** point out any defects they see.
  Inspectors come to the meeting prepared, having reviewed the requirements before the workshop.
- The **scribe** documents the found defects.

The average cost of fixing a defect found during inspection is about half an hour @@Kelly1990.
In contrast, it takes between five and 17 hours to fix defects found during testing.
Since it takes only 1.1 hours to find a defect, on average, inspections make economic sense.

The number of defects found per unit goes down as the number of units inspected goes up in a single session.
Inspection sessions shouldn't last more than two hours.
People shouldn't take part in more than two sessions per day.
People also shouldn't review the same requirements more than three times.

Validation doesn't end with inspection.
The author reworks the requirements to fix the defects found.
After that, a follow-up meeting assesses the fixes.
The inspection process should have clear exit criteria that define when the requirements are ready for design and
construction.
