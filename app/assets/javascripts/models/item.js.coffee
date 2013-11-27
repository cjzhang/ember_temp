App.Item = DS.Model.extend(
  name:    DS.attr()
  cost:    DS.attr()

  init: ->
    @_super(this, arguments)
)
