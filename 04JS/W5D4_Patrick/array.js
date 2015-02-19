Array.prototype.uniq = function() {
  var uniqAry = [];
  for(var i = 0; i < this.length; i++) {
    if (uniqAry.indexOf(this[i]) == -1) {
      uniqAry.push(this[i]); //push = concat!
    }
  }
  return uniqAry;
};

var a = [1,2,4,4,2,3,1];
console.log(a.uniq());

Array.prototype.twoSum = function(){
  var twoSumPairs = [];
  for (var i = 0; i < this.length - 1; i++) {
    for (var j = i+1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        twoSumPairs.push([i, j]);
      }
    }
  }
  return twoSumPairs;
}

var b = [-1, 4, 0, 1, 0];

console.log(b.twoSum());

Array.prototype.transpose = function(){
  var transposedArray = [];
  for (var i = 0; i < this[0].length; i++){
    transposedArray.push([]);
  };
  for (var i = 0; i < this.length; i++){
    for (var j = 0; j < this[i].length; j++) {
      transposedArray[j][i] = this[i][j];
    }
  }
  return transposedArray;
};

var c = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]
  ];

var uneven = [
  [0, 1, 2, 3],
  [4, 5, 6, 7],
  [8, 9, 10, 11]
  ];
