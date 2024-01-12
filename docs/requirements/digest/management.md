# Requirements management

Everyone must agree on the requirements:

- The sponsor agrees that the requirements achieve the business objectives.
- Customers agree that the requirements address their needs.
- Developers agree that the requirements are possible and verifiable.

A **requirements baseline** is a set of reviewed and agreed upon requirements that serves as the basis for development
of a product or increment.
When possible, organize requirements into related sets and deliver those sets incrementally.
Breaking delivery down like this helps in dealing with changes.

Changes in requirements are inevitable:

- Stakeholders don't know precisely what they want at te beginning of the project.
- Stakeholders can sometimes articulate what they want precisely only after seeing something that doesn't quite match
  their vision.
- Business needs may change during the course of the project.
- The legal and regulatory environment may change.

Requirements typically grow 1-3% per month.
The analyst should place a baseline under change and version control to deal with these changes.

**Requirements management** includes all activities that maintain the integrity, accuracy, and currency of
requirements agreements throughout the project.
The business analyst sets up requirement storage mechanisms, defines attributes, coordinates status, and monitors
change.

Conceptually, each requirement is one record in a Requirements Management (RM) system.
RM systems range from generic issue trackers and wikis to specialized tools.
Some RM systems are part of larger suites or connected to issue trackers.

Requirements have attributes, like origin, creation date, priority, and status.
Common statuses include proposed, drafted, approved, in progress, implemented, verified, and rejected.
Tracking the distribution of statuses throughout the project shows the progress the team is making.

**Version control** uniquely identifies different versions of requirements and requirement sets.
RM tools offer version control and more.

For effective change control, there needs to be a **change control process** for proposing, evaluating, and deciding on
requirement changes.
The process should include a "fast path" to ensure that low-risk, low-investment change requests don't get bogged down
in bureaucracy.
Capture the change control process in a **change control policy** before changes arrive.
The policy describes the lifecycle of a change request and the roles involved.

The **Change Control Board** (CCB) executes the policy by accepting or rejecting changes.
They assess change requests (see impact analysis below), make decisions, and see to implementation and verification of
approved changes.

Change requests share similarities with defect reports, and you can use the same tools to track them.
You should capture change request attributes, like requester, type, date received, status, etc.

A **requirements volatility chart** tracks the rate at which change requests arrive after a baseline.
It should trend towards zero as the project nears completion.
A sustained high rate implies a schedule risk.
The CCB then may need to renegotiate schedule, staff, budget, or quality to accommodate changes.
Tracking the origin of change requests is also illuminating.

**Impact analysis** is the process of assessing the consequences of a change.
A traceability matrix helps with impact analysis.
A **requirements traceability matrix** is a set of links between requirements and other artifacts, such as design and
code elements.
It also links functional requirements to higher-level user requirements, business requirements, business rules, and
system requirements.
For products in some fields, like aviation, regulations dictate that you can trace requirements forward to design and
code.

Non-functional requirements often don't trace forward to code.
Some non-functional requirements, like for security, trace forward to functional requirements, like authentication,
that in turn do trace forward to code.

For all but the smallest projects, manually maintaining traceability is impractical.
Commercial RM tools often offer traceability functionality.
You still have to manually add most links, but then the tool can assist with changes.
