const FollowToggle = require("./follow_toggle.js");

$(() => {
  $(".follow-toggle").each((idx, el) => {
    const followToggle = new FollowToggle($(el));
  });
});