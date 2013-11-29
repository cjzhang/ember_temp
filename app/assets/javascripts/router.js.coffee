# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource 'game', { path: '/game/:game_id' }

App.ApplicationRoute = Ember.Route.extend (redirect: ->
    # game is the default route
    @transitionTo "game", App.Game.find(2)
)

App.GameRoute = Ember.Route.extend(
  model: (params) ->
    return App.Game.find(params.game_id)
  setupController: (controller, model) ->
    @_super controller, model
    
    #gameController ends up knowing p much everything
    #about what it owns, for calculation purposes
    controller.set('game', model)
    setIntervalWithContext((-> @tick()), 1000, controller)
    
    #Load monsters
    mons = App.Monster.find()
    monstersController = @controllerFor("monsters")
    monstersController.set('content', mons)
    controller.set('monsters', mons)    
        
    eggController = @controllerFor("egg")
    eggController.set('game', model)


    items = App.Item.find()
    itemsController = @controllerFor("items")
    itemsController.set('content', items)
    controller.set('items', items) 


  renderTemplate: ->
    @_super(this, arguments)
    @render('egg', {
      outlet: 'egg',
      into: 'game',
      controller: @controllerFor("egg")
    })
    @render('navigation', {
      outlet: 'navigation',
      into: 'game',
      controller: @controllerFor("navigation")
    })
    @render('monsters', {
      outlet: 'monsters',
      into: 'game',
      controller: @controllerFor("monsters")
    })
    @render('items', {
      outlet: 'store',
      into: 'game',
      controller: @controllerFor("items")
    })
)

