$(document).ready(function() {
  // load some common HTML
  try {
    $("#sidebar").load("../sidebar.html", function() {
      console.log('info - loaded sidebar');
    });
  } catch(e) {
    console.log('error: ' + e);
  }
  // Toggle spoiler content
  $("#spoiler_button").click(function() { 
      $("#spoiler_content").toggle();
  });

});
