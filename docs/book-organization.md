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

1. **Natural selection** is the differential survival and reproduction of individuals due to differences in traits @@Darwin1859.
2. **Heredity of traits** is the passing on of traits from parents to their offspring @@Mendel1866, @@Fisher1930.

On a high level, evolution works as follows:

```dot process
digraph evolutoin {
  size="6!";
  layout="circo";
  splines="curved";
  node [shape=rect, style="rounded,filled", fixedsize=true, width=1.5, height=0.75, fillcolor=lightskyblue2,
    color=steelblue4, penwidth=2];
  edge [fontsize=11, color=steelblue4, penwidth=2];

  Offspring -> Population [label = "Survivors and\noffspring form\nthe new population  "];
  Population -> Survivors [label = "The environment\nselects survivors\nbased on their fitness"];
  Survivors -> Offspring [label = "Survivors mate\nand produce offspring"];
}
```

Note the similarities with both the scientific method and the engineering design process.
It turns out that nature is performing some form of science.

The two pillars of evolution were fist brought together in the seminal book _Evolution: The Modern Synthesis_ @@Huxley1948.

This book similarly aspires to bring together the pillars of software engineering.
Let's get to it.
