var range = function(startNum, endNum) {
  if (endNum < startNum) {
    return [];
  } else if (startNum === endNum) {
    return [startNum];
  } else {
    return [startNum].concat(range(startNum + 1, endNum - 1)).concat([endNum]);
  }
};

Array.prototype.sum = function() {
  var totalSum = 0;
  this.forEach (function(el) {
    totalSum += el;
  });

  return totalSum;
};

Array.prototype.recSum = function() {
  if (this.length === 0) {
    return 0;
  } else if (this.length === 1 ) {
    return this[0];
  } else {
    return this[0] + this.slice(1, this.length -1).recSum() + this[this.length - 1];
  }
};

var mathExp = function(number, exponent) {
  if (exponent === 0) {
      return 1;
  } else {
    return number * mathExp(number, exponent - 1);
  }
};

var square = function(num) {
  return num * num;
};

var exp = function(number, exponent) {
  if (exponent === 0) {
    return 1;
  } else if (exponent === 1) {
    return number;
  } else if (exponent % 2 === 0) {
    return square(exp(number, exponent/2));
  } else {
    return number * square(exp(number, (exponent - 1) / 2));
  }
};

var fibonacci = function(number){
  if (number <= 2 ) {
      return [0,1].slice(0, number + 1);
  } else {
    var previousLength = fibonacci(number - 1).length
    return fibonacci(number - 1).concat([fibonacci(number - 1)[previousLength - 1]+fibonacci(number - 1)[previousLength - 2]]);
  }
}

var binarySearch = function(array, target, offset){
  offset = typeof(offset) !== 'undefined' ? offset : 0;
  var pivotIndex = Math.floor(array.length/2);
  var pivot = array[pivotIndex];
  var leftArray = array.slice(0, pivotIndex);
  var rightArray = array.slice(pivotIndex + 1, array.length)
  if (pivot === undefined){
    return null;
  } else if (target < pivot) {
    return binarySearch(leftArray, target, offset);
  } else if (target === pivot) {
    return pivotIndex + offset;
  } else if (target > pivot) {
    return binarySearch(rightArray, target, pivotIndex + offset + 1);
  }
};

var makeChange = function(amount, coins) {
  if (coins.length !== 0) {
    var change = [];
    while (amount >= coins[0]) {
      amount -= coins[0];
      change.push(coins[0]);
    }

    return change.concat(makeChange(amount, coins.slice(1, coins.length)));
  } else {
    return [];
  }
};

var makeChangeSmart = function(amount, coins) {
  var bestResult = makeChange(amount, coins);
  for (var i = 0; i < coins.length - 1; i++) {
    var test = makeChange(amount, coins.slice(i + 1, coins.length));
    if (bestResult.length > test.length) {
      bestResult = test;
    }
  }
  return bestResult;
};

Array.prototype.mergeSort = function() {
  if (this.length > 1) {
    var mid = this.length/2;
    var left = this.slice(0, mid);
    var right = this.slice(mid, this.length);

    return sort(left.mergeSort(), right.mergeSort());
  } else {
    return this;
  }
};

var sort = function(array1, array2) {
  var sortedArray = [];

  while (array1.length > 0 && array2.length > 0) {
    if (array1[0] < array2[0]) {
      sortedArray.push(array1.splice(0,1)[0]);
    } else if (array1[0] === array2[0]) {
      sortedArray.push(array1.splice(0,1)[0], array2.splice(0,1)[0]);
    } else if (array1[0] > array2[0]) {
      sortedArray.push(array2.splice(0,1)[0]);
    }
  }

  return sortedArray.concat(array1).concat(array2);
};

Array.prototype.collect = function(addedEl) {
  var results = [];
  this.forEach(function(el){
    el.push(addedEl);
    results.push(el);
  });
  return results;
};

Array.prototype.subsets = function(){
  if (this.length <=1) {
    return [[], this];
  } else {
    return this.slice(1).subsets().concat(this.slice(1).subsets().collect(this[0]));
  }
};
