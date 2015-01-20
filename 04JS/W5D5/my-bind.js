Function.prototype.myBind = function(object) {
  fn = this;
  return function(){
    return fn.apply(object);
  };
};

function times(num, fun) {
  for (var i = 0; i < num; i++) {
    fun(); // call is made "function-style"
  }
}

var cat = {
  age: 5,

  ageOneYear: function () {
    console.log(this.age += 1);
  }
};

times(10, cat.ageOneYear.myBind(cat));
