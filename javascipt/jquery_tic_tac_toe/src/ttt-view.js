const MoveError = require("./moveError.js");

class View {
  constructor(game, $el) {
    this.game = game;
    this.$tttDom = $el;
  }

  bindEvents() {
    const boundHandler = this.makeMoveOnClick.bind(this);
    $(".board").on("click", ".square", boundHandler);
  }

  unbindEvents() {
    $(".board").off("click");
  }

  makeMoveOnClick(e) {
    this.makeMove($(e.currentTarget));
  }

  makeMove($square) {
    const pos = $square.data("pos").split(",").map(p => parseInt(p));
    const mark = this.game.currentPlayer;
    try {
      const currentPlayer = this.game.currentPlayer;
      this.game.playMove(pos);
      $square.append(currentPlayer);
      this.checkGame();
    } catch(e) {
      if (e instanceof MoveError) {
        alert(e.msg);
      } else {
        alert(e);
      }
    }
  }

  checkGame() {
    if (this.game.winner()) {
      this.unbindEvents();
      this.displayWinner();
    } else if (this.game.isOver()) {
      this.unbindEvents();
      this.displayDraw();
    }
  }

  displayWinner() {
    const $winner = $(`<p>Game over. ${this.game.winner()} won!</p>`);
    this.$tttDom.append($winner);
  }

  displayDraw() {
    const $draw = $("<p>Game Over. It's a draw!</p>")
    this.$tttDom.append($draw);
  }

  setupBoard() {
    const $bd = $('<ul class="board"></ul>');
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        let $sq = $(`<li class="square" data-pos=${[row, col]}></li>`);
        $bd.append($sq);
      }
    }
    this.$tttDom.append($bd);
    this.bindEvents();
  }
}

module.exports = View;
