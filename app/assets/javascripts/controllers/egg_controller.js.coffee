App.EggController = Ember.ObjectController.extend(
  imageUrl: "/images/placeholder_egg_shadowthrust_devart.png"
  height: '200px'
  width: '200px'
  game: null
  currentMonster: null
  
  selectMonster: (monster) ->
    if monster
      @set("imageUrl", monster.get("imageUrl"))
      @set("currentMonster", monster)
    else
      @resetMonster()
      
  resetMonster: ->
    @set("imageUrl", "/images/placeholder_egg_shadowthrust_devart.png")
    @set("currentMonster", null)
)
