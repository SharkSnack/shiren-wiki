$(document).ready(function() {
  // load some common HTML
  try {
    $("#sidebar").load("../sidebar.html", function() {
      console.log('info - loaded sidebar');
    });
  } catch(e) {
    console.log('error: ' + e);
  }
});
