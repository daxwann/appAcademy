class FollowToggle {
  constructor($el) {
    $followEl = $el;
    this.userId = $followEl.data("user-id");
    this.followState = $followEl.data("initial-follow-state");
    this.$followEl = $followEl;
    this.render();
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
          url: `/users/${}/follow`,
          data: {user_id: }
          dataType: "json"
        }).then(() => {
          this.followState = "followed";
          this.render();
        })
      } else if (this.followState === "followed") {
        $.ajax({
          method: "DELETE",
          url: `/users/${this.userId}/follow`,
        }).then(() => {
          this.followState = "unfollowed";
          this.render();
        }
      }
    });
  }
}

module.exports = FollowToggle;