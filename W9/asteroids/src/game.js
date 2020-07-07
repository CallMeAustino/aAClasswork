const Asteroid = require("./asteroid.js");
const DIM_X = 1000;
const DIM_Y = 1000;
const NUM_ASTEROIDS = 20;


function Game() {
    this.dim_x = DIM_X;
    this.dim_y = DIM_Y;
    this.num_asteroids = NUM_ASTEROIDS;
    this.asteroids = [];
    this.addAsteroids();
}

// function MovingObject(options) {

//     this.pos = options["pos"];
//     this.vel = options["vel"];
//     this.radius = options["radius"];
//     this.color = options["color"];

// }


Game.prototype.addAsteroids = function () {
    for (let i = 0; i < NUM_ASTEROIDS; i++) {
        this.asteroids.push(new Asteroid(this.randomPosition()));
    };
}

Game.prototype.randomPosition = function () {
    let coordinates = [];
    coordinates.push(Math.floor(Math.random() * DIM_X));
    coordinates.push(Math.floor(Math.random() * DIM_Y));
    return coordinates;
}

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, DIM_X, DIM_Y);
    this.asteroids.forEach(el => el.draw(ctx));
}


Game.prototype.moveObjects = function() {
    
}
module.exports = Game;

// const canvas = document.getElementById('canvas');
// const ctx = canvas.getContext('2d');
// ctx.clearRect(0, 0, canvas.width, canvas.height);