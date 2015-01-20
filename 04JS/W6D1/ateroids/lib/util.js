(function(){
  if (typeof Asteroids === "undefined") {
    window.Asteroids = {}
  }

  window.Asteroids.Util = {}; //need to create blank object/namespace for Util to add util methods to.
  //can define functions/keys using ":" for objects {}, just not funcitons

  var inherits = Asteroids.Util.inherits = function (ChildClass, ParentClass) {
    var Surrogate = function(){};
    Surrogate.prototype = ParentClass.prototype;
    ChildClass.prototype = new Surrogate();
  }

  var randomVel = Asteroids.Util.randomVel = function() {
    var velX = Math.ceil(Math.random() * 50);
    var velY = Math.ceil(Math.random() * 50);
    return [velX, velY];
  }

  var randomVec = Asteroids.Util.randomVec = function(length) {
    velx = Math.round(Math.random() * (length * 2/3));
    vely = Math.round(Math.sqrt( Math.pow(length, 2) - Math.pow(velx, 2)));
    return [velx, vely];
  }

})()
