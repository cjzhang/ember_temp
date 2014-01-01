App.QuestController = Ember.ObjectController.extend(
  needs: ['game']
  
  visible: (->
    !@get("completed") && @get("unlocked")
  ).property("completed", "unlocked")
  
  #needs be overwritten in child classes
  #Possible to define entirely in fixtures? Would need:
  #"completionModel", completionIds", "completionAmount", "controllerName"
  #"rewardModel", "rewardIds", rewardAttribute", "rewardValue"

  #Level pidgey to 3 for 200 eggs
  #monster, [pidgey], 3, levelQuest
  #game, 1, count, 200

  #Level pidgey and farfetch'd to 5 for 2 multiplier potions
  #[pidgey, farfetchd], 5, levelQuest
  #item, [mpotion], count, 2

  #Or could give it a custom controller altogether for really fancy stuff
  actions: {
    complete: ->
      return false 
  }

  success: (rewards) ->
    quest = this
    rewardValue = quest.get("rewardValue")
    rewardAttr = quest.get("rewardAttribute")
    for reward in rewards
      if !isNaN(parseInt(rewardValue))
        reward.incrementProperty(rewardAttr, parseInt(rewardValue))
      else
        reward.set(rewardAttr, rewardValue)
      reward.save()

    quest.set("completed", true)
    quest.get("controllers.game").setNotice("Completed " + quest.get("name") + "!")
    quest.get("controllers.game").logMessage("Completed \"" + quest.get("name") + "\" and got: " + quest.get("rewardString"))
    quest.save()

  fail: ->
    @get("controllers.game").setError("You don't meet the requirements to complete this quest.")
)
