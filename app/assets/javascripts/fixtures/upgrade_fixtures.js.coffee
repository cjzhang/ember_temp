App.Upgrade.FIXTURES = [
  {id: "eggUpgrade0"
  name:    "Binoculars"
  cost:    100
  unlocked: true
  modifier: "eggClick0"
  description: "You find one more egg per click."
  }
  ,
  {id: "pidgeyUpgrade0"
  name:    "Sand Nest"
  cost:    200
  unlocked: false
  modifier: "pidgeyTick0"
  description: "Your pidgeys lay eggs twice as quickly."
  unlockCondition: "pidgey_quantity"
  unlockValue: 5
  }
  ,
  {id: "pidgeyUpgrade1"
  name:    "Gust"
  cost:    500
  unlocked: false
  modifier: "pidgeyClick0"
  description: "Your pidgeys gain twice as much experience during training."
  unlockCondition: "pidgey_quantity"
  unlockValue: 20
  }
]