class FollowToggle {
  constructor($el) {
    this.userId = $el.data("userId");
    this.followState = $el.data("initialFollowState");
    this.$followEl = $el;
    this.render();
    this.handleClick();
  }

  render() {
    if (this.followState === "followed") {
      this.$followEl.text("Unfollow");
    } else if (this.followState === "unfollowed") {
      this.$followEl.text("Follow");
    }
  }

  handleClick() {
    this.$followEl.on("click", (e) => {
      e.preventDefault();

      if (this.followState === "unfollowed") {
        $.ajax({
          method: "POST",
          url: `/users/${this.userId}/follow`,
          dataType: "json"
        }).then((r) => {
          this.followState = "followed";
          this.render();
        });
      } else if (this.followState === "followed") {
        $.ajax({
          method: "DELETE",
          url: `/users/${this.userId}/follow`,
          dataType: "json"
        }).then(() => {
          this.followState = "unfollowed";
          this.render();
        });
      }
    });
  }
}

module.exports = FollowToggle;