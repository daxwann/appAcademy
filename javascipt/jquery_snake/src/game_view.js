const Board = require("./board.js");

class GameView {
  constructor($root) {
    this.board = new Board(100, 80);
    this.$root = $root;
    this.intervalId = null;
    this.paused = false;
    this.renderBoard();
    this.start();
  }

  start() {
    this.enableKeyEvents();
    this.intervalId = setInterval(this.animate.bind(this), 500);
    this.paused = false;
  }

  pause() {
    this.disableKeyEvents();
    clearInterval(this.intervalId);
    this.paused = true;
  }

  renderBoard() {
    const $board = $(`<ul class="board"></ul>`);
    this.board.grid.forEach((row, i) => {
      row.forEach((tile, k) => {
        const $tile = $(`<li class="tile" data-pos="${[k, i]}"></li>`);
        $board.append($tile);
      });
    });
    this.$root.append($board);
  }

  renderSnake() {
    const positions = this.board.snake.positions();
    
    positions.forEach((pos) => {
      $(`.tile[data-pos="${pos}"]`).addClass("snake");
    });
  }

  renderApple() {
    const applePos = this.board.apple.pos;
    $(`.tile[data-pos="${applePos}"]`).addClass("apple");
  }

  renderObjects() {
    this.clearObjects();
    this.renderSnake();
    this.renderApple();
  }

  clearObjects() {
    $(".tile").removeClass("snake apple");
  }

  enableKeyEvents() {
    $(document).on("keydown", this.handleKeyEvent.bind(this));
  }

  disableKeyEvents() {
    $(document).off("keydown", this.handleKeyEvent.bind(this));
  }

  handleKeyEvent(event) {
    console.log("event");
    switch(event.keyCode || event.which) {
      case 37: //left : turn west
        this.board.snake.turn("W");
        this.animate();
      break;

      case 38: //up : turn north
        this.board.snake.turn("N");
        this.animate();
      break;

      case 39: //right : turn east
        this.board.snake.turn("E");
        this.animate();
      break;

      case 40: //down : turn south
        this.board.snake.turn("S");
        this.animate();
      break;

      case 32: //space : pause
        this.togglePause();
      break;

      case 27: //esc : new game
        this.restart();
      break;
    }
  }

  animate() {
    this.renderObjects();

    if (this.isOver()) {
      this.gameOver();
    } else if (this.board.didSnakeEatApple()) {
      console.log("ate apple")
      this.board.placeRandomApple();
      this.board.snake.addGrowSize();
    } else if (this.board.snake.growSize > 0) {
      this.board.snake.grow();
    } else {
      this.board.snake.move();
    }
  }

  isOver() {
    return !this.board.isSnakeInBound() || this.board.snake.hasEatenItself();
  }

  gameOver() {
    this.pause();
    this.displayOverMessage();
  }

  togglePause() {
    if (this.paused) {
      this.start();
    } else {
      this.pause();
    }
  }

  displayOverMessage() {
    const $msg = $('<p class="over-msg">Game Over</p>');
    this.$root.after($msg);
  }

  restart() {
    this.board = new Board(100, 100);
    this.start()
  }
}

module.exports = GameView;