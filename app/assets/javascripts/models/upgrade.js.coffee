  #Upgrades are just triggers that activate a modifier with
  #unlimited lifespan
App.Upgrade = DS.Model.extend(
  name:    DS.attr()
  cost:    DS.attr()
  unlocked: DS.attr("boolean", {defaultValue: false}) #visibility
  purchased: DS.attr("boolean", {defaultValue: false})
  modifier: DS.belongsTo('App.Modifier')
  description: DS.attr()
  
  purchasable: (->
    @get('unlocked') && !@get('purchased')
  ).property('unlocked', 'purchased')
)
