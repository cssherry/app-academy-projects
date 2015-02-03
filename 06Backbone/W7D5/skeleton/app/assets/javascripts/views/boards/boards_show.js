TrelloClone.Views.BoardsShow = Backbone.CompositeView.extend({
  template: JST['boards/show'],

  initialize: function () {
    this.model.fetch({
      success: function () {
        this.model.lists().each(this.addListItems.bind(this))
        this.render()
      }.bind(this)
    });

    this.listenTo(this.model.lists(), 'add', this.render);
    this.listenTo(this.model.lists(), 'remove', this.removeListItem);
  },

  events: {
    'submit .list-create': 'createList',
    'sortstop .lists': 'reorderLists',
    'sortstart .cards': 'retrieveOriginalList',
    // 'sortreceive .cards': 'reassignCard',
  },

  render: function(){
    var content = this.template({board: this.model});
    this.$el.html(content);
    this.attachSubviews();
    this.$('.lists').sortable();
    this.onRender();
    return this;
  },

  addListItems: function (listItem) {
    var listView = new TrelloClone.Views.ListsIndexItem({model: listItem, origin: this});
    this.addSubview(".lists", listView);
  },

  createList: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON().list;
    var list = new TrelloClone.Models.List(params)
    list.save({},{
      success: function(){
        this.model.lists().add(list);
        // need to add list item here rather than as a listenTo item
        this.addListItems(list);
        $('input[type|="text"]').val("");
      }.bind(this)
    });
  },

  reorderLists: function (event) {
    // event.preventDefault();
    // DON'T PREVENT DEFAULT HERE!!!!!!!!! It will prevent hte sort
    var lists = $(event.target).find('.list-item')
    lists.each(function (indx, list) {
      var currentId = $(list).find('h4').attr('id')
      var currentList = this.model.lists().get(currentId)
      currentList.save({ord: indx})
    }.bind(this))
  },

  retrieveOriginalList: function (event) {
    var ListId = $(event.target).data('list-id')
    this._oldList = this.model.lists().get(ListId)
  },

  // not working across views
  // reassignCard: function (event) {
  //   var newListId = $(event.target).data('list-id')
  //   var cards = $(event.target).find('.card-item')
  //   var currentList = this.model.lists().get(newListId)
  //   cards.each(function (_indx, card) {
  //     var currentId = $(card).find('p').attr('id')
  //     var currentCard = this._oldList.cards().get(currentId)
  //     if (currentCard) {
  //       // need to remove first
  //       var newView = _(this.subviews('.lists')).findWhere({ model: currentList });
  //       newView.addCardItems(currentCard)
  //       var oldView = _(this.subviews('.lists')).findWhere({ model: this._oldList });
  //       oldView.removeCardItem(currentCard)
  //       // this._oldList.cards().remove(currentCard)
  //       currentCard.save({list_id: newListId})
  //     }
  //   }.bind(this))
  // },

  removeListItem: function (list) {
    var view = _(this.subviews('.lists')).findWhere({ model: list });
    this.removeSubview(".lists", view);
    this.render()
  },
});
