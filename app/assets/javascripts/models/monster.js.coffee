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
  count: DS.attr('number', {defaultValue: 0})
  #-1 means unlimited
  numAvailable: DS.attr('number', {defaultValue: -1})
  exp: DS.attr('number', {defaultValue: 0})
  level: DS.attr('number', {defaultValue: 0})
  totalExp: DS.attr('number', {defaultValue: 0})
  eggsEarned: DS.attr('number', {defaultValue: 0})

  perSecond: (->
    basePerSecond = @get('basePerSecond')
    multiplier = 1 
    multiplier += @get('level') * @get('levelEffectiveness')
    @get('modifiers').filterBy("active", true).filterBy("appliesTo", "tick").forEach( (modifier) ->
      switch(modifier.get("type"))
        when "multiply"
          multiplier *= modifier.get("amount")
    )
    return basePerSecond * multiplier
  ).property('level', 'modifiers.@each.active', "modifiers")

  totalPerSecond: (->
    @get('perSecond') * @get('count')
  ).property('count', 'perSecond')
  
  #lol
  displayLevel: (->
    @get('level') + 1
  ).property('level')

  selectable: (->
    @get('count') > 0
  ).property('count')

  purchasable: (->
    @get('numAvailable') != 0
  ).property('numAvailable')
)


