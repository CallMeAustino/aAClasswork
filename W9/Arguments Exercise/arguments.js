function sum() {
    let total = 0;
    for (let i = 0; i < arguments.length; i++) {
        total += arguments[i];
    }
    return total;
};

function sum2(...args) {
    let total = 0;
    for (let i = 0; i < args.length; i++) {
        total += args[i];
    }
    return total;
};


Function.prototype.myBind = function (ctx) {
    const bindArgs = Array.from(arguments).slice(1);
    let that = this;
    return function () {
        return that.apply(ctx, bindArgs.concat(Array.from(arguments)));
    }
};

Function.prototype.myBind2 = function(ctx, ...bindArgs){
    let that = this;
    return function(...callArgs) {
        return that.apply(ctx, bindArgs.concat(callArgs));
    }
};

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true

function curriedSum(num) {
   const numbers = [];
   return function _curriedSum(el) {
        numbers.push(el);
        if (numbers.length === num) {
            console.log(numbers.reduce((a,b) => a + b, 0));
        } else {
            return _curriedSum;
        }
    }
}


Function.prototype.curry = function(ctx, numArgs) {
    let that = this;
    const args = [];
    return function _curry(ele) {
        args.push(ele);
        if (args.length < numArgs){
            return _curry;
        } else {
            return that.apply(ctx, args);
        }
    }
};

Function.prototype.curry2 = function(numArgs) {
    let that = this;
    const args = [];
    return function _curry(ele) {
        args.push(ele);
        if (args.length < numArgs){
            return _curry;
        } else {
            return that(...args);
        }
    }
};
