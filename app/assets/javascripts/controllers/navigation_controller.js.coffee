App.NavigationController = Ember.ObjectController.extend(
  needs: ["game", "egg"]
  activeTab: "log"
  actions: {
    toggle: (tabName) ->
      @set("activeTab", tabName)
  }
  
  logActive: (->
    @activeTab == "log").property('activeTab')

  statsActive: (->
    @activeTab == "statistics").property('activeTab')
    
  menuActive: (->
    @activeTab == "menu").property('activeTab')
  
  aboutActive: (->
    @activeTab == "about").property('activeTab')
  
)
