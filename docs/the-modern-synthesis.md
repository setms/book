# Book organization

The rest of this book attempts to answer the question of how to make software development a real engineering discipline.

First we'll look into each of the SWEBOK knowledge areas and see how much they conform to the engineering approach.
Then we'll see if we can synthesize an actual engineering process out of their combination.

Before we get into all that, a quick note on the book's title.


## Evolution

Biology is the scientific study of life.
While it has a broad scope, there is a unifying theory:

```admonish info "Quote"
Nothing in biology makes sense except in the light of evolution.

--- @@Dobzhansky1973
```

The scientific theory of evolution rests on two pillars:

1. **Natural selection** is the differential survival and reproduction of individuals due to differences in traits
  @@Darwin1859.
2. **Heredity of traits** is the passing on of traits from parents to their offspring with some changes @@Mendel1866,
  @@Fisher1930.

On a high level, evolution works as follows:

```dot process
digraph evolutoin {
  size="6!";
  layout="circo";
  splines="curved";
  node [shape=rect, style="rounded,filled", fixedsize=true, width=1.5, height=0.75, fillcolor=lightskyblue2,
    color=steelblue4, penwidth=2];
  edge [fontsize=11, color=steelblue4, penwidth=2];

  "Parents &\noffspring" -> Survivors [label = "\nLimited resources\nensure only the\nfittest survive"];
  Survivors -> Population [label = "Survivors form\nthe new population  "];
  Population -> Offspring [label = "Parents produce\noffspring with\nsmall changes\nin traits"];
  Offspring -> "Parents &\noffspring" [label = "\nOffspring expand\nthe population"];
}
```

Note how this process resembles the [scientific method](engineering.md#science):

- The population is nature's current theory on how to best adapt to their environment.
- Offspring inherit traits from their parents, but with small changes via _mutation_ and, for species with
  sexual reproduction, _crossover_.
  In other words, each new generation contains several hypotheses on how to better adapt to the environment.
- Since resources are usually limited, only the fittest survive.
  Nature implicitly conducts experiments to falsify its hypotheses.
- The fittest organisms make up the new population, or current theory of how best to adapt to the environment.

It certainly looks like nature is doing science.

The two pillars of evolution were fist brought together in the seminal book _Evolution: The Modern Synthesis_
@@Huxley1948.

The current book similarly aspires to bring together the various pillars of software engineering.
Let's get to it.
