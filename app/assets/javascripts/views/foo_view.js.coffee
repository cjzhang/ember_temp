App.FooView = Ember.View.extend({
  click: (e) ->
    alert(this.get('controller').get('model').get('description'))
    this.get('controller').get('model').set('name', "OH GOD I CHANGED THE NAME")
    @get('controller').increment()
})