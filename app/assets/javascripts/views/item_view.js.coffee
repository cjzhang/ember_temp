App.ItemView = Ember.View.extend(
  tagName: 'div'
  classNameBindings: ['id']
  templateName: 'item'
  click: (e) ->
    #@content is an instance of ItemController (or a specialcased one as per
    #lookupItemController in ItemsController
    @content.buy()
)
