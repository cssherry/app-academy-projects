(function(){
  if (typeof Asteroids === "undefined") {
    window.Asteroids = {};
  }

  var Asteroid = Asteroids.Asteroid = function(pos){
    Asteroids.MovingObjects.call(this, pos);
    // this.color = 'red';
    this.radius = 10;
    this.vel = Asteroids.Util.randomVec(10);
  };

  Asteroids.Util.inherits(Asteroid, Asteroids.MovingObjects);

  Asteroid.prototype.color = 'red';
  // Asteroid.prototype.radius = 50;
  // Asteroid.prototype.vel = Asteroids.Util.randomVec(10)




})();
