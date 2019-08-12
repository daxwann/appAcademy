class HanoiView {
  constructor(game, $el) {
    this.game = game;
    this.$rootDom = $el;
    this.setupTowers();
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      const $tower = $(`<ul class="tower" data-pos="${i}"></ul>`);

      if (i === 0) {
        this.setupDisks($tower);
      }

      this.$rootDom.append($tower);
    }
  }

  setupDisks($tower0) {
    for (let i = 1; i < 4; i++) {
      const $disk = $(`<li class="disk" data-size="${i}"></li>`);
      $tower0.append($disk);
    }
  }
}

module.exports = HanoiView;