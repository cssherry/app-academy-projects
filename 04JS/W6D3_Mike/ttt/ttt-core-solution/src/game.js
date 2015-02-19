var Board = require("./board");
var MoveError = require("./moveError");

function Game () {
  this.board = new Board();
  this.currentPlayer = Board.marks[0];
}

Game.prototype.isOver = function () {
  return this.board.isOver();
};

Game.prototype.playMove = function (pos) {
  this.board.placeMark(pos, this.currentPlayer);
  this.swapTurn();
};

Game.prototype.promptMove = function (reader, callback) {
  var game = this;

  this.board.print();
  console.log("Current Turn: " + this.currentPlayer)

  reader.question("Enter rowIdx: ", function (rowIdxStr) {
    var rowIdx = parseInt(rowIdxStr);
    reader.question("Enter colIdx: ", function (colIdxStr) {
      var colIdx = parseInt(colIdxStr);
      callback([rowIdx, colIdx]);
    });
  });
};

Game.prototype.run = function (reader, gameCompletionCallback) {
  this.promptMove(reader, (function (move) {
    try {
      this.playMove(move);
    } catch (e) {
      if (e instanceof MoveError) {
        console.log(e.msg);
      } else {
        throw e;
      }
    }

    if (this.isOver()) {
      this.board.print();
      if (this.winner()) {
        console.log(this.winner() + " has won!");
      } else {
        console.log("NO ONE WINS!");
      }
      gameCompletionCallback();
    } else {
      // continue loop
      this.run(reader, gameCompletionCallback);
    }
  }).bind(this));
};

Game.prototype.swapTurn = function () {
  if (this.currentPlayer === Board.marks[0]) {
    this.currentPlayer = Board.marks[1];
  } else {
    this.currentPlayer = Board.marks[0];
  }
};

Game.prototype.winner = function () {
  return this.board.winner();
};

module.exports = Game;
