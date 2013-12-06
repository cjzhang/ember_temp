App.InventoryItemView = Ember.View.extend(
  tagName: 'div'
  classNameBindings: ['id']
  templateName: 'inventory_item'
  
  didInsertElement: ->
    $("#inventory .item").tooltip({position: {at: "left-100% top"}})
)
