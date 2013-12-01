App.ItemController = Ember.ObjectController.extend(
  needs: ['game']
  
  buy: ->
    gameController = @get('controllers.game')
    if gameController.get("count") > @get('cost')
      gameController.get("game").decrementProperty('count', @get('cost'))
      @incrementProperty('count')
      @decrementProperty('numAvailable')
      gameController.setNotice("You've purchased a new " + @get("name").toLowerCase() + ". Exciting!")
      return true
    else
      gameController.setError("You can't afford that.")
      return false
)
