function Clock () {
}

Clock.TICK = 5000;

var convertToTwoDigits = function (seconds) {
  if (seconds < 10) {
    return "0" + seconds;
  }
  else {
    return seconds;
  }
};

Clock.prototype.printTime = function (time) {
  var seconds = convertToTwoDigits(time.getSeconds());
  var minutes = convertToTwoDigits(time.getMinutes());
  var hours = convertToTwoDigits(time.getHours());

  console.log(hours + ":" + minutes + ":" + seconds);
};

Clock.prototype._tick = function (currentTime) {
  // 1. Increment the currentTime.
  // 2. Call printTime.
  currentTime.setSeconds(currentTime.getSeconds() + Clock.TICK/1000);
  this.printTime(currentTime);
};

Clock.prototype.run = function () {
  // 1. Set the currentTime.
  // 2. Call printTime.
  // 3. Schedule the tick interval.
  var currentTime = new Date();
  this.printTime(currentTime);
  // this._tick(currentTime);

  this.myTimer = function(currentTime) {
    var that = this;
    setTimeout(function(){
      Clock.prototype._tick(currentTime);
      that.myTimer(currentTime);
    }, Clock.TICK);
  };

  this.myTimer(currentTime);

};




var clock = new Clock();
clock.run();
