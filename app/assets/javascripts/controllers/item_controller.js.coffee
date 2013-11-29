App.ItemController = Ember.ObjectController.extend(
  needs: ['game']
  
  buy: ->
    gameController = @get('controllers.game')
    if gameController.get("count") > @get('cost')
      gameController.get("game").decrementProperty('count', @get('cost'))
      @incrementProperty('count')
      @decrementProperty('numAvailable')

)
