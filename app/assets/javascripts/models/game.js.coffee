App.Game = DS.Model.extend(
  title:      DS.attr()
  playerName: DS.attr()
  count:      DS.attr()
  lifetimeCount: DS.attr('number', {defaultValue: 0})
  lifetimeExp: DS.attr('number', {defaultValue: 0})
  basePerClick: DS.attr()
  perClick: DS.attr('number', {defaultValue: 1})
  growthRate: DS.attr('number', {defaultValue: 1.20})
  basePerSecond: DS.attr()
  perSecond: DS.attr('number', {defaultValue: 0})
  basePerSecondMultiplier: DS.attr('number', {defaultValue: 1})
  perSecondMultiplier: DS.attr('number', {defaultValue: 1})
  modifiers: DS.hasMany('App.Modifier')

  monsters: []
)
