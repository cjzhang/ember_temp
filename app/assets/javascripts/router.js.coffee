# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource 'foo', ->
    @route ':foo_id'
  @resource 'game', { path: '/game/:game_id' }

App.ApplicationRoute = Ember.Route.extend (redirect: ->
    # game is the default route
    @transitionTo "game", App.Game.find(1)
)

App.GameRoute = Ember.Route.extend(
  model: (params) ->
    return App.Game.find(params.game_id)
  setupController: (controller, model) ->
    @_super controller, model
    controller.set('game', model)
    mons = App.Monster.find()
    controller.set('monsters', mons)
    eggController = @controllerFor("egg")
    eggController.set('game', model)

    mpController = @controllerFor("multiplierPotion")
    mpController.set('game', model)
    mpController.set('item', @store.createRecord(App.Item, {
      name: "Multiplier Potion"
      cost: 100
    }))
    setIntervalWithContext((-> @checkIfOver()), 1000, mpController)

    monstersController = @controllerFor("monsters")
    monstersController.set('content', mons)

  renderTemplate: ->
    @_super(this, arguments)
    @render('egg', {
      outlet: 'egg',
      into: 'game',
      controller: @controllerFor("egg")
    })
    @render('monsters', {
      outlet: 'monsters',
      into: 'game',
      controller: @controllerFor("monsters")
    })
    @render('multiplierPotion', {
      outlet: 'multiplierPotion',
      into: 'game',
      controller: @controllerFor("multiplierPotion")
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
