App.Game = DS.Model.extend(
  title: DS.attr()
  playerName: DS.attr()
  count: DS.attr()
  perClick: DS.attr()
  perSecond: DS.attr()
   
  init: ->
    @_super(this, arguments)
    setIntervalWithContext((-> @tick()), 1000, this)
    
  tick: ->
    @set('count', @get('count') + @get('perSecond'))
    
  click: ->
    @set('count', @get('count') + @get('perClick'))
)


