# Analysis

## Measurement

A company's main goal is to maximize profit by increasing revenue and reducing cost.
A software delivery organization contributes to revenue by delivering product features.
Its cost are mainly labor and infrastructure costs and as such outside the scope of this chapter.


### The main metric: Service Level Expectation

Software delivery consists of building the [right product](../requirements/index.md) in the right way.
From an engineering management's perspective, the latter refers to predictability and efficiency.
We can measure both using a single metric: Service Level Expectation (SLE).

```admonish tldr title="Definition"
A **Service Level Expectation** is a probabilistic statement about how long it should take a work item to finish once
started.

An SLE takes the form `X% of work items finish in under Y time units once started`.

--- @@Vacanti2015
```

Let's break this down:

- A **work item** is any direct or indirect discrete unit of customer value.
  This can be a user story, epic, feature, or entire project.
  Using a smaller granularity gives more data to calculate the SLE from and thus more robust results.
- You need to precisely define when a work item starts and finishes in your process.
- You can use any time unit you want, as long as you're consistent with it.
  In practice, it's often best to start with days.
- You should negotiate the value of X with the clients of the software delivery process, since it depends on their
  risk tolerance.
  However, any increase in X leads to an exponential increase in Y, so at some point adding more predictability
  makes the prediction useless.
  For instance, for X=100, Y is most likely in the order of years even for medium-sized work.
  In practice, it's best to start with X=85.
- Given a value of X, you can calculate Y from measurements about each work item's start and finish timestamps.

Here's how to calculate the Service Level Expectation:

1. For each work item, attach a timestamp when they start and when they finish.
2. Calculate **cycle time = finish timestamp - start timestamp + 1**.
  The +1 is to make sure cycle time is never 0, since all work items require at least some time.
3. For the reporting period, order the work items by cycle time.
4. Y is the largest cycle time in the lowest X% of work items.

Benefits of using SLE:

- It's independent of the process used to deliver work.
  You just need to be able to define when work starts and finishes.
  For example, it works with both Scrum and Kanban, and even when you switch from one to the other.
- It's an absolute, objective metric, unlike, for instance, Story Points.
  This means you can aggregate at every desired level: from single team to whole organization.
  Just adjust the pool of work items.
- Using SLE, you can say with confidence and at the desired accuracy when you expect work to get done.
  And **this requires no estimation**.
  All you need is to break work down into work items and some historical data about work items.
  About 10-30 finished work items is usually enough to get started.
- The SLE calculation works even if your cycle times don't follow a normal distribution, which is typical.
- The SLE suggests how to improve software delivery: focus on reducing Y.
  Since Y only depends on start and finish timestamps, the options for reducing it are clear: focus on ways to finish
  work items faster.
  See below for concrete suggestions.

  If you reduce Y enough, you may even increase X.
  That would result in a higher Y, which you can then work to reduce again, forming a continuous improvement cycle.

Common options for finishing work items faster are:

- **Unblocking blocked work**.
  Work that can't make progress because of internal or external dependencies can continue to age well beyond the SLE.
  Getting unstuck is a powerful way to limit cycle time.
  You may even decide to cancel the work if you expect no progress soon.
- Lowering the number of concurrent work items the team is working on.
  Also known as limiting work in progress, or **limiting WIP**.
- **Swarming, pairing, and mobbing** happen when more than one person works on a work item at the same time.
  Swarming exploits parallelism in the work.
  Pairing @@Williams2003 and mobbing @@Pearl2018 @@Meadows2022 remove hand-offs with associated wait times for
  activities like reviewing or testing.
- Automating more of the work by using better tools.
- Simplifying the work to remove unnecessary activities.


### Additional metrics

SLE is the main metric for driving predictability and efficiency.
Other metrics may help keep the process stable and drive improvements:

- **Capacity allocation**: percentage of work items by type:
  - functionality: building features
  - quality: fixing bugs
  - capability improvement: process improvements, process automation, code simplification, etc.

  This metric enables a discussion about the right mix of investments.
- Stability metrics:
  - **change failure rate**: how often a rollback, hotfix, or incident occurs as percentage of all deployments
  - **escaped defect inflow**: the number of customer-reported defects per reporting period
  - **open defect stock**: total number of unresolved issues

  These metrics ensure SLE improvements don't degrade reliability and allow anchoring of quality-related capacity
  allocation to quality signals.
