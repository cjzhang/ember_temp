App.GameController = Ember.ObjectController.extend(
  game: null
  needs: ["monsters", "timedEvents"]

  perSecond: (->
    perSecondTotal = @game.get("basePerSecond")
    perSecondMultiplierTotal = @game.get("basePerSecondMultiplier")

    #monsters increase income per second
    @game.get("monsters").forEach( (mon) ->
      perSecondTotal += mon.get("count") * mon.get("perSecond")
    )

    #active modifiers do various things
    @game.get("modifiers").filterBy("appliesTo", "tick").forEach( ((modifier) ->
      switch(modifier.get("type"))
        when "multiply"
          perSecondMultiplierTotal *= modifier.get("amount")
    ))

    return perSecondTotal * perSecondMultiplierTotal

    ).property("game.modifiers", "game.monsters.@each.count", 
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
    
    @game.get("monsters").forEach( (mon) ->
      mon.incrementProperty("eggsEarned", mon.get("totalPerSecond"))
    )

    @game.get("modifiers").forEach((modifier, index) ->
      if (modifier.get("ticksRemaining") > 0)
        modifier.decrementProperty('ticksRemaining')

        if (modifier.get("ticksRemaining") == 0)
          modifier.deleteRecord()        
    , this)

    @get("controllers.timedEvents").tick()

    @store.commit()

  addModifier: (modifier) ->
    @game.get("modifiers").pushObject(modifier)
    @game.save()

  unlockUpgrade: (upgrade) ->
    return if upgrade.get("unlocked") == true
    upgrade.set("unlocked", true)
    upgrade.save()
    @logMessage(upgrade.get('name') + " is available for purchase at the upgrade shop.")
  
  attemptPurchase: (cost) ->    
    if @game.get("count") < cost
      return false 
    else
      @game.decrementProperty("count", cost)
      @game.save()
      return true
)
