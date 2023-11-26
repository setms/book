# Problems with software engineering

In theory, the body of knowledge referenced by [SWEBOK](software-engineering.md) covers all we need to know
to do software engineering.
Then how come what we do in practice feels nothing like engineering?
A complex question like that usually has more than one answer.
Let's look at some.


## Management

Organizations achieve immensely different outcomes, even in level playing fields.
Some organizations outperform their competitors in every important dimension, all at once.

[Kim2023] claim to understand why.
They say all organizations are sociotechnical systems, where different types of work happen in
different layers:

1. The technical objects people work on, like software.
2. The tools and instrumentation through which people work on layer 1 objects, like compilers.
3. The social circuitry: processes, procedures, norms, and routines, like software development processes.

They argue that performance in layer 3 dominates performance as a whole.
In other words, winning organizations wire their social circuitry better.

They offer the following tools to improve layer 3:

- **Slowification** to make it easier to solve problems.
- **Simplification** to make the problems themselves easier to solve.
- **Amplification** to make it obvious that there are problems that need solving.


## Ignorance

Many software developers are unaware of the SWEBOK.<!-- vale Google.FirstPerson = NO -->
I myself only found it when doing research for this book, and I'm an avid reader.
<!-- vale Google.FirstPerson = YES -->

This problem goes beyond SWEBOK.
For example, it's been over 20 years since the @@AgileManifesto, and there are still people doing waterfall
because they don't know any better.

Sometimes people do know better, but still stick to their old ways.
This may be due to a lack of discipline, or it may result from poor management.
It's also possible that they're confused by too many options.


## Too many options

The SWEBOK endorses more than one approach for most knowledge areas.
Contrast this with Toyota.
Its _Toyota Production System_ (TPS) is an approach that combines all three tools for improving layer 3 @@Kim2023.

Taiichi Ohno, TPS's founder, says TPS is about reducing waste through just-in-time production
and automation with a human touch  @@Ohno1988.
However, analysis shows that the real power of TPS stems from the fact that they standardize all work,
while constantly improving those standards @@Spear1999.
In other words, they use the scientific method.

Is it possible to find one way to do software development that's optimal in all situations?
The answer is probably negative.
@@Spear1999 gives the example of one Toyota plant with two divisions, where each division used a different approach.
These approaches were the result of the divisions encountering different problems during their operation
and solving them according to their unique situation.

And yet, there is an underlying way of working in those divisions.
Companies following TPS have a common sense of what the ideal production system would be.
Its output:
<!-- vale write-good.Passive = NO -->
<!-- vale write-good.Weasel = NO -->

> - Is defect free (that it, it has the features and performance the customer expects);
> - Can be delivered one request at a time (a batch size of one);
> - Can be supplied on demand in the version requested;
> - Can be delivered immediately;
> - Can be produced without wasting any materials, labor, energy, or other resources (such as costs associated with
  inventory); and
> - Can be produced in a work environment that's safe physically, emotionally, and professionally for every employee.

<!-- vale write-good.Weasel = YES -->
<!-- vale write-good.Passive = YES -->

Is there a similar ideal for software development?
And if so, is there an engineering design process that applies science to continuously get closer to that ideal?

The rest of this book is an attempt to find the answers to those questions.
