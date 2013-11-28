App.NavigationController = Ember.ObjectController.extend(
  activeTab: "statistics"
  actions: {
    toggle: (tabName) ->
      @set("activeTab", tabName)
  }
  
  statsActive: (->
    @activeTab == "statistics").property('activeTab')
  
  aboutActive: (->
    @activeTab == "about").property('activeTab')
    
)
