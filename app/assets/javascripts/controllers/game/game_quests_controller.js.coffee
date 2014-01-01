App.GameQuestsController = Ember.ArrayController.extend(  
  needs: ['game']

  lookupItemController: (object) ->
    object.get("controllerName")
    
  hasVisibleQuests: (->
    @filterBy("visible", true)
  ).property('@each.visible')
)
