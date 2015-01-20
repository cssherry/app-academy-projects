(function() {
  if (typeof Asteroids === "undefined") {
    window.Asteroids = {} //wrap everything in Astroids object purely so we only send 1 variable to the window
  }

  var MovingObjects = Asteroids.MovingObjects = function (pos, vel, radius, color) {
      this.pos = pos;
      this.vel = vel;
      this.radius = radius;
      if (color) {
        this.color = color;
      }
    }

  MovingObjects.prototype.draw = function(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(
      this.pos[0],
      this.pos[1],
      this.radius,
      0,
      2 * Math.PI,
      false
    );

    ctx.fill();
  };

  MovingObjects.prototype.move = function(){
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
  }

})()
