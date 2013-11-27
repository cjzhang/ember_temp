#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require app

# for more details see: http://emberjs.com/guides/application/
window.setIntervalWithContext = (code,delay,context) ->
  setInterval((-> code.call(context)), delay)
      
window.App = Ember.Application.create()
App.Store = DS.Store.extend(adapter: DS.FixtureAdapter)


