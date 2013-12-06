App.PurchasesItemsView = Ember.View.extend(

  didInsertElement: (e) ->
    $(".purchases .item").tooltip({position: {at: "left-100% top"}})
)
