class DrawScore {
  float counter;
  float time;  // duration of pop-up in seconds
  int reward;
  float x;
  float y;
  int a = 255;
  
  DrawScore(float xPos, float yPos, int enemyReward, float visibleTime) {  
    reward = enemyReward;
    x = xPos;
    y = yPos;
    time = visibleTime;
  }
  
  void drawEnemyScore() {
    counter += (float) 1/60;
    if (counter <= time) {
      a-=2;
      y--;
      fill(255, 255, 0, a);
      text("+" + reward, x, y);
    }
  }
  
  void drawPlayerDamage() {
    counter += (float) 1/60;
    if (counter <= time) {
      a-=2;
      y--;
      fill(255, 0, 0, a);
      text("-" + reward, x, y);
    }
  }
}
