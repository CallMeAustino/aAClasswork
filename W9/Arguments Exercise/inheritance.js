Function.prototype.inherits = function(parent) {
    function Surrogate() {}
    Surrogate.prototype = parent.prototype; 
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
};



// Function.prototype.inherits = function (Parent) {
//     function Surrogate() { }
//     Surrogate.prototype = Parent.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// };
// Define a Surrogate class
//     Set the prototype of the Surrogate(Surrogate.prototype = SuperClass.prototype)
// Set Subclass.prototype = new Surrogate()
// Set Subclass.prototype.constructor = Subclass
// Write a Function.prototype.inherits

function MovingObject(name) { 
    this.name = name;
}
MovingObject.prototype.heavy = function() {
    console.log(`${this.name} looks heavy!`);
};

function Ship(name, color) {
    MovingObject.call(this, name);
    this.color = color;
 }
 
 Ship.prototype = Object.create(MovingObject.prototype);
 Ship.prototype.constructor = Ship;
// function Ship(name, color) {
//     this.name = name;
//     this.color = color;
//  }

// Ship.inherits(MovingObject);

Ship.prototype.test = function () {
    console.log(`${this.name} is so ${this.color}!`);
};

function Asteroid(size) {
    this.size = size;
 }

 Asteroid.prototype = Object.create(MovingObject.prototype);
 Asteroid.prototype.constructor = Asteroid;

Asteroid.inherits(MovingObject);

Asteroid.prototype.admire = function () {
    console.log(`${this.size} thing!`)
};


