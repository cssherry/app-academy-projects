TrelloClone.Views.ListsIndexItem = Backbone.CompositeView.extend({

  template: JST['lists/list_item'],

  tagName: 'div class="list-item"',

  events: {
    'click .delete-list':'destroy',
    'click .create-card': 'createCardForm',
    'click .close-form': 'closeCardForm',
    'sortstop .cards': 'reorderCards',
  },

  initialize: function () {
    this.model.fetch({
      success: function () {
        this.model.cards().each(this.addCardItems.bind(this))
      }.bind(this)
    });

    this.listenTo(this.model.cards(), 'add', this.render);
    this.listenTo(this.model.cards(), 'remove', this.removeCardItem);
  },

  render: function(){
    var content = this.template({list: this.model});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  onRender: function () {
    this.$('.cards').sortable({
      //doesn't work yet
      // connectWith: $('.cards')
    })
  },

  destroy: function (event) {
    this.model.destroy();
  },

  createCardForm: function (event) {
    event.preventDefault();
    var cardForm = new TrelloClone.Views.CardForm({listView: this});
    this.addSubview(".card-form", cardForm);
    this.$('.create-card').html('Close form')
    this.$('.create-card').toggleClass('create-card close-form')
  },

  closeCardForm: function (event) {
    event.preventDefault();
    this.hideCardForm();
  },

  addCardItems: function (cardItem) {
    this.hideCardForm();
    var cardView = new TrelloClone.Views.CardsIndexItem({model: cardItem});
    this.addSubview(".cards", cardView);
  },

  hideCardForm: function () {
    this.$('.card-form').empty();
    this.$('.close-form').html('Add a card');
    this.$('.close-form').toggleClass('create-card close-form');
  },

  removeCardItem: function (cardItem) {
    var view = _(this.subviews('.cards')).findWhere({ model: cardItem });
    this.removeSubview(".cards", view);
    this.render()
  },

  reorderCards: function (event) {
    var cards = $(event.target).find('.card-item')
    cards.each(function (indx, card) {
      var currentId = $(card).find('p').attr('id')
      var currentCard = this.model.cards().get(currentId)
      currentCard.save({ord: indx})
    }.bind(this))
  },
});
