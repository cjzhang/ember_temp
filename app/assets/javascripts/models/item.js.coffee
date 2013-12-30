App.Item = DS.Model.extend(
  name:    DS.attr()
  cost:    DS.attr()
  numAvailable: DS.attr() #available for purchase
  controllerName: DS.attr()
  unlocked: DS.attr(undefined, {defaultValue: true}) #visibility
  count: DS.attr('number', {defaultValue: 0}) #number owned
  description: DS.attr()
  

  #Used to distinguish between different item effects
  effectType: DS.attr()
  effectAmount: DS.attr()
    
  purchasable: (->
    @get('unlocked') && @get('numAvailable') > 0
  ).property('numAvailable', 'unlocked')
)
