App.EggController = Ember.ObjectController.extend(
  needs: ['game']
  imageUrl: "/images/placeholder_egg_shadowthrust_devart.png"
  height: '200px'
  width: '200px'
  game: null
  currentMonster: null
  
  #computed properties are not functions
  perClick: (->
    @game.get("perClick")
  ).property("game.perClick")
  
  expObserver: (->
    return unless @currentMonster
    if @currentMonster.get('exp') >= @get('levelUpCost')
      @currentMonster.incrementProperty('exp', - @get('levelUpCost'))
      @currentMonster.incrementProperty('level')
      @get("controllers.game").recalculate()
  ).observes('currentMonster', 'currentMonster.exp')
  
  levelUpCost: (->
    return unless @currentMonster
    Math.ceil(@currentMonster.get("baseExpRequired") * Math.pow(@currentMonster.get('growthRate'), @currentMonster.get('level')))
  ).property('currentMonster', 'currentMonster.level')
  
  selectMonster: (monster) ->
    if monster
      @set("imageUrl", monster.get("imageUrl"))
      @set("currentMonster", monster)
    else
      @resetMonster()
      
  resetMonster: ->
    @set("imageUrl", "/images/placeholder_egg_shadowthrust_devart.png")
    @set("currentMonster", null)
    
  #Provides XP to the monster if a monster is selected.
  #Provides eggs otherwise
  click: ->
    if @currentMonster
      @currentMonster.incrementProperty('exp', @get('perClick'))
      @game.set('lifetimeExp', @game.get('lifetimeExp') + @get('perClick'))
    else
      @game.incrementProperty('count', @get('perClick'))
      @game.incrementProperty('lifetimeCount', @get('perClick'))
 
)
