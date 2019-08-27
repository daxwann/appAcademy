const APIUtils = require("./api_utils.js");

class UsersSearch {
  constructor($el) {
    this.$searchEl = $el;
    this.$input = $($el.find("input")[0]);
    this.$resultList = $($el.find("ul")[0]);
    this.handleInput();
  }

  handleInput() {
    this.$input.on("input", (e) => {
      APIUtils.searchUsers($(e.currentTarget).val()).then(this.displayResults.bind(this));
    })
  }

  displayResults(res) {
    this.$resultList.empty();
    console.log(res);
    res.forEach((user) => {
      console.log(user);
      this.$resultList.append(`<li><a href="/users/${user.id}">${user.username}</a></li>`);
    })
  }
}

module.exports = UsersSearch;