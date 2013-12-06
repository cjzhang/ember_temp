App.MultiplierPotionController = App.ItemController.extend(
   
  actions: { 
    use: ->
      @activate()
  }
  
  activate: ->
    @decrementProperty('count', 1)
    @get("model").save
    effect = @store.createRecord(App.Modifier, {
      name: "Feeling Multiplicative"
      description: "Your monsters are producing eggs twice as fast."
      active: true
      ticksRemaining: 20
      type: "perSecondMultiplier"
      amount: 1
    })
    @get("controllers.game").addModifier(effect)

)
