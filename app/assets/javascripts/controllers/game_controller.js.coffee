App.GameController = Ember.ObjectController.extend(
  game: null

  perSecond: (->
    @game.get("perSecond") * @game.get("perSecondMultiplier")
  ).property("game.perSecond", "game.perSecondMultiplier")
  
  recalculate: ->
    total = 0
    @game.get("monsters").forEach( (mon) -> 
      total += mon.get("count") * mon.get("basePerSecond")
    )
    @game.set("perSecond", total)
)
