# Testing

If we look at acceptance criteria through the lens of an event storming process model, we see some specializations of
the generic `Given/When/Then` format.

For aggregates:

```text
Given <the aggregate has some data>
When <the aggregate accepts a command>
Then <the aggregate has different data and/or emits an event>
```

For policies:

```text
Given <the policy's read model returns some information>
When <the policy reacts to an event>
Then <the policy issues a command>
```

For read models:

```text
Given <the read model has some data>
When <the read model handles an event>
Then <the read model has different data>
```
