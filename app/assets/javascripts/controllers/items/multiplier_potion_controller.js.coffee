App.MultiplierPotionController = App.ItemController.extend(
   
  actions: { 
    use: ->
      @activate()
  }
  
  activate: ->
    @decrementProperty('count', 1)
    @get("model").save
    
    mods = @get("controllers.game.modifiers")
    existingEffect = mods.findBy("name", "Feeling Multiplicative")

    if existingEffect
      existingEffect.incrementProperty("ticksRemaining", 20)
      existingEffect.save()
    else
      effect = @store.createRecord(App.Modifier, {
        name: "Feeling Multiplicative"
        description: "Your monsters are producing eggs twice as fast."
        active: true
        ticksRemaining: 20
        type: "multiply"
        amount: 2
        appliesTo: "tick"
      })
      @get("controllers.game").addModifier(effect)

)
