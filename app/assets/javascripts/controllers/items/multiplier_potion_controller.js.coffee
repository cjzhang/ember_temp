App.MultiplierPotionController = App.ItemController.extend(
  ticksRemaining: 0
  active: false
  
  #item is stored as @content and can straightup use @get
  buy: ->
    @_super()
    #@activate()
    
  use: ->
    @activate()


  activate: ->
    @decrementProperty('count', 1)
    @active = true
    @game.set("perSecondMultiplier", 2)
    @ticksRemaining += 20

  checkIfOver: ->
    if @active? && @ticksRemaining > 0 #ob1 error if this is 0
      @ticksRemaining -= 1
    else if @active?
      @active = false
      @game.set("perSecondMultiplier", 1)

)
