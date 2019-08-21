const Board = require("./board.js");

class GameView {
  constructor($root) {
    this.board = new Board(100, 100);
    this.$root = $root;
    this.renderBoard();
    this.play();
  }

  play() {
    this.setKeyEvents();

  }

  renderBoard() {
    this.board.grid.forEach((row, i) => {
      const $row = $(`<ul class="row"></ul>`);
      row.forEach((tile, k) => {
        const $tile = $(`<li class="tile" data-pos="${[k, i]}"></li>`);
        $row.append($tile);
      });
      this.$root.append($row);
    });
  }

  renderSnake() {

  }

  renderApple() {

  }

  enableKeyEvents() {
    $(document).on("keypress", this.handleKeyEvent);
  }

  handleKeyEvent(event) {
    switch(event.keyCode || event.which) {
      case 37: //left : turn west
      break;

      case 38: //up : turn north
      break;

      case 39: //right : turn east
      break;

      case 40: //down : turn south
      break;

      case 32: //space : pause
      break;

      case 27: //esc : new game
      break;
    }
  }

  gameOver() {

  }
}