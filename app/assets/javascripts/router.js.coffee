# For more information see: http://emberjs.com/guides/routing/

#TODO refactor game to have monsters nested after it (/game/:game_id/monsters and /game/:game_id/items)
App.Router.map ()->
  @route 'game', { path: '/game/:game_id' }

App.ApplicationRoute = Ember.Route.extend()

App.IndexRoute = Ember.Route.extend(
  beforeModel: ->
    @transitionTo('game', App.Game.find(2))
)

App.GameRoute = Ember.Route.extend(
  model: (params) ->
    return App.Game.find(params.game_id)
  setupController: (controller, model) ->
    @_super controller, model

    #gameController ends up knowing p much everything
    #about what it owns, for calculation purposes

    #this may be unnecessary; other controllers should access the game controller
    #to set things, but NOT the model directly (in an ideal world)
    #FIXME refactor
    controller.set('game', model)
    setIntervalWithContext((-> @tick()), 1000, controller)

    #Load monsters
    mons = App.Monster.find()
    monstersController = @controllerFor("monsters")
    monstersController.set('content', mons)

    #TODO FIXME refactor is it possible to make this use a controller instead of the model?
    controller.set('monsters', mons)

    #TODO FIXME refactor controller to depend on gamecontroller and do logic through there
    eggController = @controllerFor("egg")
    eggController.set('game', model)

    #TODO FIXME refactor: this may be poorly named??
    items = App.Item.find()
    itemsController = @controllerFor("items")
    itemsController.set('content', items)
    controller.set('items', items)

  actions: {
    buy: (object)->
      @controllerFor("game").buy(object)
  }

  #TODO refactor : should things be shoved into templates or into views?
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

