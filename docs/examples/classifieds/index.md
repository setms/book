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
graph
  usersAggregate(Users)
  userPreferencesReadModel[[UserPreferences]]
  adsAggregate(Ads)
  rulesReadModel[[Rules]]
  checkViolationsAutomaticPolicy[/CheckViolations/]
  myAdsReadModel[[MyAds]]
  checkIndexAutomaticPolicy[/CheckIndex/]
  indexAggregate(Index)
  searchableAdsReadModel[[SearchableAds]]
  checkUserPreferencesAutomaticPolicy[/CheckUserPreferences/]
  notificationsAggregate(Notifications)
  notificationReadModel[[Notification]]
  moderationAggregate(Moderation)
  tradesAggregate(Trades)
  offersReadModel[[Offers]]
  checkAcceptedOfferAutomaticPolicy[/CheckAcceptedOffer/]

  userPreferencesReadModel --> usersAggregate
  adsAggregate --> checkViolationsAutomaticPolicy
  adsAggregate --> checkAcceptedOfferAutomaticPolicy
  rulesReadModel --> moderationAggregate
  checkViolationsAutomaticPolicy --> rulesReadModel
  myAdsReadModel --> adsAggregate
  indexAggregate --> checkIndexAutomaticPolicy
  searchableAdsReadModel --> indexAggregate
  checkUserPreferencesAutomaticPolicy --> userPreferencesReadModel
  notificationsAggregate --> checkUserPreferencesAutomaticPolicy
  notificationReadModel --> notificationsAggregate
  offersReadModel --> tradesAggregate
```

The corresponding modules are:

```mermaid
graph
  usersModule["<b>Users</b>
- CheckUserPreferences
- SignUp
- UserAdded
- UserPreferences
- Users"]
adsModule["<b>Ads</b>
- AcceptAd
- AdAccepted
- AdBumped
- AdChanged
- AdClosed
- AdDeleted
- AdProposed
- AdRejected
- Ads
- BumpAd
- ChangeAd
- CheckAcceptedOffer
- CloseAd
- CreateAd
- DeleteAd
- MyAds
- RejectAd"]
indexModule["<b>Index</b>
- AddAdToIndex
- DecreaseAdRelevancy
- IncreaseAdRelevancy
- Index
- IndexUpdated
- RemoveAdFromIndex
- SearchableAds
- UpdateAdInIndex"]
notificationsModule["<b>Notifications</b>
- InformUser
- Notification
- NotificationSent
- Notifications"]
moderationModule["<b>Moderation</b>
- CheckViolations
- DefineRule
- Moderation
- RuleDefined
- Rules"]
tradesModule["<b>Trades</b>
- AcceptOffer
- MakeOffer
- OfferAccepted
- OfferMade
- OfferRejected
- Offers
- RejectOffer
- Trades"]

moderationModule --> adsModule
usersModule --> notificationsModule
usersModule --> adsModule
usersModule --> tradesModule
adsModule --> tradesModule
```
