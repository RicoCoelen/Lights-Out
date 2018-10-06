class BigEnemy {
  
  // vars
  float x, y, vx, vy;
  int h = 100;
  int w = 50;

  /*
  Function to instantiate the enemy
  */
  BigEnemy() {
    // position
    x = 500;
    y = 30;
    // velocity
    vx = -0.6;
    vy = 0;
  }

  /*
  Function to update the movement of the enemy
  */
  void update() {
    // movement
    x += vx;
    y += vy;
  }

  /*
  Function to draw the enemy on the screen
  */
  void draw() {
    rect(x, y, w, h);
  }
}
