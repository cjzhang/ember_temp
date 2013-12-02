App.GameController = Ember.ObjectController.extend(
  game: null
  needs: ["monsters"]

  perSecond: (->
    @tickIncrement()
  ).property("game.perSecond", "game.perSecondMultiplier")

  init: ->
    @_super(this, arguments)

  setNotice: (text) ->
    $(".messages .notice").html(text)
    $(".messages .notice").show().delay(1000).fadeOut()

  setError: (text) ->
    $(".messages .error").html(text)
    $(".messages .error").show().delay(1000).fadeOut()

  tick: ->
    @game.incrementProperty('count', @tickIncrement())
    @game.incrementProperty('lifetimeCount', @tickIncrement())
    @game.get("modifiers").forEach((modifier, index) ->
      if (modifier.get("ticksRemaining") > 0)
        modifier.decrementProperty('ticksRemaining')
        if (modifier.get("ticksRemaining") == 0)
          @recalculate()
    , this)


  tickIncrement: ->
    @game.get('perSecond') * @game.get('perSecondMultiplier')

  recalculate: ->
    perSecondTotal = @game.get("basePerSecond")
    perSecondMultiplierTotal = @game.get("basePerSecondMultiplier")
    perClickTotal = @game.get("basePerClick")

    #monsters increase income per second
    @game.get("monsters").forEach( (mon) ->
      perSecondTotal += mon.get("count") * mon.get("perSecond")
    )

    cleaned = @game.get("modifiers").filterProperty("canBeApplied")
    @game.set("modifiers", cleaned)

    #active modifiers do various things
    @game.get("modifiers").forEach( ((modifier) ->
      return unless modifier.get("canBeApplied")

      switch(modifier.get("type"))
        when "perSecondMultiplier"
          perSecondMultiplierTotal += modifier.get("amount")
    ))

    @game.set("perSecond", perSecondTotal)
    @game.set("perSecondMultiplier", perSecondMultiplierTotal)
    @game.set("perClick", perClickTotal)


  addModifier: (modifier) ->
    @game.get("modifiers").push(modifier)
    @recalculate()
)
