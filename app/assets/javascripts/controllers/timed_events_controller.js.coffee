App.TimedEventsController = Ember.ArrayController.extend(
  lookupItemController: (object) ->
    object.get("controllerName")

  tick: ->
    @forEach((timedEvent) ->
      if timedEvent.get("ticksRemaining") > 0
        timedEvent.decrementProperty("ticksRemaining")

        if timedEvent.get("ticksRemaining") == 0
          timedEvent.activate()
          timedEvent.reset()
        timedEvent.get("model").save()
    )
)


