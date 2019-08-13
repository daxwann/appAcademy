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

/***/ "./src/board.js":
/*!**********************!*\
  !*** ./src/board.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Disk = __webpack_require__(/*! ./disk.js */ \"./src/disk.js\");\n\nclass Board {\n  constructor() {\n    this.towers = [[], [], []];\n    this.towers[0] = [new Disk(3), new Disk(2), new Disk(1)];\n  }\n\n  isValidStart(startIdx) {\n    let startTowerLength = this.towers[startIdx].length;\n\n    if (startTowerLength === 0) {\n      return false;\n    }\n\n    return true;\n  }\n\n  isValidMove(startIdx, endIdx) {\n    let startTowerLength = this.towers[startIdx].length;\n    let endTowerLength = this.towers[endIdx].length; \n\n    // starting tower has to have at least one disk\n    if (startTowerLength === 0) {\n      return false;\n    }\n\n    // starting and ending tower have to be side by side\n    if (Math.abs(startIdx - endIdx) !== 1) {\n      return false;\n    }\n\n    if (endTowerLength === 0) {\n      return true;\n    }\n\n    // only smaller disks can be on top of bigger disks\n    if (this.towers[startIdx][startTowerLength - 1].size < this.towers[endIdx][endTowerLength - 1].size) {\n      return true;\n    }\n\n    return false;\n  }\n\n  moveDisk(startIdx, endIdx) {\n    let disk = this.towers[startIdx].pop();     \n    this.towers[endIdx].push(disk); \n  }\n\n  isWon(){\n    if (this.towers[2].length === 3) {\n      return true;\n    }\n\n    return false;\n  }\n\n  display() {\n    for (let i = 2; i >= 0; i--) {\n      let rowStr = \" \";\n      for (let j = 0; j <= 2; j++) {\n        if (this.towers[j][i]) {\n          rowStr += this.towers[j][i].toStr(); \n        } else {\n          rowStr += '|';\n        }\n        rowStr += \" \";\n      }\n      console.log(rowStr);\n    };\n    console.log(\" - - - \");\n    console.log(\" 1 2 3 \");\n  }\n}\n\nmodule.exports = Board;\n// test\n/*\nlet bd = new Board;\nbd.display();\nconsole.log(\"move disk\");\nbd.moveDisk(0, 1);\nbd.display();\nconsole.log(bd.isValidMove(0, 1));\nconsole.log(bd.isValidMove(1, 2));\n\n*/\n\n\n//# sourceURL=webpack:///./src/board.js?");

/***/ }),

/***/ "./src/disk.js":
/*!*********************!*\
  !*** ./src/disk.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class Disk {\n  constructor(size) {\n    this.size = size;\n  }\n\n  toStr() {\n    return this.size.toString(); \n  }\n}\n\nmodule.exports = Disk;\n\n// test\n/*\nlet disk1 = new Disk(1);\nconsole.log(disk1.toStr());\n*/\n\n\n\n//# sourceURL=webpack:///./src/disk.js?");

/***/ }),

/***/ "./src/hanoi_game.js":
/*!***************************!*\
  !*** ./src/hanoi_game.js ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const board = __webpack_require__(/*! ./board.js */ \"./src/board.js\");\n\nclass HanoiGame {\n  constructor() {\n    this.board = new board;\n  }\n\n  run(reader, completionCallback) {\n    // Until all disks are moved to last tower:\n    //  1. prints stack\n    //  2. ask user for move\n    //  3. move disk from starting position to ending position\n    // Invoke completionCallback \n    this.board.display();\n    \n    if (this.board.isWon()) {\n      completionCallback();\n      return;\n    }\n\n    this.askForStartIdx(reader, completionCallback);\n  }\n\n  askForStartIdx(reader, completionCallback) {\n    reader.question(\"Please enter tower number where you want to move disk from: \", (res) => {\n      let startTower = parseInt(res);\n      // check input to be between 1 and 3\n      if (isNaN(startTower) || startTower < 1 || startTower > 3 ) {\n        console.log(\"Please enter number between 1 to 3\");\n        this.askForStartIdx(reader, completionCallback);\n        return;\n      }\n\n      let startIdx = startTower - 1;\n\n      // check if selected tower has disk to move \n      if (this.board.towers[startIdx].length === 0) {\n        console.log(`Tower ${startTower} is empty`);\n        this.askForStartIdx(reader, completionCallback);\n        return;\n      }\n      // ask for tower to move to\n      this.askForEndIdx(reader, startIdx, completionCallback, (startIdx, endIdx) => {\n        this.board.moveDisk(startIdx, endIdx);\n        this.run(reader, completionCallback);\n      }); \n    });\n  }\n\n  askForEndIdx(reader, startIdx, completionCallback, cb) {\n    reader.question(\"Please enter tower number where you want to move disk to: \", (res) => {\n      let endTower = parseInt(res);\n\n      if (isNaN(endTower) || endTower < 1 || endTower > 3 ) {\n        console.log(\"Please enter number between 1 to 3\");\n        this.askForEndIdx(reader, startIdx, completionCallback, cb);\n        return;\n      }\n\n      let endIdx = endTower - 1;\n\n      if (!this.board.isValidMove(startIdx, endIdx)) {\n        console.log(\"Invalid move\");\n        this.askForStartIdx(reader, completionCallback);\n        return;\n      }\n\n      cb(startIdx, endIdx); \n    });\n  }\n}\n\nmodule.exports = HanoiGame;\n\n\n//# sourceURL=webpack:///./src/hanoi_game.js?");

