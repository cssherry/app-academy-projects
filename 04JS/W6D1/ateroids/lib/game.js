(function(){
  if (typeof Asteroids === "undefined") {
    window.Asteroids = {};
  }

  var Game = Asteroids.Game = function(dimX, dimY, numAsteroid){
    this.DIM_X = dimX;
    this.DIM_Y = dimY;
    this.NUM_Asteroids = numAsteroid;
    this.asteroids = [];
  };

  var random = function(boundry) {
    return Math.ceil((Math.random() * boundry));
  };
  var wrap = Game.prototype.wrap = function(pos, asteroid){
    var posX = asteroid.pos[0];
    var posY = asteroid.pos[1];
    if (posX <= 0) {
      asteroid.pos = [random(this.DIM_X), 0];
    }

    else if(posX > this.DIM_Y) {
      asteroid.pos = [0, random(this.DIM_Y)];
    }

    else if (posY <= 0) {
      asteroid.pos = [0, random(this.DIM_Y)];
    }

    else if (posY > this.DIM_Y) {
      asteroid.pos = [DIM_X, ];
    }


    // if (posX <= 0) {
    //   var xInt = (posY/asteroid.vel[1]) * asteroid.vel[0];
    //   asteroid.pos = [xInt, 0];
    // }
    // else if (posY <= 0) {
    //   var yInt = (posX/asteroid.vel[0]) * asteroid.vel[1];
    //   asteroid.pos = [0, yInt];
    // else if (posX > DIM_X) {
    //
    // }
    // }
    // }

  };

  var randomPosition = Game.prototype.randomPosition = function(){
    var posX = Math.ceil(Math.random() * this.DIM_X);
    var posY = Math.ceil(Math.random() * this.DIM_Y);
    return [posX, posY];
  };


  var addAsteroids = Game.prototype.addAsteroids = function(){
    for (var i = 0; i < this.NUM_Asteroids; i++) {
      this.asteroids.push(new Asteroids.Asteroid(this.randomPosition()));
    }
  };

  var draw = Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
    this.asteroids.forEach(function(el) {
      el.draw(ctx);
    });
  };

  Game.prototype.moveObjects = function() {
    this.asteroids.forEach(function(el) {
      el.move();
    });
  };

})();
