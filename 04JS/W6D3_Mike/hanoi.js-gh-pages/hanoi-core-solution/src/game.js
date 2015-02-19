function Game () {
  this.towers = [[3, 2, 1], [], []];
};

Game.prototype.isValidMove = function (startTowerIdx, endTowerIdx) {
  var startTower = this.towers[startTowerIdx];
  var endTower = this.towers[endTowerIdx];

  if (startTower.length === 0) {
    return false;
  } else if (endTower.length == 0) {
    return true;
  } else {
    var topStartDisc = startTower[startTower.length - 1];
    var topEndDisc = endTower[endTower.length - 1];
    return topStartDisc < topEndDisc;
  }
};

Game.prototype.isWon = function () {
  // move all the discs to the last or second tower
  return (this.towers[2].length == 3) || (this.towers[1].length == 3);
};

Game.prototype.move = function (startTowerIdx, endTowerIdx) {
  if (this.isValidMove(startTowerIdx, endTowerIdx)) {
    this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
    return true;
  } else {
    return false;
  }
};

Game.prototype.print = function () {
  console.log(JSON.stringify(this.towers));
};

Game.prototype.promptMove = function (reader, callback) {
  this.print();
  reader.question("Enter a starting tower: ", function (start) {
    var startTowerIdx = parseInt(start);
    reader.question("Enter an ending tower: ", function (end) {
      var endTowerIdx = parseInt(end);
      callback(startTowerIdx, endTowerIdx)
    });
  });
};

Game.prototype.run = function (reader, gameCompletionCallback) {
  this.promptMove(reader, (function (startTowerIdx, endTowerIdx) {
    if (!this.move(startTowerIdx, endTowerIdx)) {
      console.log("Invalid move!");
    }

    if (!this.isWon()) {
      // Continue to play!
      this.run(reader, gameCompletionCallback);
    } else {
      this.print();
      console.log("You win!");
      gameCompletionCallback();
    }
  }).bind(this));
};

module.exports = Game;
