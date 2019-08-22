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

/***/ "./src/apple.js":
/*!**********************!*\
  !*** ./src/apple.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class Apple {\n  constructor() {\n    this.pos = null;\n  }\n\n  randPos(bd) {\n    let x = 0;\n    let y = 0;\n\n    do {\n      x = Math.floor(bd.width * Math.random());\n      y = Math.floor(bd.height * Math.random());\n    } while (bd.grid[y][x] !== null);\n\n    this.pos = [x, y];\n    return [x, y];\n  }\n}\n\nmodule.exports = Apple;\n\n//# sourceURL=webpack:///./src/apple.js?");

/***/ }),

/***/ "./src/board.js":
/*!**********************!*\
  !*** ./src/board.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Snake = __webpack_require__(/*! ./snake.js */ \"./src/snake.js\");\nconst Apple = __webpack_require__(/*! ./apple.js */ \"./src/apple.js\");\n\nclass Board {\n  constructor(x, y) {\n    this.width = x;\n    this.height = y;\n    this.snake = new Snake([Math.floor(x / 2), Math.floor(y / 2)]);\n    this.grid = Board.makeGrid(x, y);\n    this.apple = new Apple();\n    this.placeRandomApple();\n  }\n\n  isSnakeInBound() {\n    return this.snake.positions().every((pos) => {\n      return this.isInBound(pos);\n    })\n  }\n\n  didSnakeEatApple() {\n    return JSON.stringify(this.snake.head.pos) === JSON.stringify(this.apple.pos);\n  }\n\n  isMatchingPos(pos1, pos2) {\n    return JSON.stringify(pos1) === JSON.stringify(this.pos2);\n  }\n\n  placeRandomApple() {\n    this.apple.pos = this.apple.randPos(this);\n  }\n\n  isInBound(pos) {\n    const [x, y] = pos;\n\n    if (x < 0 || y < 0 || x >= this.width || y >= this.height) {\n      return false;\n    }\n\n    return true;\n  }\n\n  static makeGrid(x, y) {\n    const grid = [];\n\n    for (let i = 0; i < y; i++) {\n      grid.push([]);\n      for (let k = 0; k < x; k++) {\n        grid[i].push(null);\n      }\n    }\n\n    return grid;\n  }\n}\n\nmodule.exports = Board;\n\n//# sourceURL=webpack:///./src/board.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Board = __webpack_require__(/*! ./board.js */ \"./src/board.js\");\n\nclass GameView {\n  constructor($root) {\n    this.board = new Board(100, 80);\n    this.$root = $root;\n    this.intervalId = null;\n    this.paused = false;\n    this.renderBoard();\n    this.start();\n  }\n\n  start() {\n    this.enableKeyEvents();\n    this.intervalId = setInterval(this.animate.bind(this), 500);\n    this.paused = false;\n  }\n\n  pause() {\n    this.disableKeyEvents();\n    clearInterval(this.intervalId);\n    this.paused = true;\n  }\n\n  renderBoard() {\n    const $board = $(`<ul class=\"board\"></ul>`);\n    this.board.grid.forEach((row, i) => {\n      row.forEach((tile, k) => {\n        const $tile = $(`<li class=\"tile\" data-pos=\"${[k, i]}\"></li>`);\n        $board.append($tile);\n      });\n    });\n    this.$root.append($board);\n  }\n\n  renderSnake() {\n    const positions = this.board.snake.positions();\n    \n    positions.forEach((pos) => {\n      $(`.tile[data-pos=\"${pos}\"]`).addClass(\"snake\");\n    });\n  }\n\n  renderApple() {\n    const applePos = this.board.apple.pos;\n    $(`.tile[data-pos=\"${applePos}\"]`).addClass(\"apple\");\n  }\n\n  renderObjects() {\n    this.clearObjects();\n    this.renderSnake();\n    this.renderApple();\n  }\n\n  clearObjects() {\n    $(\".tile\").removeClass(\"snake apple\");\n  }\n\n  enableKeyEvents() {\n    $(document).on(\"keydown\", this.handleKeyEvent.bind(this));\n  }\n\n  disableKeyEvents() {\n    $(document).off(\"keydown\", this.handleKeyEvent.bind(this));\n  }\n\n  handleKeyEvent(event) {\n    console.log(\"event\");\n    switch(event.keyCode || event.which) {\n      case 37: //left : turn west\n        this.board.snake.turn(\"W\");\n        this.animate();\n      break;\n\n      case 38: //up : turn north\n        this.board.snake.turn(\"N\");\n        this.animate();\n      break;\n\n      case 39: //right : turn east\n        this.board.snake.turn(\"E\");\n        this.animate();\n      break;\n\n      case 40: //down : turn south\n        this.board.snake.turn(\"S\");\n        this.animate();\n      break;\n\n      case 32: //space : pause\n        this.togglePause();\n      break;\n\n      case 27: //esc : new game\n        this.restart();\n      break;\n    }\n  }\n\n  animate() {\n    this.renderObjects();\n\n    if (this.isOver()) {\n      this.gameOver();\n    } else if (this.board.didSnakeEatApple()) {\n      console.log(\"ate apple\")\n      this.board.placeRandomApple();\n      this.board.snake.addGrowSize();\n    } else if (this.board.snake.growSize > 0) {\n      this.board.snake.grow();\n    } else {\n      this.board.snake.move();\n    }\n  }\n\n  isOver() {\n    return !this.board.isSnakeInBound() || this.board.snake.hasEatenItself();\n  }\n\n  gameOver() {\n    this.pause();\n    this.displayOverMessage();\n  }\n\n  togglePause() {\n    if (this.paused) {\n      this.start();\n    } else {\n      this.pause();\n    }\n  }\n\n  displayOverMessage() {\n    const $msg = $('<p class=\"over-msg\">Game Over</p>');\n    this.$root.after($msg);\n  }\n\n  restart() {\n    this.board = new Board(100, 100);\n    this.start()\n  }\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\n$(() => {\n  const $root = $(\".snake-game\");\n  const gameView = new GameView($root);\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/segment.js":
