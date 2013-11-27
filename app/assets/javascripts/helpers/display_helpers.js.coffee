Ember.Handlebars.helper('prettyNumber', (value) ->
  numeral(value).format('0,0.0')
)
