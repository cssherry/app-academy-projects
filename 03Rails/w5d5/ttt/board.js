function Board(){
  this.board = [[0,0,0],[0,0,0],[0,0,0]];
}

Board.prototype.winningPositions = function(){
  results = []
  for (var i = 0; i < 3; i++) {
    results = results.concat([[[0,i], [1,i], [2,i]]])
    results = results.concat([[[i,0], [i,1], [i,2]]])
  }
  return results.concat([
                        [[0,0],[1,1],[2,2]],
                        [[0,2],[1,1],[2,0]]
                        ])
}

Board.prototype.won = function(){
  var winningPositions = this.winningPositions()
  var winner = []
  var that = this;
  winningPositions.forEach(function(el){
  console.log("el:  " + JSON.stringify(el))
  console.log("");
    winner.push(that.winningPosition(el))
  })
  return winner.indexOf(true) !== -1
}

Board.prototype.winningPosition = function(singleWinningPositionArray) {
  var prevOccupant = null;
  var that = this;
  singleWinningPositionArray.forEach( function(location) {
    var value = that.board[location[0]][location[1]]
    console.log("prevOccupant:  " + JSON.stringify(prevOccupant))
    console.log("value:  " + JSON.stringify(value))
    if (value !== 0) {
      if (prevOccupant === null) {
        prevOccupant = value;
      } else if (prevOccupant !== value) {
        return false;
      }
    }
  })
  return true;
}


//
// Board.prototype.winner = function(){
//
// }
//
// Board.prototype.empty? = function(pos){
//
// }
//
// Board.prototype.place_mark? = function(pos, mark){
//
// }


var myBoard = new Board;
myBoard.board = [["x",0,0],["x",0,0],[0,0,0]]
console.log(myBoard.won());
