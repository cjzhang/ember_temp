App.MonsterView = Ember.View.extend(
  tagName: 'div'
  classNameBindings: ['id']
  templateName: 'monster'
  click: (e) ->
    #content is an instance of a MonsterController that wraps a Monster model
    @content.buy()
)
