var factors = function(num) {
  var factorsArray = [];
  for (var i = 0; i < (num / 2); i++) {
    if (num % i === 0) {
      factorsArray.push(i, num/i);
    }
  }
  return factorsArray.uniq();
};

Array.prototype.bubbleSort = function() {
  var notSorted = true;
  do {
    notSorted = false;
    for (var i = 0; i < (this.length - 1); i++) {
      if (this[i] > this[i+1]) {
        var el = this[i];
        this[i] = this[i+1];
        this[i+1] = el;
        notSorted = true;
        console.log(this);
      }
    }
  } while (notSorted);

  return this;
};

String.prototype.substrings = function(){
  var subStringArray = [];
  for (var i = 0; i < this.length; i++) {
    for (var j = i+1; j <= this.length; j++) {
      subStringArray.push(this.substring(i,j));
    }
  }

  return subStringArray;
}
