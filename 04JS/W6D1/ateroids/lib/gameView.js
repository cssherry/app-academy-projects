(function(){
  if (typeof Asteroids === "undefined") {
    window.Asteroids = {};
  }

  var GameView = Asteroids.GameView = function(game, canvasElement){
    this.game = game;
    this.ctx = canvasElement.getContext("2d");
  }

  GameView.prototype.start = function(){
    var that = this
    this.game.addAsteroids()
    setInterval(function(){
      that.game.moveObjects();
      that.game.draw(that.ctx);
    }, 20)
  }
})()
