App.LevelQuestController = App.QuestController.extend(
   
  actions: { 
    complete: ->
      @complete()
  }
  
  #Checks the level of specific mons
  complete: ->
    monsters = []
    rewards = []

    for id in @get("completionIds")
      monsters.push(@store.find("monster", id))

    for id in @get("rewardIds")
      rewards.push(@store.find(@get("rewardModel"), id))

    Ember.RSVP.all([monsters, rewards, this]).then( (x) ->
      
      monsters = x[0]
      rewards = x[1]
      quest = x[2]
      
      failures = monsters.filter((mon) ->
        mon.get("displayLevel") < quest.get("completionAmount")
      )
      
      if failures.length == 0
        quest.success(rewards)
      else
        quest.fail()
    )

)
