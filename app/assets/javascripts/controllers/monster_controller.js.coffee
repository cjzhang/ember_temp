App.MonsterController = Ember.ObjectController.extend(
  needs: ['game']

  cost: (->
    @get('baseCost') * Math.pow(@get('controllers.game').get('growthRate'),
      @get('count'))
  ).property('count')

  quantityUnlocker: (->
    upgrades = @store.find("upgrade").filterBy("unlocked", false)
    quantityUpgrades = upgrades.filterBy("unlockCondition", @get("id") + "_quantity")
    
    count = @get("count")
    gameController = @get('controllers.game')

    quantityUpgrades.forEach( (upgrade) ->
      if count >= upgrade.get("unlockValue")
        gameController.unlockUpgrade(upgrade)
    )
  ).observes('count')

  #TODO refactor this to use the buy action defined in GameRoute
  #TODO refactor don't access game directly
  actions: {
    buy: ->
      gameController = @get('controllers.game')
      if gameController.attemptPurchase(@get('cost'))
        gameController.logMessage("You bought a " + @get('name') + "!")
        @incrementProperty('count')
        @get("model").save()
    }
)
