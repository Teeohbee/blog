$(function() {
  var availableTags = '<%= all_tags %>'

  $("#searchtags").autocomplete({
    source: availableTags
  });
});
