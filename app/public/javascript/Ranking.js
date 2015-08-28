var Ranking = function() {
  this.score = 0;
};

Ranking.prototype.showScore = function() {
  return this.score;
};

Ranking.prototype.increaseScore = function() {
  return this.score +=1;
};

Ranking.prototype.decreaseScore = function() {
  return this.score -=1;
};