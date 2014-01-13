App.ShopRestockController = App.TimedEventController.extend(
  needs: ["game"]

  activate: ->
    gameController = @get("controllers.game")

    @store.find('item').then((items) ->
      promises = []
      #I don't really understand this but I think the item.save() wasn't
      #getting properly run until after "item" got redefined to a diff
      #item or something.
      restocked = false
      items.forEach((item) ->
        Ember.RSVP.all(promises).then((results) ->
          if item.get("numAvailable") < item.get("shopRestockAmount")
            item.set("numAvailable", item.get("shopRestockAmount"))
            restocked = true
            promises.pushObject(item.save())
        )
      )

      Ember.RSVP.all(promises).then((x) ->
        if restocked
          gameController.logMessage("The item store has restocked its wares.")
      )
    )
)
