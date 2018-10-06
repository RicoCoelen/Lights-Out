class MediumEnemy {
  
  // vars
  float x, y, vx, vy;
  int h = 75;
  int w = 45;

  /*
  Function to instantiate the enemy
  */
  MediumEnemy() {
    // position
    x = 500;
    y = 200;
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
  Function to draw the  on the screen
  */
  void draw() {
    rect(x, y, w, h);
  }
}
