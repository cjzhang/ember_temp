App.MonsterController = Ember.ObjectController.extend(
  needs: ['game']

  cost: (->
    @get('baseCost') * Math.pow(@get('controllers.game').get('growthRate'),
      @get('count'))
  ).property('count')

  tryUnlockQuantityUpgrade: ->
    upgrades = @store.find("upgrade")
    upgrades.filterBy("unlocked", false)
    quantityUpgrades = upgrades.filterBy("unlockCondition", @get("id") + "_quantity")
      
    gameController = @get('controllers.game')
    count = @get('count')
    quantityUpgrades.forEach( (upgrade) ->
      if count >= upgrade.get("unlockValue")
        gameController.unlockUpgrade(upgrade)
    )

  #TODO refactor this to use the buy action defined in GameRoute?
  actions: {
    buy: ->
      gameController = @get('controllers.game')
      if gameController.attemptPurchase(@get('cost'))
        gameController.logMessage("You bought a " + @get('name') + "!")
        @incrementProperty('count')
        @get("model").save()

        @tryUnlockQuantityUpgrade()


    
  }
)
