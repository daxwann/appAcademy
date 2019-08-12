class HanoiView {
  constructor(game, $el) {
    this.game = game;
    this.$rootDom = $el;
    this.setupTowers();
    this.render();
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      const $tower = $(`<ul class="tower" data-pos="${i}"></ul>`);

      this.$rootDom.append($tower);
    }
  }

  render() {
    this.game.board.towers.forEach((t, i) => {
      for (let c = t.length - 1; c >= 0; c--) {
        const $disk = $(`<li class="disk" data-size="${t[c].size}"></li>`);
        $(`.tower[data-pos="${i}"]`).append($disk);
      }
    });
  }
}

module.exports = HanoiView;