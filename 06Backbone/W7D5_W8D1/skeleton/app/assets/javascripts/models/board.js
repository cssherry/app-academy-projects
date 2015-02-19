TrelloClone.Models.Board = Backbone.Model.extend({
  urlRoot: 'api/boards',

  parse: function (jsonObject) {
    if (jsonObject.lists) {
      this.lists().set(jsonObject.lists);
      delete(jsonObject.lists);
    }
    return jsonObject
  },

  lists: function () {
    if (!this._list) {
      this._list = new TrelloClone.Collections.Lists
    }
    return this._list.sort()
    // need to force sort here if you want to see persis across backbone views
  },
});
