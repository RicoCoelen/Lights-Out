class BigEnemy {
  
  // vars
  float x, y, vx, vy;
  int h = 175;
  int w = 100;

  /*
  Function to instantiate the enemy
  */
  BigEnemy() {
    // position
    x = 500;
    y = 30;
    // velocity
    vx = -0.2;
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
    // draw body
    rect(x, y, w, h);
    // draw line of collision
    rect(x, (y + h) - 5, -170, 5);
  }
}
