App.Game = DS.Model.extend(
  title:      DS.attr()
  playerName: DS.attr()
  count:      DS.attr()
  lifetimeCount: 0
  lifetimeExp: 0
  perClick:   DS.attr()
  growthRate: 1.15
  perSecond:  DS.attr()
  perSecondMultiplier: 1
  monsters: []
  items: []

  init: ->
    @_super(this, arguments)
    setIntervalWithContext((-> @tick()), 1000, this)

  tick: ->
    @addCount(@tickIncrement())
    @set('lifetimeCount', @get('lifetimeCount') + @tickIncrement())

  tickIncrement: ->
    @get('perSecond') * @get('perSecondMultiplier')
 
  #can be negative  
  addCount: (amount) ->
    @set('count', @get('count') + amount)
  
)
