App.MonstersController = Ember.ArrayController.extend(
  needs: ['egg']
  itemController: 'monster'
  
  selectMonster: (monster) ->
    @get("controllers.egg").selectMonster(monster)
  )


