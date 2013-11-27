App.FooController = Ember.ObjectController.extend(
  foo: null,
  bar: null

  increment: ->
    @bar.set('count', @bar.get('count') + 1)
)