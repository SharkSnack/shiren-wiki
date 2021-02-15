// load sidebar
fetch('../sidebar.html')
  .then(response => response.text())
  .then(value => {
    document.getElementById('sidebar').innerHTML = value
  });

document.addEventListener('DOMContentLoaded', function() {

  // toggle spoiler content on spoiler button click
  let spoiler_button = document.querySelector('#spoiler_button');

  if (spoiler_button !== null) {
    spoiler_button.addEventListener("click", e => {
      document.querySelector('#spoiler_content').classList.toggle('hide')
    });
  }

}, false);
