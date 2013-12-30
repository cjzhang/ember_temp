App.PurchasesItemsController = Ember.ArrayController.extend(
  lookupItemController: (object) ->
    object.get("controllerName")
    
  hasPurchasableItems: (->
    @filterBy("purchasable")
  ).property('@each.numAvailable', '@each.unlocked')
)
