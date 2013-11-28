App.MultiplierPotionController = Ember.ObjectController.extend(
  item: null
  game: null
  ticksRemaining: 0
  active: false

  buy: ->
    return unless @canPurchase()
    @decrementCost()
    @activate()


  activate: ->
    @active = true
    @game.set("perSecondMultiplier", 2)
    @ticksRemaining += 20

  checkIfOver: ->
    if @active? && @ticksRemaining > 0 #ob1 error if this is 0
      @ticksRemaining -= 1
    else if @active?
      @active = false
      @game.set("perSecondMultiplier", 1)

  canPurchase: ->
    @game.get('count') > @item.get('cost')

  decrementCost: ->
    @game.set("count", @game.get('count') - @item.get('cost'))
)
