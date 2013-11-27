App.Monster = DS.Model.extend(
  name: DS.attr()
  baseCost: DS.attr()
  count: DS.attr()
  perSecond: DS.attr()

  purchase: ->
    @set('count', @get('count') + 1)

  sell: ->
    @set('count', @get('count') - 1)
)


