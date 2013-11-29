App.Game = DS.Model.extend(
  title:      DS.attr()
  playerName: DS.attr()
  count:      DS.attr()
  lifetimeCount: 0
  lifetimeExp: 0
  basePerClick: DS.attr()
  perClick: 1
  growthRate: 1.15
  basePerSecond: DS.attr()
  perSecond: 1
  basePerSecondMultiplier: 1
  perSecondMultiplier: 1
  monsters: []
  modifiers: []
)
