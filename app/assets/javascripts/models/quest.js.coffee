App.Quest = DS.Model.extend(
  name:    DS.attr()
  description:    DS.attr()
  completed: DS.attr("boolean", {defaultValue: false}) #available for purchase
  unlocked: DS.attr("boolean", {defaultValue: false}) #visibility
  
  controllerName: DS.attr("string", {defaultValue: "quest"}) #Same behavior as items

  completionIds: DS.attr()
  completionAmount: DS.attr()

  #if the attribute is a number, then it's incremented, otherwise it's set
  rewardModel: DS.attr()
  rewardIds: DS.attr()
  rewardAttribute: DS.attr()
  rewardValue: DS.attr()

  rewardString: DS.attr()
)
