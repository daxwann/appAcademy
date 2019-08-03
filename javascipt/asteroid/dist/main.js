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

eval("const Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction Asteroid(option) {\n  MovingObject.call(this, { pos: option.pos, vel: Utils.randomVec(1), radius: Asteroid.RADIUS, color: Asteroid.COLOR, game: option.game });\n}\n\nAsteroid.COLOR = \"#8BE371\";\nAsteroid.RADIUS = 40;\n\nUtils.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function(otherObj) {\n  if (otherObj instanceof Ship) {\n    otherObj.relocate(this.game.randomPosition());\n  } else {\n    this.game.remove(this);\n    this.game.remove(otherObj);\n  }\n}\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nfunction Game() {\n  this.asteroids = [];\n  this.addAsteroids();\n  this.ship = new Ship({pos: this.centerPosition(), game: this});\n}\n\nGame.DIM_X = window.innerWidth;\nGame.DIM_Y = window.innerHeight;\nGame.NUM_ASTEROIDS = 5;\n\nGame.prototype.addAsteroids = function() {\n  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n    let ast = new Asteroid( { pos: this.randomPosition(), game: this} );\n    this.asteroids.push(ast);\n  }\n}\n\nGame.prototype.allObjects = function() {\n  return this.asteroids.concat([this.ship]);\n};\n\nGame.prototype.randomPosition = function() {\n  let x = Math.random() * Game.DIM_X;\n  let y = Math.random() * Game.DIM_Y;\n  return [x, y];\n};\n\nGame.prototype.centerPosition = function() {\n  let x = 0.5 * Game.DIM_X;\n  let y = 0.5 * Game.DIM_Y;\n  return [x, y];\n}\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n  let allObj = this.allObjects();\n  allObj.forEach((obj) => {\n    obj.draw(ctx);\n  });\n};\n\nGame.prototype.moveObjects = function() {\n  let allObj = this.allObjects();\n  allObj.forEach((obj) => {\n    obj.move();\n  });\n};\n\nGame.prototype.wrap = function(pos) {\n  let [x, y] = pos;\n  if (x > Game.DIM_X) {\n    x = 0;\n  }\n\n  if (x < 0) {\n    x = Game.DIM_X;\n  }\n\n  if (y > Game.DIM_Y) {\n    y = 0;\n  }\n\n  if (y < 0) {\n    y = Game.DIM_Y;\n  }\n\n  return [x, y];\n}\n\nGame.prototype.checkCollision = function() {\n  let allObj = this.allObjects();\n  this.asteroids.forEach((ast, idx1) => {\n    allObj.forEach((obj, idx2) => {\n      if (idx2 <= idx1) {\n        return;\n      }\n\n      if (ast === obj) {\n        return;\n      }\n\n      if (ast.isCollidedWith(obj)) {\n        ast.collideWith(obj);\n      }\n    });\n  });\n};\n\nGame.prototype.remove = function(asteroid) {\n  this.asteroids = this.asteroids.filter((ast) => {\n      return ast !== asteroid;\n  });\n};\n\nGame.prototype.step = function() {\n  this.moveObjects();\n  this.checkCollision();\n};\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView() {\n  this.game = new Game();\n  this.ctx = this.setContext();\n}\n\nGameView.prototype.start = function() {\n  this.bindKeyHandlers();\n  setInterval(() => {\n    this.game.step();\n    this.game.draw(this.ctx);\n  }, 20);\n}\n\nGameView.prototype.setContext = function() {\n  const canvas = document.getElementById(\"game-canvas\");\n  canvas.height = window.innerHeight;\n  canvas.width = window.innerWidth;\n\n  const ctx = canvas.getContext(\"2d\");\n  return ctx;\n};\n\nGameView.prototype.bindKeyHandlers = function() {\n  key('w', () => {\n    this.game.ship.accelerate();\n  });\n\n  key('s', () => {\n    this.game.ship.deccelerate();\n  });\n\n  key('a', () => {\n    this.game.ship.turnLeft();\n  });\n\n  key('d', () => {\n    this.game.ship.turnRight();\n  });\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\ndocument.addEventListener(\"DOMContentLoaded\", (e) => {\n  const gv = new GameView();\n  gv.start();\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction MovingObject(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n  let [x, y] = this.pos;\n  let [dx, dy] = this.vel;\n  this.pos = this.game.wrap([x + dx, y + dy]);\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObj) {\n  let dX = Math.abs(this.pos[0] - otherObj.pos[0]);\n  let dY = Math.abs(this.pos[1] - otherObj.pos[1]);\n  let centerDist = Math.sqrt(dX ** 2 + dY ** 2);\n  if (centerDist <= this.radius + otherObj.radius) {\n    return true;\n  }\n\n  return false;\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\nfunction Ship(option) {\n  MovingObject.call(this, {pos: option.pos, vel: [0, 0], radius: Ship.RADIUS, color: Ship.COLOR, game: option.game});\n  this.dir = 0.25;\n  this.speed = 0;\n}\n\nShip.COLOR = \"#797BE8\";\nShip.RADIUS = 10;\n\nUtils.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function(newPos) {\n  this.pos = newPos;\n};\n\nShip.prototype.accelerate = function() {\n  if (this.speed < 50) {\n    this.speed += 0.1;\n  }\n  this.vel = Utils.controlledVec(this.dir, this.speed);\n};\n\nShip.prototype.deccelerate = function() {\n  if (this.speed > 0) {\n    this.speed -= 0.1;\n  }\n  this.vel = Utils.controlledVec(this.dir, this.speed);\n};\n\nShip.prototype.turnLeft = function() {\n  this.dir = Math.round(((1 + (this.dir + 0.01) % 1) % 1) * 100) / 100;\n  this.vel = Utils.controlledVec(this.dir, this.speed);\n  console.log(this.dir);\n};\n\nShip.prototype.turnRight = function() {\n  this.dir = Math.round(((1 + (this.dir - 0.01) % 1) % 1) * 100) / 100;\n  this.vel = Utils.controlledVec(this.dir, this.speed);\n  console.log(this.dir);\n};\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("// utility code, esp vector stuff\n\nconst Utils = {\n  inherits: function(childClass, parentClass) {\n    childClass.prototype = Object.create(parentClass.prototype);\n    childClass.prototype.constructor = childClass;\n  },\n\n  randomVec: function(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Utils.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n\n  controlledVec: function(dir, speed) {\n    const deg = 2 * Math.PI * dir;\n    return Utils.scale([Math.sin(deg), Math.cos(deg)], speed);\n  },\n\n  scale: function(vec, mag) {\n    return [vec[0] * mag, vec[1] * mag];\n  }\n}\n\nmodule.exports = Utils;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });