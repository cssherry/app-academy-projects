var readline = require("readline");

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var printValue = function(sum) {
  console.log("Total Sum: " + sum);
};

var addNumbers = function(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("Input a number to add: ", function (numString) {
      sum += parseInt(numString);
      addNumbers(sum, numsLeft - 1, printValue);
    });
  }
  else {
    completionCallback(sum);
    reader.close();
  }
};


addNumbers(0, 3, printValue);
