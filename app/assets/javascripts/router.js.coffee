# For more information see: http://emberjs.com/guides/routing/

#TODO refactor game to have monsters nested after it (/game/:game_id/monsters and /game/:game_id/items)
App.Router.map () ->
  @resource 'game', { path: '/game/:game_id' }, ->
    #or better with purchase resource (and purchaseindex tab) and then
    #routes (monsters, items) beneath that
    @resource 'purchases', {path: '/purchases'}, ->
      @route 'monsters', {path: '/monsters'}
      @route 'items', {path: '/items'}
      @route 'upgrades', {path: '/upgrades'}
    @route('navigation', { path: '/navigation/:navigation_tab' })

App.ApplicationRoute = Ember.Route.extend(

  #Takes all the game data, turns it into a json hash, 
  #and shoves it in localStorage.
  #Structure:
  # {
  #  modelName: [{id: 1, attribute: value, attribute2: value}]
  # }
  actions: {
    save: ->
      data = {}
      blueprint = {
        "game": ["playerName", "count", "lifetimeCount", "lifetimeExp"]
        "item": ["numAvailable", "unlocked", "count"]
      }
      
      keys = Object.keys(blueprint)

      for key in keys
        desiredAttrs = blueprint[key]

        models = @store.find(key)
        
        models.forEach( (model) ->
          data[model.constructor] ||= []

          attrs = {id: model.get("id")}
          for attr in desiredAttrs
            attrs[attr] = model.get(attr)

          data[model.constructor].push(attrs)
        )

      string = JSON.stringify(data)
      #string = LZString.compress(string)
      localStorage.setItem("save", string)

    #Pulls data from local storage. 
    #model = the first key, then iterates over the objects that were
    #saved and overwrites the attributes in the store as appropriate
    loadSave: ->
      return unless localStorage && localStorage.getItem("save")
      string = localStorage.getItem("save")
      #string = LZString.decompress(string)
      data = JSON.parse(string)
      currentStore = @store

      updateValues = (models) ->
        currentStore 
        models.forEach((model) ->
          attrs = data[model.constructor].find((x) ->
            x["id"] == model.get("id")
          )
          
          for attr in Object.keys(attrs)
            continue if attr == "id"
            model.set(attr, attrs[attr])
          
          model.save()
          
        )
        
        currentStore.commit()

      #@store.find("game").then(updateValues)
      @store.find("item").then(updateValues)

      false
  }

)

App.IndexRoute = Ember.Route.extend(
  beforeModel: ->
    @transitionTo('purchases.monsters', @store.find("game", 1))
)

App.GameRoute = Ember.Route.extend(
  model: (params) ->
    return @store.find("game", params.game_id)
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
    mons = @store.find("monster")
    monstersController = @controllerFor("monsters")
    monstersController.set('content', mons)

    #TODO FIXME refactor is it possible to make this use a controller instead of the model?
    controller.set('monsters', mons)

    #TODO FIXME refactor controller to depend on gamecontroller and do logic through there
    eggController = @controllerFor("egg")
    eggController.set('game', model)

    @store.find("monster", "egg").then((mon) ->
      eggController.set('currentMonster', mon)
    )

    #TODO FIXME refactor: this may be poorly named??
    items = @store.find("item")
    itemsController = @controllerFor("items")
    itemsController.set('content', items)
    controller.set('items', items)

    @store.find("modifier")
    
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
)


App.PurchasesMonstersRoute = Ember.Route.extend(

    setupController: (controller, model) ->
      @_super controller, model
      #Load monsters
      mons = @store.find('Monster')
      controller.set('content', mons)
)

App.PurchasesItemsRoute = Ember.Route.extend(
    setupController: (controller, model) ->
      @_super controller, model
      #Load monsters
      items = @store.find('Item')
      controller.set('content', items)
)

App.PurchasesUpgradesRoute = Ember.Route.extend(
    setupController: (controller, model) ->
      @_super controller, model
      #Load monsters
      upgrades = @store.find('Upgrade')
      controller.set('content', upgrades)
)
