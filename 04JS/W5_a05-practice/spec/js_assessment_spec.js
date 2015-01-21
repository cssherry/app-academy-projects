describe("recursiveExponent", function() {
  it("should recursively calculate 2^3==8", function() {
    expect(Assessment.recursiveExponent(2, 3)).toBe(8);
  });

  it("should recursively calculate 3^3==27", function() {
    expect(Assessment.recursiveExponent(3, 3)).toBe(27);
  });
});

describe("transpose", function() {
  it("should return a transposed array", function() {
    var startArr = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    var endArr =   [[0, 3, 6], [1, 4, 7], [2, 5, 8]];
    expect(Assessment.transpose(startArr)).toEqual(endArr);
  });

  it("should return not modify the original array", function() {
    var startArr = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    var startArr2 = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    expect(startArr).toEqual(startArr2);
  });
});

describe("primes", function() {
  it("should return the first 5 primes in order", function() {
    expect(Assessment.primes(5)).toEqual([2, 3, 5, 7, 11]);
  });

  it("should handle 0 correctly", function() {
    expect(Assessment.primes(0)).toEqual([]);
  });

  it("should handle 1 correctly", function() {
    expect(Assessment.primes(1)).toEqual([2]);
  });
});

describe("mergeSort", function() {
  it("should sort the array", function() {
    var startArr = [3, 2, 1, 5, 6, 4];
    expect(Assessment.mergeSort(startArr)).toEqual([1, 2, 3, 4, 5, 6]);
  });

  it("should return [] when sorting array with 0 elements", function () {
    expect(Assessment.mergeSort([])).toEqual([]);
  });

  it("should sort an array with 1 element", function () {
    expect(Assessment.mergeSort([2])).toEqual([2]);
  });
});

describe("Function.prototype.myBind", function () {
  var Cat;
  var sally, markov, curie;

  beforeEach(function () {
    Cat = function Cat (name) {
      this.name = name;
    };

    Cat.prototype.sayHello = function () {
      return this.name + " says hello!";
    };

    Cat.prototype.greetOne = function (otherCat) {
      return this.name + " says hello to " + otherCat.name;
    };

    Cat.prototype.greetTwo = function (otherCat1, otherCat2) {
      return this.name + " says hello to " + otherCat1.name + " and " +
        otherCat2.name;
    };

    sally = new Cat("Sally");
    markov = new Cat("Markov");
    curie = new Cat("Curie");
  });

  it("should call the function method style on the context", function () {
    expect(sally.sayHello.myBind(sally)()).toEqual("Sally says hello!");
  });

  it("should pass in bind-time argument to the method", function () {
    expect(sally.greetOne.myBind(sally, markov)())
      .toEqual("Sally says hello to Markov");
  });

  it("should pass in two bind-time arguments to the method", function () {
    expect(sally.greetTwo.myBind(sally, markov, curie)())
      .toEqual("Sally says hello to Markov and Curie");
  });

  it("should combine bind-time and call-time arguments", function () {
    expect(sally.greetTwo.myBind(sally, markov)(curie))
      .toEqual("Sally says hello to Markov and Curie");
  })
});

describe("inherits", function() {
  var Animal, Dog, dog;

  beforeEach(function() {
    Animal = function() {
      this.name = "Yogi";
    };

    Animal.prototype.makeNoise = function() { return "Hi!"; };

    Dog = function() {
      this.age = 7;
    };

    Dog.inherits(Animal);

    Dog.prototype.bark = function() { return "Woof!"; };

    dog = new Dog();
  });

  it("should properly set up the prototype chain between a child and parent", function() {
    expect(dog.bark()).toBe("Woof!");
    expect(dog.makeNoise()).toBe("Hi!");
  });

  it("should not call the parent's constructor function", function() {
    expect(dog.name).toBeUndefined();
  });

  it("should maintain separation of parent and child prototypes", function() {
    Dog.prototype.someProperty = 42;
    var animal = new Animal();
    expect(animal.someProperty).toBeUndefined();
    expect(animal.makeNoise()).toBe("Hi!");
  });

  it("should properly work for longer inheritance chains", function() {
    var Poodle = function() { this.name = "Bill"; };

    Poodle.inherits(Dog);

    Poodle.prototype.shave = function() { return "Brrr."; };

    var poodle = new Poodle();
    expect(poodle.name).toBe("Bill");
    expect(poodle.shave()).toBe("Brrr.");
    expect(poodle.makeNoise()).toBe("Hi!");
    expect(poodle.bark()).toBe("Woof!");
  });
});
