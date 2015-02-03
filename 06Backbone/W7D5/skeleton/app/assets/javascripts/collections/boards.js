TrelloClone.Collections.Boards = Backbone.Collection.extend({
  model: TrelloClone.Models.Board,

  url: 'api/boards',

  fetchOrGet: function (id, callback) {
    var board = TrelloClone.boards.get(id)

    if (!board) {
      TrelloClone.boards.fetch({
        success: function(){
          board = TrelloClone.boards.get(id);
          success: callback(board)
        }
      })
    } else {
      callback(board);
    }

    return board;
  }
});
