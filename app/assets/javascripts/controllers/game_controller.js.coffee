App.GameController = Ember.ObjectController.extend(
  game: null
  needs: ["monsters"]

  perSecond: (->
    perSecondTotal = @game.get("basePerSecond")
    perSecondMultiplierTotal = @game.get("basePerSecondMultiplier")

    #monsters increase income per second
    @game.get("monsters").forEach( (mon) ->
      perSecondTotal += mon.get("count") * mon.get("perSecond")
    )

    #active modifiers do various things
    @game.get("modifiers").forEach( ((modifier) ->
      switch(modifier.get("type"))
        when "multiply"
          perSecondMultiplierTotal *= modifier.get("amount")
    ))

    return perSecondTotal * perSecondMultiplierTotal

    ).property("game.modifiers.length", "game.monsters.@each.count", 
    "game.monsters.@each.perSecond")

  init: ->
    @_super(this, arguments)

  setNotice: (text) ->
    $(".messages .notice").html(text)
    $(".messages .notice").show().delay(1000).fadeOut()

  setError: (text) ->
    $(".messages .error").html(text)
    $(".messages .error").show().delay(1000).fadeOut()

  logMessage: (text) ->
    $("#log-messages").prepend("<li>" + text + "</li>")

  tick: ->
    @game.incrementProperty('count', @get('perSecond'))
    @game.incrementProperty('lifetimeCount', @get('perSecond'))
    @game.get("modifiers").forEach((modifier, index) ->
      if (modifier.get("ticksRemaining") > 0)
        modifier.decrementProperty('ticksRemaining')
        if (modifier.get("ticksRemaining") == 0)
          modifier.deleteRecord()
          @store.commit()
    , this)

  addModifier: (modifier) ->
    @game.get("modifiers").pushObject(modifier)
    @game.save()

  attemptPurchase: (cost) ->
    amount = @game.get("count").toFixed(4)
    return false if amount < cost

    @game.decrementProperty("count", cost)
    return true
)
