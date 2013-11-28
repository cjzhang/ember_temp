App.Game = DS.Model.extend(
  title:      DS.attr()
  playerName: DS.attr()
  count:      DS.attr()
  perClick:   DS.attr()
  growthRate: 1.15
  perSecond:  DS.attr()
  perSecondMultiplier: DS.attr()
  monsters: []

  init: ->
    @_super(this, arguments)
    setIntervalWithContext((-> @tick()), 1000, this)

  tick: ->
    @changeCount(@tickIncrement())

  tickIncrement: ->
    @get('perSecond') * @get('perSecondMultiplier')

  click: ->
    @changeCount(@get('perClick'))
    
  changeCount: (amount) ->
    @set('count', @get('count') + amount)
  
)
