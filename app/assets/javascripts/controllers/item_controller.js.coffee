App.ItemController = Ember.ObjectController.extend(
  needs: ['game']
  
  atLeastOne: (->
    @get("count") > 0
  ).property("count")
  
  buy: ->
    gameController = @get('controllers.game')
    if gameController.attemptPurchase(@get('cost'))
      gameController.logMessage("You bought a " + @get('name') + "!") 
      @incrementProperty('count')
      @decrementProperty('numAvailable')

      @get("model").save()
      return true
    else
      gameController.setError("You can't afford that.")
      return false
)
