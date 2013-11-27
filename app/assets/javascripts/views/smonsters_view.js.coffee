App.xMonstersView = Ember.CollectionView.create({
  tagName: 'ul',
  content: ["A"],
  itemViewClass: Ember.View.extend({
    #template: Ember.Handlebars.compile("{{view.content}}")
  })
});
