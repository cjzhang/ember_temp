App.NavigationController = Ember.ObjectController.extend(
  needs: ["game"]
  activeTab: "statistics"
  actions: {
    toggle: (tabName) ->
      @set("activeTab", tabName)
  }
  
  statsActive: (->
    @activeTab == "statistics").property('activeTab')
    
  menuActive: (->
    @activeTab == "menu").property('activeTab')
  
  aboutActive: (->
    @activeTab == "about").property('activeTab')
  
)
