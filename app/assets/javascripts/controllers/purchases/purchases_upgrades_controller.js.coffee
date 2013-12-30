App.PurchasesUpgradesController = Ember.ArrayController.extend(
  itemController: 'upgrade'

  hasPurchasableItems: (->
    @filterBy("purchasable")
  ).property('@each.purchasable')
)
