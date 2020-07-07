const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");

document.addEventListener("DOMContentLoaded", function() {
    const canvas = document.getElementById('game-canvas');
    canvas.width = 1000;
    canvas.height = 1000;
    const context = canvas.getContext('2d');
    new gameView(context);
})

//TESTING PURPOSES
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;

