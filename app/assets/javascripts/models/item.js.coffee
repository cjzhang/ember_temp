App.Item = DS.Model.extend(
  name:    DS.attr()
  cost:    DS.attr()
  numAvailable: DS.attr() #available for purchase
  controllerName: DS.attr()
  unlocked: DS.attr() #visibility
  count: DS.attr('number', 0) #number owned
  description: DS.attr()
  

  
  #for items that bestow an effect
  ticksRemaining: 0
  active: false
  #Used to distinguish between different item effects
  effectType: DS.attr()
  effectAmount: DS.attr()
    
  purchasable: (->
    @get('unlocked') && @get('numAvailable') > 0
  ).property('numAvailable', 'unlocked')
)
