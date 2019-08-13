const MoveError = require("./move_error.js");

class HanoiView {
  constructor(game, $el) {
    this.game = game;
    this.$rootDom = $el;
    this.$fromTower = null;
    this.setupTowers();
    this.render();
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      const $tower = $(`<ul class="tower" data-pos="${i}"></ul>`);

      this.$rootDom.append($tower);
      this.clickTower();
    }
  }

  render() {
    $(".tower").empty();
    this.game.board.towers.forEach((t, i) => {
      for (let c = t.length - 1; c >= 0; c--) {
        const $disk = $(`<li class="disk" data-size="${t[c].size}"></li>`);
        $(`.tower[data-pos="${i}"]`).append($disk);
      }
    });
  }

  clickTower() {
    this.$rootDom.on("click", ".tower", (e) => {
      console.log('clicked tower');
      const $currentTower = $(e.currentTarget);
      if (this.$fromTower === null) {
        this.toggleFromTower($currentTower);
      } else if ($currentTower === this.$fromTower) {
        this.toggleFromTower($currentTower);
      } else {
        this.moveToTower($currentTower);
      }
    });
  }

  toggleFromTower($tower) {
    if (!this.game.board.isValidStart(this.getTowerIdx($tower))) {
      throw new MoveError("Can't start from tower with no disk");
      return null;
    }

    if (this.$fromTower === null) {
      this.$fromTower = $tower;
      this._toggleHighlight($tower);
    } else {
      this.$fromTower = null;
      this._toggleHighlight($tower);
    }
  }

  _toggleHighlight($tower) {
    $tower.toggleClass("highlight");
  }

  moveToTower($toTower) {
    const fromTowerIdx = this.getTowerIdx(this.$fromTower);
    const toTowerIdx = this.getTowerIdx($toTower);
    if (this.game.board.isValidMove(fromTowerIdx, toTowerIdx)) {
      this.game.board.moveDisk(fromTowerIdx, toTowerIdx);
      this.render();
      this.toggleFromTower(this.$fromTower);
    } else {
      throw new MoveError("Cannot move disk to this tower");
    }
  }

  getTowerIdx($tower) {
    return parseInt($tower.data("pos"));
  }

}

module.exports = HanoiView;