App.Game = DS.Model.extend(
  title:      DS.attr()
  playerName: DS.attr()
  count:      DS.attr()
  lifetimeCount: DS.attr('number', {defaultValue: 0})
  lifetimeExp: DS.attr('number', {defaultValue: 0})
  basePerClick: DS.attr()
  perClick: DS.attr('number', {defaultValue: 1})
  growthRate: DS.attr('number', {defaultValue: 1.15})
  basePerSecond: DS.attr()
  perSecond: DS.attr('number', {defaultValue: 0})
  basePerSecondMultiplier: DS.attr('number', {defaultValue: 1})
  perSecondMultiplier: DS.attr('number', {defaultValue: 1})
  modifiers: DS.hasMany('App.Modifier')

  #TODO refactor is there a better way to do this??
  monsters: []
)
