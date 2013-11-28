App.Game = DS.Model.extend(
  title:      DS.attr()
  playerName: DS.attr()
  count:      DS.attr()
  perClick:   DS.attr()
  growthRate: 1.15
  perSecond:  DS.attr()
  perSecondMultiplier: DS.attr()

  init: ->
    @_super(this, arguments)
    setIntervalWithContext((-> @tick()), 1000, this)

  tick: ->
    @set('count', @get('count') + @tickIncrement())

  tickIncrement: ->
    @get('perSecond') * @get('perSecondMultiplier')

  click: ->
    @set('count', @get('count') + @get('perClick'))
)
