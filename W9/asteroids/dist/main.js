/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\n\nconst COLOR = 'blue';\nconst RADIUS = 7;\nconst SPEED = 5\n\nfunction Asteroid(pos) {\n    // debugger\n    options = {\n        pos: [pos[0], pos[1]],\n        vel: Util.randomVec(5),\n        radius: RADIUS,\n        color: COLOR\n    }\n    \n    MovingObject.call(this, options);\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst DIM_X = 1000;\nconst DIM_Y = 1000;\nconst NUM_ASTEROIDS = 20;\n\n\nfunction Game() {\n    this.dim_x = DIM_X;\n    this.dim_y = DIM_Y;\n    this.num_asteroids = NUM_ASTEROIDS;\n    this.asteroids = [];\n    this.addAsteroids();\n}\n\n// function MovingObject(options) {\n\n//     this.pos = options[\"pos\"];\n//     this.vel = options[\"vel\"];\n//     this.radius = options[\"radius\"];\n//     this.color = options[\"color\"];\n\n// }\n\n\nGame.prototype.addAsteroids = function () {\n    for (let i = 0; i < NUM_ASTEROIDS; i++) {\n        this.asteroids.push(new Asteroid(this.randomPosition()));\n    };\n}\n\nGame.prototype.randomPosition = function () {\n    let coordinates = [];\n    coordinates.push(Math.floor(Math.random() * DIM_X));\n    coordinates.push(Math.floor(Math.random() * DIM_Y));\n    return coordinates;\n}\n\nGame.prototype.draw = function(ctx) {\n    ctx.clearRect(0, 0, DIM_X, DIM_Y);\n    this.asteroids.forEach(el => el.draw(ctx));\n}\n\n\nGame.prototype.moveObjects = function() {\n    \n}\nmodule.exports = Game;\n\n// const canvas = document.getElementById('canvas');\n// const ctx = canvas.getContext('2d');\n// ctx.clearRect(0, 0, canvas.width, canvas.height);\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\n\nfunction gameView(ctx) {\n    this.game = new Game();\n    this.ctx = ctx;\n}\n\ngameView.prototype.start = function() {\n    let self = this;\n    setInterval(function() {\n    \n    }, 20)\n}\n\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\ndocument.addEventListener(\"DOMContentLoaded\", function() {\n    const canvas = document.getElementById('game-canvas');\n    canvas.width = 1000;\n    canvas.height = 1000;\n    const context = canvas.getContext('2d');\n    new gameView(context);\n})\n\n//TESTING PURPOSES\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Game = Game;\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options) {\n     \n    this.pos = options[\"pos\"];\n    this.vel = options[\"vel\"];\n    this.radius = options[\"radius\"];\n    this.color = options[\"color\"];\n\n}\n\n// const mo = new MovingObject({\n//     pos: [30, 30],\n//     vel: [10, 10],\n//     radius: 5,\n//     color: \"#00FF00\"\n// });\n\nMovingObject.prototype.draw = function(ctx) {\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n\n    ctx.arc(\n        this.pos[0],\n        this.pos[1],\n        this.radius,\n        0,\n        2 * Math.PI\n        // false\n    );\n\n    ctx.stroke();\n    ctx.fill();\n}\n\n// ctx.beginPath();\n// ctx.arc(100, 75, 50, 0, 2 * Math.PI);\n// ctx.stroke();\n\nMovingObject.prototype.rectangle = function(ctx) {\n    ctx.fillStyle = this.color;\n  ctx.beginPath();\nctx.rect(20, 20, 150, 100);\nctx.stroke();\n\n};\n\n\nmodule.exports = MovingObject;\n\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n        inherits: function(childClass, parentClass) {\n            function surrogate() {};\n            surrogate.prototype = parentClass.prototype;\n            childClass.prototype = new surrogate();\n            childClass.prototype.constructor = childClass;\n    }, \n    randomVec: function (length) {\n        const deg = 2 * Math.PI * Math.random();\n        return this.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    scale: function (vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n// inherits: function inherits(childClass, parentClass\nmodule.exports = Util;\n\n// Function.prototype.inherits = function (parent) {\n//     childClass.prototype = Object.create(parent.prototype);\n//     childClass.prototype.constructor = childClass;\n// };\n\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });