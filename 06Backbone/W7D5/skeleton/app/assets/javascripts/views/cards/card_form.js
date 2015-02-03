TrelloClone.Views.CardForm = Backbone.View.extend({

  template: JST['cards/card_form'],

  tagName: 'div="card-create"',

  initialize: function (options) {
    this.listView = options.listView;
  },

  events: {
    'submit .card-create': 'createCard',
  },

  render: function(){
    var content = this.template({list: this.listView.model});
    this.$el.html(content);
    return this;
  },

  createCard: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON().card;
    var card = new TrelloClone.Models.Card(params)
    card.save({},{
      success: function(){
        this.listView.model.cards().add(card);
        this.listView.addCardItems(card);
        this.$el.empty();
      }.bind(this)
    });
  },
});
