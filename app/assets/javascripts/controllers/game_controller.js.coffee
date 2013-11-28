App.GameController = Ember.ObjectController.extend(
  game: null
  needs: ["monsters"]

  perSecond: (->
    @game.get("perSecond") * @game.get("perSecondMultiplier")
  ).property("game.perSecond", "game.perSecondMultiplier")
  
  recalculate: ->
    total = 0
    @game.get("monsters").forEach( (mon) -> 
      total += mon.get("count") * mon.get("perSecond")
    )
    @game.set("perSecond", total)
)
