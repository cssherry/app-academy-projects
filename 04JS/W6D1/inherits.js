Function.prototype.inherits = function(Object){
  var Surrogate = function(){};
  Surrogate.prototype = Object.prototype;
  this.prototype = new Surrogate();
};

function Animal(name) {
  this.name = name;
}

Animal.prototype.makeSound = function() {
  console.log("sound!");
};

var Cat = function(name) {
  Animal.call(this, name);
};


Cat.inherits(Animal);

Cat.prototype.meow = function() { //needs to be below inherits command
  console.log("meow!");
};

 var whisker = new Cat("whiskers");
 var genericAnimal = new Animal("generic");
 console.log(whisker.name);
 whisker.makeSound();
 whisker.meow();
 // genericAnimal.meow();
