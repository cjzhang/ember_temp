App.Modifier = DS.Model.extend({
  name: DS.attr()
  description: DS.attr()
  active: DS.attr('boolean', {defaultValue: true})
  ticksRemaining: DS.attr('number', {defaultValue: -1})
  type: DS.attr()
  amount: DS.attr()
  
  canBeApplied: (->
    return false unless @get("active")
    return false if @get("ticksRemaining") == 0
    return true
  ).property('active', 'ticksRemaining')
})
