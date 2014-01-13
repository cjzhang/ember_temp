App.TimedEventController = Ember.ObjectController.extend(
  needs: ["game"]

  activate: ->
    gameController = @get("controllers.game")
    gameController.logMessage(@get("name") + " has happened.")
    return true

  reset: ->
    @set("ticksRemaining", @get("initialTicks"))
    return true
)
