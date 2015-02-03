TrelloClone.Views.CardsIndexItem = Backbone.View.extend({

  template: JST['cards/card_item'],


  tagName: 'div class="card-item"',

  events: {
    'click .delete-card':'destroy',
  },

  render: function(){
    var content = this.template({card: this.model});
    this.$el.html(content);
    return this;
  },

  destroy: function (event) {
    this.model.destroy();
  },
});
