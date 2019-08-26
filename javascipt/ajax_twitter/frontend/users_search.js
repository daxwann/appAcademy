const APIUtils = require("./api_utils.js");

class UsersSearch {
  constructor($el) {
    this.$searchEl = $el;
    this.$input = $el.find("input")[0];
    this.$result = $el.find("ul")[0];
  }
}

module.exports = UsersSearch;