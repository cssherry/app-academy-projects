TrelloClone.Views.BoardsIndexItem = Backbone.CompositeView.extend({

  template: JST['boards/index_item'],

  tagName: 'li class=board-item',

  events: {
    'click button':'destroy'
  },

  render: function(){
    var content = this.template({board: this.model});
    this.$el.html(content);
    return this;
  },

  destroy: function (event) {
    this.model.destroy();
  }
});

TrelloClone.Views.BoardsIndex = Backbone.CompositeView.extend({

  initialize: function () {
    this.collection.fetch({
      //need to pass in function into success, not call a function
      success: function () {
        this.collection.each(this.addBoardItems.bind(this))
      }.bind(this)
    });

    this.listenTo(this.collection, 'change', this.addBoardItems);
    this.listenTo(this.collection, 'remove', this.removeBoardItem);
  },

  events: {
    'submit .board-create': 'createBoard',
  },

  template: JST['boards/index'],

  render: function(){
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addBoardItems: function (boardItem) {
    // either need to use comparator to sort backbone collection or
    // add sort to the activerecord array returned from the server
    // I've sorted the activerecord array using @boards = current_user.boards.order("created_at")
    var boardView = new TrelloClone.Views.BoardsIndexItem({model: boardItem});
    this.addSubview(".board-lists", boardView)
  },

  removeBoardItem: function (board) {
    // a board model object is returned from the listenTo event, this needs to
    // be found in the subviews memory and then passed into the removeSubview method

    // You can either iterate through using forEach or use collection underscore method
    var view = _(this.subviews('.board-lists')).findWhere({ model: board });
    this.removeSubview(".board-lists", view);
    this.render()
  },

  createBoard: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON().board;
    this.collection.create(params, {
      success: function(board){
        Backbone.history.navigate('boards/' + board.id, {trigger: true})
      }
    });
  }
});
