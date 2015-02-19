(function () {
  if (typeof TTT === "undefined") {
    window.TTT = {};
  }

  var View = TTT.View = function (game, $el) {
    this.setupBoard($el);
    this.game = game
  };

  View.prototype.bindEvents = function () {
    that = this;
    $('.board .unclicked').on('click', function(){
      that.makeMove($(event.currentTarget))
      if (that.game.isOver()) {
        if (that.game.winner()) {
          alert(that.game.winner() + " has won!");
        } else {
          alert("NO ONE WINS!");
        }
        var $board = $('.board')
        $board.children().off();
        $board.addClass('game-over')
      }
    });

  };

  View.prototype.makeMove = function ($square) {
    var mark = game.currentPlayer;
    $square.removeClass("unclicked");
    $square.addClass(mark);
    var x = parseInt($square.data("x"));
    var y = parseInt($square.data("y"));
    this.game.playMove([x,y]);
    $square.text(mark);
  };

  View.prototype.setupBoard = function ($el) {
    var $board = $("<div></div>").addClass("board")
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        var $cell = $("<div></div>");
        var className = "unclicked";
        $cell.data("x", i).data("y", j)
        $cell.addClass(className)
        $board.append($cell);
      };
    };
    $el.append($board)
  };
})();
