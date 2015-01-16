var twoTimes = function(value){
  return value * 2;
};

var returnValues = function(el){
    console.log(el);
  }

Array.prototype.myEach = function(specialFunc) {
  for (var i = 0; i < this.length; i++) {
    specialFunc(this[i]);
  };
};

Array.prototype.myMap = function(specialFun){
  var ary = [];
  for (var i = 0; i < this.length; i++) {
    ary.push(specialFun(this[i]));
  };

  return ary;
};

Array.prototype.myInject = function(initialValue, specialFun) {
  var collective = initialValue;
  for (var i = 0; i < this.length; i++) {
    if (typeof(collective) == 'object') {
      collective.push(specialFun(this[i]));
    } else {
      collective += specialFun(this[i]);
    }
  }

  return collective;
};
