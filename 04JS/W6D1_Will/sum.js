function sum() {
  var totalSum = 0;
  for (i = 0; i < arguments.length; i++) {
    totalSum += arguments[i];
  }
  return totalSum;
}

console.log(sum(1, 2, 3, 4));
