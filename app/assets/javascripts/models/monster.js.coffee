App.Monster = DS.Model.extend(
  name: DS.attr()
  baseCost: DS.attr()
  basePerSecond: DS.attr()
  baseExpRequired: DS.attr()
  growthRate: DS.attr()
  levelEffectiveness: DS.attr()
  description: DS.attr()
  imageUrl: DS.attr()
  modifiers: DS.hasMany('App.Modifier')
  count: DS.attr(undefined, {defaultValue: 0})
  exp: DS.attr(undefined, {defaultValue: 0})
  level: DS.attr(undefined, {defaultValue: 0})

  #TODO refactor: where should computed properties live?
  perSecond: (->
    @get('basePerSecond') + @get('basePerSecond') * @get('level') * @get('levelEffectiveness')

  ).property('level')

  #lol
  displayLevel: (->
    @get('level') + 1
  ).property('level')

  selectable: (->
    @get('count') > 0
  ).property('count')
)


