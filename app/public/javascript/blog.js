ranking = new Ranking();

displayScore = function() {
  $("#score").text(ranking.showScore());
}

$(document).ready(function() {
  $('#score').show(function() {
    displayScore();
  })
  $("#increase").click(function() {
    ranking.increaseScore();
    displayScore();
  })
  $("#decrease").click(function() {
    ranking.decreaseScore();
    displayScore();
  })
})