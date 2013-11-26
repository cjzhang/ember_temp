# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource 'foo', ->
    @route ':foo_id'

App.ApplicationRoute = Ember.Route.extend (redirect: ->
    # Project settings is the default route
    @transitionTo "foo"
)

App.FooRoute = Ember.Route.extend(
  model: ->
    return @store.createRecord(App.Foo, {
      name: "my model name"
      description: "a description"
    })

  setupController: (controller, model) ->
    @_super controller, model

    applicationController = @controllerFor("application")
)