/***/ }),

/***/ "./src/hanoi_view.js":
/*!***************************!*\
  !*** ./src/hanoi_view.js ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MoveError = __webpack_require__(/*! ./move_error.js */ \"./src/move_error.js\");\n\nclass HanoiView {\n  constructor(game, $el) {\n    this.game = game;\n    this.$rootDom = $el;\n    this.$fromTower = null;\n    this.setupTowers();\n    this.render();\n  }\n\n  setupTowers() {\n    for (let i = 0; i < 3; i++) {\n      const $tower = $(`<ul class=\"tower\" data-pos=\"${i}\"></ul>`);\n\n      this.$rootDom.append($tower);\n      this.clickTower();\n    }\n  }\n\n  render() {\n    $(\".tower\").empty();\n    this.game.board.towers.forEach((t, i) => {\n      for (let c = t.length - 1; c >= 0; c--) {\n        const $disk = $(`<li class=\"disk\" data-size=\"${t[c].size}\"></li>`);\n        $(`.tower[data-pos=\"${i}\"]`).append($disk);\n      }\n    });\n  }\n\n  clickTower() {\n    this.$rootDom.on(\"click\", \".tower\", (e) => {\n      console.log('clicked tower');\n      const $currentTower = $(e.currentTarget);\n      if (this.$fromTower === null) {\n        this.toggleFromTower($currentTower);\n      } else if ($currentTower === this.$fromTower) {\n        this.toggleFromTower($currentTower);\n      } else {\n        this.moveToTower($currentTower);\n      }\n    });\n  }\n\n  toggleFromTower($tower) {\n    if (!this.game.board.isValidStart(this.getTowerIdx($tower))) {\n      throw new MoveError(\"Can't start from tower with no disk\");\n      return null;\n    }\n\n    if (this.$fromTower === null) {\n      this.$fromTower = $tower;\n      this._toggleHighlight($tower);\n    } else {\n      this.$fromTower = null;\n      this._toggleHighlight($tower);\n    }\n  }\n\n  _toggleHighlight($tower) {\n    $tower.toggleClass(\"highlight\");\n  }\n\n  moveToTower($toTower) {\n    const fromTowerIdx = this.getTowerIdx(this.$fromTower);\n    const toTowerIdx = this.getTowerIdx($toTower);\n    if (this.game.board.isValidMove(fromTowerIdx, toTowerIdx)) {\n      this.game.board.moveDisk(fromTowerIdx, toTowerIdx);\n      this.render();\n      this.toggleFromTower(this.$fromTower);\n    } else {\n      throw new MoveError(\"Cannot move disk to this tower\");\n    }\n  }\n\n  getTowerIdx($tower) {\n    return parseInt($tower.data(\"pos\"));\n  }\n\n}\n\nmodule.exports = HanoiView;\n\n//# sourceURL=webpack:///./src/hanoi_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const HanoiGame = __webpack_require__(/*! ./hanoi_game.js */ \"./src/hanoi_game.js\");\nconst HanoiView = __webpack_require__(/*! ./hanoi_view.js */ \"./src/hanoi_view.js\");\n\n$(() => {\n  const rootEl = $('.hanoi');\n  const game = new HanoiGame();\n  new HanoiView(game, rootEl);\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/move_error.js":
/*!***************************!*\
  !*** ./src/move_error.js ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const MoveError = function(msg) {\n  this.msg = msg;\n}\n\nmodule.exports = MoveError;\n\n//# sourceURL=webpack:///./src/move_error.js?");

/***/ })

/******/ });