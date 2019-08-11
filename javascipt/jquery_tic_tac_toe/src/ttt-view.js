class View {
  constructor(game, $el) {
    this.game = game;
    this.tttDom = $el;
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    const $bd = $('<ul class="board"></ul>');
    for (let i = 0; i < 3; i++) {
      let $sq = $('<li class="square"></li>');
      $bd.append($sq);
    }
    this.tttDom.append($bd);
  }
}

module.exports = View;
