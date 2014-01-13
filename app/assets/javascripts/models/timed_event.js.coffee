App.TimedEvent = DS.Model.extend(
  name:    DS.attr()
  ticksRemaining:    DS.attr('number', {defaultValue: -1})
  initialTicks: DS.attr() #available for purchase
  controllerName: DS.attr('string', {defaultValue: "timedEvent"})
)
