#!/usr/bin/env node

var readline = require('readline');
var Hanoi = require("../src");

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var game = new Hanoi.Game(reader);
game.run(reader, function () {
  reader.close();
});
