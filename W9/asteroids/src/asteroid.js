const MovingObject = require('./moving_object.js');
const Util = require('./utils.js')

const COLOR = 'blue';
const RADIUS = 7;
const SPEED = 5

function Asteroid(pos) {
    // debugger
    options = {
        pos: [pos[0], pos[1]],
        vel: Util.randomVec(5),
        radius: RADIUS,
        color: COLOR
    }
    
    MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;