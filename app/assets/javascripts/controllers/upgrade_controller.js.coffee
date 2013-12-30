App.UpgradeController = Ember.ObjectController.extend(
  needs: ['game']
  
  buy: ->
    gameController = @get('controllers.game')
    if gameController.attemptPurchase(@get('cost'))
      gameController.logMessage("You upgraded to a " + @get('name') + "!") 
      
      #find modifier and activate it (note you need to use a promise
      #here because it has to be loaded into the store first apparently)
      modifier = @get("modifier").then((modifier) ->
        modifier.set("active", true)
        monster = modifier.get("monster")
        game = modifier.get("game")
        
        #FixtureAdapter and the hasMany relation is basically broken
        #so we work around it by manually inserting the relation into 
        #the store because belongsTo relations seem functional
        if monster
          monster.get("modifiers").pushObject(modifier)
          monster.save()

        if game
          game.get("modifiers").pushObject(modifier)
          game.save()
        modifier.save()
      )


      @set('purchased', true)
      @get("model").save()
      @store.commit()
      return true
    else
      gameController.setError("You can't afford that.")
      return false
)
