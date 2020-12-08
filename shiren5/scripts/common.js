$(document).ready(function() {
  // load some common HTML
  try {
    $("#sidebar").load("../sidebar.html", function() {
      console.log('info - loaded sidebar');
    });
  } catch(e) {
    console.log('error: ' + e);
  }
  // Toggle boss content on dungeon pages
  $("#boss_button").click(function() { 
      $("#boss_content").toggle();
  });
});
