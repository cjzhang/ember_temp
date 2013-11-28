App.MonsterSelectView = Ember.View.extend(
  tagName: 'span'
  classNameBindings: ['id']
  templateName: 'monsterSelect'
  click: (e) ->
    #content is an instance of a Monster model (or null on the reset icon)
    @get("controller").selectMonster(@content)
)
