function Cat(name, owner) {
    this.name = name;
    this.owner = owner;
    this.color = 'calico';
    this.skill = "sleeping";
    //Not declaring new variable, so don't need to set var cuteStatement =
}

//don't need semicolon after function Name(). Need it after var Name = function(). Need for equal sign
Cat.prototype.cuteStatement = function(){
  return this.owner + " loves " + this.name;
};

var cat1 = new Cat(1, "owner1");
var cat2 = new Cat(2, "owner2");

console.log(cat1.cuteStatement());

var cat3 = new Cat(3, "owner3");
var cat4 = new Cat(4, "owner4");

Cat.prototype.cuteStatement = function(){
  return "Everyone loves " + this.name + "!";
};

console.log(cat1.cuteStatement());

Cat.prototype.meow = function(){
  return "meowwwwwwwwwww";
};

cat1.meow = function (){
  return "meo";
};
