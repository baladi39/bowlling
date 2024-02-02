class Game {
  List<int> rolls = [for (var i = 1; i < 21; i++) i];
  int currentRoll = 0;

  roll(int pins) {
    currentRoll = currentRoll == 20 ? 0 : currentRoll;
    rolls[currentRoll++] = pins;
  }

  int score() {
    int scorePoints = 0;
    int frameIndex = 0;
    for (int frame = 0; frame < 10; frame++) {
      if (isSpare(frameIndex)) {
        scorePoints += 10 + rolls[frameIndex + 2];
        frameIndex += 2;
      } else if (isStrike(frameIndex)) {
        scorePoints += 10 + rolls[frameIndex + 1] + rolls[frameIndex + 2];
        frameIndex++;
      } else {
        scorePoints += rolls[frameIndex] + rolls[frameIndex + 1];
        frameIndex += 2;
      }
    }
    return scorePoints;
  }

  bool isSpare(int frameIndex) =>
      rolls[frameIndex] + rolls[frameIndex + 1] == 10;
  bool isStrike(int frameIndex) => rolls[frameIndex] == 10;
}
