const Game = require("./game.js");


function gameView(ctx) {
    this.game = new Game();
    this.ctx = ctx;
}

gameView.prototype.start = function() {
    let self = this;
    setInterval(function() {
    
    }, 20)
}


module.exports = GameView;