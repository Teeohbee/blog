describe('Ranking', function() {
  ranking = new Ranking();

  beforeEach(function() {
    jasmine.getFixtures().fixturesPath='http//:localhost:9292';
    loadFixtures('layout.erb');
    $hold.Ready(false);
  });

  describe('displays score', function() {
    it('displays the score 0 at the start', function() {
      expect('#score').toContainText(0);
    });
  });

  describe('increases score', function() {
    it('increases the score by 1 when up is pressed', function() {
      $('#increase').click();
      expect('#score').toContainText(1);
    });
  });

  describe('decreases score', function() {
    it('decreases the score by 1 when down is pressed', function() {
      $('#decrease').click();
      expect('#score').toContainText(-1);
    });
  });
});