/*!************************!*\
  !*** ./src/segment.js ***!
  \************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class Segment {\n  constructor(pos, dir=[0, 0], front=null) {\n    this.pos = pos,\n    this.dir = dir,\n    this.front = front,\n    this.back = null\n  }\n\n  changeDir(dir) {\n    this.dir = dir;\n  }\n\n  move() {\n    const [x, y] = this.pos;\n    const [dx, dy] = this.dir;\n\n    this.pos = [x + dx, y + dy];\n  }\n\n  addToBack() {\n    const [x, y] = this.pos;\n    const [dx, dy] = this.dir;\n    const newSegPos = [x - dx, y - dy];\n    const prevBack = this.back;\n\n    // create new segment behind current segment\n    this.back = new Segment(newSegPos, this.dir, this);\n\n    // link rest of snake to new segment\n    if (prevBack) {\n      prevBack.front = this.back;\n      this.back.back = prevBack;\n    }\n  }\n}\n\nmodule.exports = Segment;\n\n//# sourceURL=webpack:///./src/segment.js?");

/***/ }),

/***/ "./src/snake.js":
/*!**********************!*\
  !*** ./src/snake.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Segment = __webpack_require__(/*! ./segment.js */ \"./src/segment.js\");\n\nclass Snake {\n  constructor(startPos=[50,50]) {\n    this.head = new Segment(startPos);\n    this.growSize = 0;\n  }\n\n  turn(dir, seg=this.head) {\n    const [x, y] = Snake.DIRECTIONS[dir];\n\n    if (this.positions().length > 1 && dir === this.oppositeDir(this.dir)) {\n      return;\n    }\n    seg.changeDir(vel);\n  }\n\n  oppositeDir(dir) {\n    switch(dir) {\n      case \"S\":\n        return \"N\";\n      case \"N\":\n        return \"S\";\n      case \"E\":\n        return \"W\";\n      case \"W\":\n        return \"E\";\n    }\n  }\n\n  move(seg=this.head) {\n    seg.move();\n  \n    if (seg.back) {\n      this.move(seg.back);\n      seg.back.changeDir(seg.dir);\n    }\n  }\n\n  addGrowSize() {\n    this.growSize += Snake.GROWSIZE;\n  }\n\n  grow() {\n    if (this.growSize <= 0) {\n      return;\n    }\n\n    this.head.move();\n    this.head.addToBack();\n    this.growSize -= 1;\n  }\n\n  positions(start=this.head) {\n    const positions = [];\n\n    while (start) {\n      positions.push(start.pos);\n      start = start.back;\n    }\n\n    return positions;\n  }\n\n  hasEatenItself() {\n    const bodyPos = this.positions(this.head.back);\n\n    return bodyPos.some((pos) => {\n      return JSON.stringify(pos) === JSON.stringify(this.head.pos);\n    });\n  }\n}\n\nSnake.DIRECTIONS = {\n  \"N\": [0, -1],\n  \"E\": [1, 0],\n  \"S\": [0, 1],\n  \"W\": [-1, 0] \n}\n\nSnake.GROWSIZE = 5;\n\nmodule.exports = Snake;\n\n//# sourceURL=webpack:///./src/snake.js?");

/***/ })

/******/ });