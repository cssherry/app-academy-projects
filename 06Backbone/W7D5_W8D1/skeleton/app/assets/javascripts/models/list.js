TrelloClone.Models.List = Backbone.Model.extend({
  urlRoot: 'api/lists',

  parse: function (jsonObject) {
    if (jsonObject.cards) {
      this.cards().set(jsonObject.cards);
      delete(jsonObject.cards);
    }
    return jsonObject
  },

  initialize: function (object) {
    if (object.cards) {
      this.cards().set(object.cards);
      delete(object.cards);
    }
  },

  cards: function () {
    if (!this._cards) {
      this._cards = new TrelloClone.Collections.Cards
    }
    return this._cards.sort()
  },
});
