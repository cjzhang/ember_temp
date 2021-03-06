App.EggController = Ember.ObjectController.extend(
  needs: ['game']
  imageUrl: "/images/egg.png"
  height: '200px'
  width: '200px'
  game: null
  currentMonster: null
  
  showLevel: (->
    @currentMonster.id != "egg"
  ).property("currentMonster")

  #computed properties are not functions
  perClick: (->
    base = @game.get("basePerClick")
    multiplier = 1

    @getModifiers().forEach((mod) ->
      switch(mod.get("type"))
        when "multiply"
          multiplier *= mod.get("amount")
        when "add"
          base += mod.get("amount")
    )

    return base * multiplier
  ).property("game.basePerClick", "currentMonster")
  
  expObserver: (->
    while @currentMonster.get('exp') >= @get('levelUpCost')
      @currentMonster.decrementProperty('exp', @get('levelUpCost'))
      @currentMonster.incrementProperty('level')
      @currentMonster.save()
  ).observes('currentMonster', 'currentMonster.totalExp')
  
  levelUpCost: (->
    Math.ceil(@currentMonster.get("baseExpRequired") * Math.pow(@currentMonster.get('growthRate'), @currentMonster.get('level')))
  ).property('currentMonster', 'currentMonster.level')
  
  selectMonster: (monster) ->
    @set("imageUrl", monster.get("imageUrl"))
    @set("currentMonster", monster)
    
  #Provides XP to the monster if a monster is selected.
  #Provides eggs otherwise
  click: ->  
    if @currentMonster.id == "egg"
      @game.incrementProperty('count', @get('perClick'))
      @game.incrementProperty('lifetimeCount', @get('perClick'))
    else
      @addExp(@get('perClick'))

    @game.save()

  #These refer to modifiers that belong to clickyness.
  getModifiers: ->
    @currentMonster.get("modifiers").filterProperty("active").filterBy("appliesTo", "click")
    
  addExp: (amount)->
    return false if @currentMonster.id == "egg"
    
    @game.incrementProperty('lifetimeExp', amount)
    @game.save()
    @currentMonster.incrementProperty('exp', amount)
    @currentMonster.incrementProperty('totalExp', amount)
    @currentMonster.save()
)
