# Online classifieds

An online classifieds business is a two-sided marketplace, bringing together sellers and buyers.


# Requirements

Users (buyers and sellers) need to register with the marketplace:

![Seller signs up](sign-up.png)

Sellers can then place classifieds ads on the marketplace:

![Seller places ad](place-ad.png)

The marketplace maintains rules around what kind of ads sellers can place, and can reject ads that violate those rules.
In this example, we assume such moderation happens automatically, but in practice this would be a combination of
automated and manual processing.

The marketplace's Trust & Safety (TnS) Manager defines the moderation rules:

![TnS manager defines rules](define-rules.png)

The marketplace maintains a database of ads and also an index of searchable ads.
The searchable ads contains a subset of all ads, optimized for searching by buyers.
The seller can delete or change their ads:

![Seller changes ad](change-ad.png)

One of the ways the marketplace makes money is via paid features.
For instance, ads age, which reduces their relevancy in the search index.
Sellers can pay to bump their ads to increase this relevancy again:

![Seller bumps ad](bump-ad.png)

Buyers browse ads and make offers to sellers:

![Buyer makes offer](make-offer.png)

The seller can accept the offer:

![Seller accepts offer](accept-offer.png)

Or they can reject the offer:

![Seller rejects offer](reject-offer.png)

The above is a bare-bones classifieds experience.
Competitive offerings include features not covered here, like messaging, payment, and shipping.


# Design

The dependency graph for aggregates, automated policies, and read models looks like this:

```mermaid
flowchart LR
  CUP[/Check user preferences/]
  UP[User preferences]
  U{{Users}}
  A{{Ads}}
  CI[/Check index/]
  MA[My ads]
  CV[/Check violations/]
  RV[Rules]
  R{{Moderation}}
  SA[Searchable ads]
  I{{Index}}
  O[Offers]
  T{{Trades}}
  No[Notification]
  N{{Notifications}}
  CAO[/CheckAcceptedOffer/]

  CUP --> UP
  A --> CUP
  A --> CI
  A --> CV
  CV --> RV
  RV --> R
  SA --> I
  No --> N
  O --> T
  UP --> U
  MA --> A
  A --> CAO
```

The corresponding modules are:

- Users, UserPreferences, CheckUserPreferences
- Ads, MyAds, CheckAcceptedOffer
- Moderation, Rules, CheckViolations
- Index, SearchableAds, CheckIndex
- Trades, Offers
- Notifications, Notification
