TrelloClone.Routers.Boards = Backbone.Router.extend({
  initialize: function (options) {
    this.$el = options.$el
  },

  routes: {
    '': 'boardsIndex',
    'boards/:id': 'boardsShow'
  },

  boardsIndex: function () {
    var indexView = new TrelloClone.Views.BoardsIndex({collection: TrelloClone.boards})
    this._swapview(indexView)
  },

  boardsShow: function (id) {
    TrelloClone.boards.fetchOrGet(id, function(board){
      var showView = new TrelloClone.Views.BoardsShow({model: board});
      this._swapview(showView)
    }.bind(this))
  },

  _swapview: function (newView) {
    this._oldview && this._oldview.remove();
    this._oldview = newView
    this.$el.html(newView.render().$el)
  }
});
