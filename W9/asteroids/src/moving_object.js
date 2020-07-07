function MovingObject(options) {
     
    this.pos = options["pos"];
    this.vel = options["vel"];
    this.radius = options["radius"];
    this.color = options["color"];

}

// const mo = new MovingObject({
//     pos: [30, 30],
//     vel: [10, 10],
//     radius: 5,
//     color: "#00FF00"
// });

MovingObject.prototype.draw = function(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();

    ctx.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0,
        2 * Math.PI
        // false
    );

    ctx.stroke();
    ctx.fill();
}

// ctx.beginPath();
// ctx.arc(100, 75, 50, 0, 2 * Math.PI);
// ctx.stroke();

MovingObject.prototype.rectangle = function(ctx) {
    ctx.fillStyle = this.color;
  ctx.beginPath();
ctx.rect(20, 20, 150, 100);
ctx.stroke();

};


module.exports = MovingObject;


