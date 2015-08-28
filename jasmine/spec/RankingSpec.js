describe("Ranking", function(){
  var ranking;

  beforeEach(function() {
    ranking = new Ranking();
  });

  it("the score is set to zero", function() {
    expect(ranking.score).toEqual(0);
  });

  it("increase the score by 1", function() {
    expect(ranking.increaseScore()).toEqual(1);
  });

  it("decreases the score by -1", function() {
    expect(ranking.decreaseScore()).toEqual(-1);
  });

});