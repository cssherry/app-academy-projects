function sum() {
  var sum = 0
  for (i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
}

console.log(sum(1, 2, 3, 4))
