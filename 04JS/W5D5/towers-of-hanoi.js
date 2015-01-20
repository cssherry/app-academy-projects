var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function HanoiGame(){
  this.stacks = [[1,2,3], [], []];
}

HanoiGame.prototype.isWon = function(){
  if (this.stacks[2].length === 3) { //cannot compare arrays without looping or JSON.stringify(arry)
    return true;
  } else {
    return false;
  }
};

HanoiGame.prototype.isValidMove = function(startTowerIdx, endTowerIdx){
  if (this.stacks[endTowerIdx].length === 0 || this.stacks[startTowerIdx][0] < this.stacks[endTowerIdx][0]) {
    return true;
  }else{
    return false;
  }
};

HanoiGame.prototype.move = function(startTowerIdx, endTowerIdx) {
  if (this.isValidMove(startTowerIdx, endTowerIdx)) {
    var piece = this.stacks[startTowerIdx].splice(0,1);
    this.stacks[endTowerIdx] = piece.concat(this.stacks[endTowerIdx]);
    return true;
  }
  else {
    console.log("Invalid move.  Please try again.");
    return false;
  }
};

HanoiGame.prototype.print = function() {
  console.log(JSON.stringify(this.stacks));
};

HanoiGame.prototype.promptMove = function(callback) {
  this.print();
  var that = this;
  reader.question("Which stack do you want to move from (1,2,3)? ", function(moveFrom){
    reader.question("Which stack do you want to move to (1,2,3)? ", function(moveTo){
      var startTowerIdx = moveFrom - 1;
      var endTowerIdx = moveTo - 1;
      callback(startTowerIdx, endTowerIdx);
        that.run(that.won);
    });
  });
};

HanoiGame.prototype.run = function(completionCallback){
  if (this.isWon()) {
    completionCallback();
  } else {
    this.promptMove(this.move.bind(this));
  }
};

HanoiGame.prototype.won = function(){
  game.print();
  console.log("You won!");
  reader.close();
};

var game = new HanoiGame();

game.run(game.won);
