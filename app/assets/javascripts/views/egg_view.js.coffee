App.EggView = Ember.View.extend({
  click: (e) ->
    @controller.game.click()
})
