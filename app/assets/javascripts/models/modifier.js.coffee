App.Modifier = DS.Model.extend({
  name: DS.attr()
  description: DS.attr('string', {defaultValue: ""})
  active: DS.attr('boolean', {defaultValue: false})
  ticksRemaining: DS.attr('number', {defaultValue: -1})
  type: DS.attr()
  amount: DS.attr() #refers to how strong the effect type is
  game: DS.belongsTo('App.Game')
  monster: DS.belongsTo('App.Monster')
  #Whether it applies during a tick (passive income) or a click (active income)
  appliesTo: DS.attr()
  
  canBeApplied: (->
    return false unless @get("active")
    return false if @get("ticksRemaining") == 0
    return true
  ).property('active', 'ticksRemaining')
})
