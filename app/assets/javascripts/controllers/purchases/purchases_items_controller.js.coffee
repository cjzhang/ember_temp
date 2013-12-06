App.PurchasesItemsController = Ember.ArrayController.extend(
  needs: ['game']

  lookupItemController: (object) ->
    object.get("controllerName")
    
  hasPurchasableItems: (->
    @filterBy("purchasable")
  ).property('@each.numAvailable', '@each.unlocked')
)
