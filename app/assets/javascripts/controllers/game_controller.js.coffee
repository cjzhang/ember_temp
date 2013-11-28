App.GameController = Ember.ObjectController.extend(
  game: null

  perSecond: (->
    @game.get("perSecond") * @game.get("perSecondMultiplier")
  ).property("game.perSecond", "game.perSecondMultiplier")
)
