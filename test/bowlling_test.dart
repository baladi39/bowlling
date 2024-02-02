import 'package:bowlling/game.dart';
import 'package:test/test.dart';

void main() {
  var game = Game();

  rollMany(int n, int pins) {
    for (int i = 0; i < n; i++) {
      game.roll(pins);
    }
  }

  void roleSpare(Game game) {
    game.roll(5);
    game.roll(5);
  }

  void rollStrike(Game game) {
    game.roll(10);
  }

  test('Test Gutter Ball', () {
    rollMany(20, 0);
    expect(game.score(), 0);
  });
  test('Test All Ones', () {
    rollMany(20, 1);
    expect(game.score(), 20);
  });
  test('Test One Spare', () {
    roleSpare(game);
    game.roll(3);
    rollMany(17, 0);
    expect(game.score(), 16);
  });

  test('Test One Strike', () {
    rollStrike(game);
    game.roll(3);
    game.roll(4);
    rollMany(17, 0);
    expect(game.score(), 24);
  });

  test('Test Perfect Game', () {
    rollMany(20, 10);
    expect(game.score(), 300);
  });
}
