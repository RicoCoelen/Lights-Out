class SmallEnemy {
  
  // vars
  float x, y, vx, vy;
  int h = 100;
  int w = 60;

  /*
  Function to instantiate the enemy
  */
  SmallEnemy() {
    // position
    x = 500;
    y = 350;
    // velocity
    vx = -0.5;
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
  Function to draw the  on the screen
  */
  void draw() {
    // draw body
    rect(x, y, w, h);
  }
}
