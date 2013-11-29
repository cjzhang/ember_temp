App.MultiplierPotionController = App.ItemController.extend(
  ticksRemaining: 0
  active: false
  
  #item is stored as @content and can straightup use @get
  #Also multiplier potions are used immediately
  buy: ->
    @_super()
    @activate()
    
  use: ->
    @activate()

  activate: ->
    @decrementProperty('count', 1)
    effect = @store.createRecord(App.Modifier, {
      name: "Feeling Multiplicative"
      description: "Your monsters are producing eggs twice as fast."
      active: true
      ticksRemaining: 3
      type: "perSecondMultiplier"
      amount: 1
    })
    @get("controllers.game").addModifier(effect)

)
