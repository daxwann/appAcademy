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
    }
    this.clickTower();
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
    $(".tower").on("click", (e) => {
      const $currentTower = $(e.currentTarget);
      if (this.$fromTower === null) {
        try {
          this.selectFromTower($currentTower);
        } catch(e) {
          if (e instanceof MoveError) {
            alert(e.msg);
          } else {
            alert(e);
          }
        }
      } else if (this.getTowerIdx($currentTower) === this.getTowerIdx(this.$fromTower)) {
        this.deselectFromTower();
      } else {
        try {
          this.moveToTower($currentTower);
          this.checkWin();
        } catch(e) {
          if (e instanceof MoveError) {
            alert(e.msg);
          } else {
            alert(e);
          }
        }
      }
    });
  }

  selectFromTower($tower) {
    const fromTowerIdx = this.getTowerIdx($tower);

    if (!this.game.board.isValidStart(fromTowerIdx)) {
      throw new MoveError("Can't start from tower with no disk");
    }

    this.$fromTower = $tower;
    this._toggleHighlight($tower);
  }

  deselectFromTower() {
    this._toggleHighlight(this.$fromTower);
    this.$fromTower = null;
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
      this.deselectFromTower();
    } else {
      throw new MoveError("Cannot move disk to this tower");
    }
  }

  getTowerIdx($tower) {
    const idx = parseInt($tower.data("pos"));
    return idx; 
  }

  checkWin() {
    if (this.game.board.isWon()) {
      $(".tower").off("click");
      const win = $("<p>You win!</p>");
      this.$rootDom.append(win);
    }
  }
}

module.exports = HanoiView;