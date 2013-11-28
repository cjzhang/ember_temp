App.Monster = DS.Model.extend(
  name: DS.attr()
  baseCost: DS.attr()
  count: DS.attr()
  basePerSecond: DS.attr()
  description: DS.attr()
  imageUrl: DS.attr()
  exp: DS.attr()
  level: 0
  levelEffectiveness: 1.0
  growthRate: 1.15
  baseExpRequired: 50
  

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


