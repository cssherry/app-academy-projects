(function () {
  if (typeof TTT === "undefined") {
    window.TTT = {};
  }

  var View = TTT.View = function (game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  };

  View.prototype.bindEvents = function () {
    // install a handler on the `li` elements inside the board.
    this.$el.on("click", "li", (function (event) {
      var $square = $(event.currentTarget);
      this.makeMove($square);
    }).bind(this));
  };

  View.prototype.makeMove = function ($square) {
    var pos = $square.data("pos");
    var currentPlayer = this.game.currentPlayer;

    try {
      this.game.playMove(pos);
    } catch (e) {
      alert("Invalid move! Try again.");
      return;
    }

    $square.addClass(currentPlayer);

    if (this.game.isOver()) {
      // cleanup click handlers.
      this.$el.off("click");
      this.$el.addClass("game-over");

      var winner = this.game.winner();
      var $figcaption = $("<figcaption>");

      if (winner) {
        this.$el.addClass("winner-" + winner);
        $figcaption.html("You win, " + winner + "!");
      } else {
        $figcaption.html("It's a draw!");
      }

      this.$el.append($figcaption);
    }
  };

  View.prototype.setupBoard = function () {
    var $ul = $("<ul>");
    $ul.addClass("group");

    for (var rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (var colIdx = 0; colIdx < 3; colIdx++) {
        var $li = $("<li>");
        $li.data("pos", [rowIdx, colIdx]);

        $ul.append($li);
      }
    }

    this.$el.append($ul);
  };
})();
