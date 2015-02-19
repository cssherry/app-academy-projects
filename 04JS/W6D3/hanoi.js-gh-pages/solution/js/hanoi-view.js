(function () {
  var Hanoi = window.Hanoi = (window.Hanoi || {});

  var View = Hanoi.View = function View (game, $el) {
    this.game = game
    this.setupTowers($el);
    this.$from = "";
    this.$to = "";
  };

  View.prototype.clickTower = function () {
    var that = this
    $(".hanoi > div").on("click", function(){
      if (that.$from === "") {
        $('.error').remove();
        that.$from = $(event.currentTarget);

        that.$from.children('[disc-size]:first').addClass('fromTower');
      } else {
        that.$to = $(event.currentTarget);
        var from = parseInt(that.$from.attr("tower"));
        var to = parseInt(that.$to.attr("tower"));
        if (that.game.move(from, to)){
          $currentDisc = that.$from.children('[disc-size]:first');
          that.$to
            .children(':not([disc-size]):last')
            .attr('disc-size', $currentDisc.attr('disc-size'));
          $currentDisc.removeAttr('disc-size');
        } else {
          $errorText = $("<p>Invalid move. Try again.</p>");
          $errorText.addClass('error')
          $('body').append($errorText)
        };
        that.$from.children().removeClass('fromTower');
        that.clearSelections();
      }

      if (that.game.isWon()) {
        that.won();
      }
    });
  };


  View.prototype.clearSelections = function(){
    this.$from = "";
    this.$to = "";
  }

  View.prototype.setupTowers = function ($el) {
    for (var i = 0; i < 3; i++){
      var $tower = $("<div></div>");
      $tower.attr("tower", i);
      for (var j = 0; j < 3; j++){
        var $disc = $("<div></div>");
        if (i === 0) {
          $disc.attr("disc-size", j);
        };
        $tower.append($disc)
      };
      $el.append($tower);
    };
  };

  View.prototype.won = function () {
    $winnerText = $("<p>You Win!</p>");
    var $button = $("#play").addClass("display");
    $("body").append($winnerText);

    $(".hanoi > div").off();

    var that = this;
    $button.on("click", function(){
      that.game = new Hanoi.Game();
      that.redraw($button, $winnerText);
      that.clearSelections();
      $button.off();
      //need to always turn off all event listeners
      //so they don't double-trigger
      that.clickTower();
    });
  }

  View.prototype.redraw = function ($button, $winnerText) {
    $("[disc-size]").removeAttr("disc-size")
    $("[tower = 0]").children().each(function(index, $element) {
      $(this).attr("disc-size", index);
    });
    $button.removeClass('display')
    $winnerText.remove();
  };

})();
