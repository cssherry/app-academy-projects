Function.prototype.curried = function(numArg) {
  var numbers = [];
  var fn = this;
  var _curriedSum = function(num) {
    numbers.push(num);
    if (numbers.length === numArg) {
      return fn.apply(0, numbers);
    }
    else {
      console.log(numbers);
      return _curriedSum;
    }
  };
  return _curriedSum;
};

function sum() {
  var totalSum = 0;
  for (i = 0; i < arguments.length; i++) {
    totalSum += arguments[i];
  }
  return totalSum;
}
// console.log(sum.curried(3))
console.log(sum.curried(4)(4));
console.log(sum.curried(4)(4)(16));
console.log(sum.curried(4)(4)(16)(5));



// var curriedSum = function(numArg){
//   var numbers = [];
//   var _curriedSum = function(num) {
//     numbers.push(num);
//     if (numbers.length === numArg) {
//       return sum.apply(0,numbers); //need to pass an object, even if wrong number
//       // var total = 0
//       // for (var i = 0; i < numbers.length; i++) {
//       //   sum += numbers[i]
//       // }
//       // return sum
//     }
//     else {
//       return _curriedSum;
//     }
//   }
//   return _curriedSum; //need to parse function, not call it
// };

// var f1 = curriedSum(1);
// var f2 = f1(4);
// var f3 = f2(20);
// var result = f3(6);
// console.log(result)
