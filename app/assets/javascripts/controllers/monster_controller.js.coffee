App.MonsterController = Ember.ObjectController.extend(
  test: (-> @get('description')).property('description')
)
