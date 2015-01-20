Function.prototype.myBind = function(context) {
  var fn = this;
  var oldArgs = Array.prototype.slice.call(arguments, 1);
  return function() {
    var currentArgs = Array.protype.slice.call(arguments, 0)
    return fn.apply(context, oldArgs.concat(currentArgs));
  }
}

function sayHi() {
  console.log("hi" + this.name)
  console.log(arguments)
}


var obj = function(name){name: name}

sayHi.bind(obj("puppy"), 1, 2, 3)(1, 2, 3)
// obj, for some reason, returns hash of arguments rather than array
