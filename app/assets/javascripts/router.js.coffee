# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource 'foo', ->
    @route ':foo_id'
  @resource 'game', ->
  

App.ApplicationRoute = Ember.Route.extend (redirect: ->
    # game is the default route
    @transitionTo "game"
)

App.GameRoute = Ember.Route.extend(
  model: ->
    return @store.createRecord(App.Game, {
      title: "Game"
      playerName: "Player"
      count: 0
      perClick: 1
      perSecond: 0.1
    })
  setupController: (controller, model) ->
    @_super controller, model
    controller.set('game', model)
    eggController = @controllerFor("egg")
    eggController.set('game', model)
    
  
  renderTemplate: ->
    @_super(this, arguments)
    @render('egg', {
      outlet: 'egg',
      into: 'game',
      controller: @controllerFor("egg")
    })
    @render('monsters', {
      outlet: 'purchases',
      into: 'game',
      controller: null #@controllerFor("monsters")
    })
)

App.FooRoute = Ember.Route.extend(
  model: ->
    return @store.createRecord(App.Foo, {
      name: "my model name"
      description: "a description"
    })

  setupController: (controller, model) ->

    @_super controller, model
    controller.set('foo', model)
    controller.set('bar', @store.createRecord(App.Bar, {
      count: 0
      rate: 0
    }))
    applicationController = @controllerFor("application")

  #http://blog.safaribooksonline.com/2013/09/10/ember-js-outlets/
  renderTemplate: ->
    @_super(this, arguments)
    @render('bar', {
      outlet: 'bar',
      into: 'foo'
    })

)
