App.MonsterController = Ember.ObjectController.extend(
  needs: ['game']
  
  cost: (-> 
    @get('baseCost') * Math.pow(@get('controllers.game').get('growthRate'), 
      @get('count'))
  ).property('count')
  
  buy: ->
    gameController = @get('controllers.game')
    if gameController.get("count") > @get('cost')
      gameController.get("game").changeCount(-@get('cost'))
      @content.set('count', @content.get('count') + 1)
      gameController.recalculate()
      
      
)
