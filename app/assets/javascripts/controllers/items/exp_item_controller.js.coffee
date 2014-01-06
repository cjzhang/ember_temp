App.ExpItemController = App.ItemController.extend(
   
  actions: { 
    use: ->
      @activate()
  }
  
  activate: ->
    eggController = @get("controllers.egg")
    if eggController.addExp(@get("effectAmount"))
      @decrementProperty('count', 1)
      @get("model").save
    else
      @get("controllers.game").setError("Your selected pokemon can't gain XP.")

)
