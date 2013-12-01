App.MonstersView = Ember.View.extend(

  didInsertElement: (e) ->
    $(".purchases .monsters").tooltip({position: {at: "left-100% top"}})
)
