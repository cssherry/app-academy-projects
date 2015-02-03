window.TrelloClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new TrelloClone.Routers.Boards({'$el': $('#main')});
    this.boards = new TrelloClone.Collections.Boards;
    Backbone.history.start();
  },
};

$(document).ready(function(){
  TrelloClone.initialize();
});

// if get error " Uncaught Error: Backbone.history has already been started",
// look into application
// .js file and see if there are multiple 'requires' for this file
// if that doesn't work, prevent by saying "unless"
// also make sure that views > static_pages > root doesn't have a script that initializes
// the TrelloClone
