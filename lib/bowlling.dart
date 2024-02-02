import 'package:bowlling/game.dart';

var game = Game();

rollMany(int n, int pins) {
  for (int i = 0; i < n; i++) {
    game.roll(pins);
  }
}

void simulateGame() {
  game.roll(10);
  game.roll(3);
  game.roll(4);
  rollMany(17, 0);
  var finalScore = game.score();
  print(finalScore);
}
