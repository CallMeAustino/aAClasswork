const Util = {
        inherits: function(childClass, parentClass) {
            function surrogate() {};
            surrogate.prototype = parentClass.prototype;
            childClass.prototype = new surrogate();
            childClass.prototype.constructor = childClass;
    }, 
    randomVec: function (length) {
        const deg = 2 * Math.PI * Math.random();
        return this.scale([Math.sin(deg), Math.cos(deg)], length);
    },
    scale: function (vec, m) {
        return [vec[0] * m, vec[1] * m];
    }
};
// inherits: function inherits(childClass, parentClass
module.exports = Util;

// Function.prototype.inherits = function (parent) {
//     childClass.prototype = Object.create(parent.prototype);
//     childClass.prototype.constructor = childClass;
// };
