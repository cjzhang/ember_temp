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

    length = @get("effectAmount")
    if existingEffect
      existingEffect.incrementProperty("ticksRemaining", length)
      existingEffect.save()
    else
      #Will get destroyed on reload.
      effect = @store.createRecord(App.Modifier, {
        name: "Feeling Multiplicative"
        description: "Your monsters are producing eggs twice as fast."
        active: true
        ticksRemaining: length
        type: "multiply"
        amount: 2
        appliesTo: "tick"
      })
      @get("controllers.game").addModifier(effect)

)
