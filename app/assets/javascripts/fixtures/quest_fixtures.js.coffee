App.Quest.FIXTURES = [
  {
  id: "level0"
  name: "P-p-p-pidgey?"
  description: "As your pokemon gain levels, they become more efficient egg layers. Get a pidgey to level three."
  unlocked: true
  controllerName: "levelQuest"

  completionIds: ["pidgey"]
  completionAmount: 3

  #if the attribute is a number, then it's incremented, otherwise it's set
  rewardModel: "item"
  rewardIds: ["mpotion"]
  rewardAttribute: "count"
  rewardValue: 1

  rewardString: "Multiplier Potion x1"
  }
]

