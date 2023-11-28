# Software engineering

```admonish tldr title="Definition"
**Software Engineering** is the application of a systematic, disciplined, quantifiable approach to the development,
operation, and maintenance of software; that is, the application of engineering to software.

--- @@ISO/IEC_2382:2015
```

The term _software engineering_ was first used in the title of a NATO conference in 1968 @@Naur1969 :
<!-- vale Microsoft.Adverbs = NO -->
<!-- vale write-good.Passive = NO -->

> The phrase ‘software engineering’ was deliberately chosen as being provocative, in implying the need
> for software manufacture to be based on the types of theoretical foundations and practical disciplines,
> that are traditional in the established branches of engineering.

<!-- vale write-good.Passive = YES -->
<!-- vale Microsoft.Adverbs = YES -->
Since then, people have worked towards this goal to make software development an engineering discipline.


## SWEBOK

Some of that work has taken place at the [Institute of Electrical and Electronics Engineers](https://www.ieee.org/)
(IEEE).
This professional association for electrical engineers and related disciplines discusses different knowledge areas
in what they call societies.

The [Computer Society](https://www.computer.org/) (IEEE CS) "engages computer engineers, scientists, academia,
and industry professionals from all areas of computing."
It also "sets the standard for the education and engagement that fuels continued global technological advancement."

One of its publications is _The Guide to the Software Engineering Body of Knowledge_ (SWEBOK).
SWEBOK describes generally accepted knowledge about software engineering.
The current version is V3 @@SWEBOK2014, while V4 is under review @@SWEBOK2022.

The SWEBOK organizes material in knowledge areas (KAs):

1. Software Requirements
1. Software Design
1. Software Construction
1. Software Testing
1. Software Maintenance
1. Software Configuration Management
1. Software Engineering Management
1. Software Engineering Process
1. Software Engineering Models and Methods
1. Software Quality
1. Software Engineering Professional Practice
1. Software Engineering Economics
1. Computing Foundations
1. Mathematical Foundations
1. Engineering Foundations

Knowledge areas 13-15 provide the theoretical foundations.
KA 8 describes the engineering process, while 1-5 cover the activities in that process.
The other KAs deal with related topics.

SWEBOK V4 recognizes 18 KAs, introducing architecture, operations, and security as separate areas.

Each knowledge area breaks down into topics and subtopics, summarizing the key concepts and including a
reference list for detailed information.

IEEE CS stresses that SWEBOK is a _guide_ to the body of knowledge for software engineering.
The body of knowledge itself consists of the literature that SWEBOK references.
Appendix C contains a list of 36 books that together cover all the KAs.


## Is this actually engineering?

The SWEBOK uses the word engineering a lot, but is what it describes actually engineering?
The year after SWEBOK V3 came out, Mary Shaw argued that what we're doing in software development isn't engineering
@@Shaw2015.

Some random data points support that assessment:

- The Standish Group publishes a recurring CHAOS Report.
  The 2020 version states that 19% of IT projects are utter failures, and 50% fail in at least one way @@Standish2020.
- The list of biggest data breaches ever shows that the top 10 all happened after publication of SWEBOK V3 @@Statista2023.

These aren't the results one would expect from engineering, so what's going on?
A complex question like that usually has more than one answer.
Let's look at some possibilities.


## Management

Organizations achieve immensely different outcomes, even in level playing fields.
Some organizations outperform their competitors in every important dimension, all at once.

[Kim2023] claim to understand why.
They say all organizations are sociotechnical systems, where different types of work happen in
different layers:

1. The technical objects people work on, like source code.
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

The SWEBOK references more than one approach for most knowledge areas.
Contrast this with Toyota.
Its _Toyota Production System_ (TPS) is an approach that combines all three tools for improving layer 3 @@Kim2023.

Taiichi Ohno, TPS's founder, says TPS is about reducing waste through just-in-time production
and automation with a human touch @@Ohno1988.
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
First we'll look into each of the SWEBOK knowledge areas and see how much they conform to the engineering approach.
Then we'll see if we can build an actual engineering process out of their combination.
