TrelloClone.Collections.Cards = Backbone.Collection.extend({

  model: TrelloClone.Models.Card,

  url: 'api/cards',

  comparator: function (list) {
    return list.get('ord')
  },
  //optional, just use 'ord'

});
